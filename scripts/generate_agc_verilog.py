import xml.etree.ElementTree as ET
import sys
import os
import re

# Simple class representing a pin on a component
class Pin(object):
    def __init__(self, ref, number, type=None, net=None):
        self.number = number
        self.type = type
        self.net = net
        self.ref = ref
    
    def __str__(self):
        # If this pin has a net connected, use the net name.
        # Otherwise, make a "not connected" name using the component ref and pin number
        return self.net if self.net is not None else self.ref + '_' + str(self.number) + '_NC'

# Class representing each component in a schematic
class Component(object):
    def __init__(self, comp, libparts):
        # Load the basics from this component's node
        self.ref = comp.attrib['ref']
        self.type = comp.find('libsource').attrib['part']
        self.initial_values = {}
        self.pins = []
        
        # Look for initial values for all of the parts of this component
        self.load_initial_values(comp)
        
        # Build up a list of pins and their types
        if not self.load_pin_types(libparts):
            raise RuntimeError('Unable to load pin types for %s' % self.ref)
    
    def load_initial_values(self, comp):
        for part in comp.iterfind('.//part'):
            part_unit = part.attrib['unit']
            # Unless otherwise specified, assume everything starts at 0
            self.initial_values[part_unit] = '0'

            # Look for the initial condition field
            for f in part.iterfind('.//field'):
                if f.attrib['name'] == 'Initial':
                    self.initial_values[part_unit] = f.text
                    break
    
    def load_pin_types(self, libparts):
        # Look up this component's part in the netlist's part library. It might
        # either be the official name of the component or one of its aliases.
        for libpart in libparts.iter('libpart'):
            part_name = libpart.attrib['part']
            aliases = [a.text for a in libpart.iterfind('.//alias')]
            pin_num = 1
            if self.type == part_name or self.type in aliases:
                # Found a match! Fill out the pin list with I/O types. Nets will be attached later.
                for pin_def in libpart.iterfind('.//pin'):
                    if str(pin_num) != pin_def.attrib['num']:
                        raise RuntimeError('Pin definitions for %s are out of order' % part_name)
                    self.pins.append(Pin(self.ref, pin_num, pin_def.attrib['type']))
                    pin_num += 1
                
                return True
        return False
        
    def unconnected_pins(self):
        # Return a list of pins with no attached net
        return [pin for pin in self.pins if pin.net is None]

    def __str__(self):
        # Build up a verilog representation of this component
        pin_names = [str(pin) for pin in self.pins]
        type_name = self.type
        if self.ref[0] == 'R':
            if 'VCC' in pin_names:
                return 'pullup %s(%s)' % (self.ref, pin_names[0] if pin_names[0] != 'VCC' else pin_names[1])
            else:
                raise RuntimeError("Error processing resistor %s, not connected to VCC" % self.ref)
        else:
            if type_name[0].isdigit():
                # Lots of parts (like 74xx chips) start with a number, so prepend a U
                # to make Verilog happy
                type_name = 'U' + type_name

            if any([iv == '1' for _,iv in self.initial_values.items()]):
                # If any of the initial conditions for this component are 1, we need to print them out
                ivs = [self.initial_values[part] for part in sorted(self.initial_values.keys())]
                iv_string = ' #(' + ', '.join(ivs) + ') '
            else:
                # Otherwise we'll just let everything default to 0.
                iv_string = ' '

            return type_name + iv_string + self.ref + '(' + ', '.join(pin_names) + ', SIM_RST)'
        
class VerilogGenerator(object):
    def __init__(self, module, root):
        self.module = module
        self.root = root
        self.components = {}
        self.net_types = {}
        
        # Build a list of all of the components for this module
        self.load_components(root.find('components'))
        
        # Build a netlist and attach it to the components
        self.load_nets(root.find('nets'))

    def make_net_name(self, net):
        # Trailing slashes mean negated signals
        name = re.sub('/$', '_n', net.attrib['name'])
        # Otherwise, they're path seperators for a local symbol
        name = name.replace('/','__')
        if name.startswith('Net-'):
            return 'NET_' + net.attrib['code']
        else:
            if name[0].isdigit():
                name = 'n' + name
            return name
    
    def load_components(self, components):
        # Build up the list of components
        libparts = self.root.find('libparts')
        for comp in components.iter('comp'):
            comp_ref = comp.attrib['ref']
            self.components[comp_ref] = Component(comp, libparts)
            
    def load_nets(self, nets):
        # Build the list of nets and attach them to components
        for net in nets.iter('net'):
            net_name = self.make_net_name(net)
            
            # Very, very basic Verilog wire type determination. "External signal"
            # means this net is connected to a connector, and "output connected" means
            # that at least one of the net's connections are to a pin of type "output"
            external_signal = False
            output_connected = False
            for node in net.iter('node'):
                # Attach this net to all of its pins
                ref = node.attrib['ref']
                pin_num = int(node.attrib['pin'])
                
                self.components[ref].pins[pin_num-1].net = net_name
                
                # Determine the wire type
                if ref[0] == 'P':
                    external_signal = True
                if self.components[ref].pins[pin_num-1].type == 'output':
                    output_connected = True
            
            if external_signal:
                if output_connected:
                    net_type = 'output'
                else:
                    net_type = 'input'
            else:
                net_type = 'internal'
                
            self.net_types[net_name] = net_type

    def generate_file(self, filename):
        # Dump verilog to the given filename
        with open(filename, 'w') as f:
            # Necessary inclues
            f.write('`include "components/agc_parts.v"\n\n')
            
            # Write the module name, along with the standard inputs
            f.write('module %s(VCC, GND, SIM_RST' % self.module)
            
            # Assuming P1 is the 'backplane connector', write out its attached
            # pins in order as the module inputs
            for pin in self.components['P1'].pins:
                # Write out all 
                if pin.net == 'VCC' or pin.net == 'GND':
                    continue
                f.write(', ' + pin.net)

            f.write(');\n')
            f.write('    input wire SIM_RST;\n')

            # Write out all of the wire declarations
            for net, net_type in sorted(self.net_types.items()):
                f.write('    ')
                if net_type != 'internal':
                    # For non-internal wires, write out the I/O type
                    f.write('%s ' % net_type)
                f.write('wire %s;\n' % net)
                
            f.write('\n')

            # Finally, dump the list of components
            for ref, comp in sorted(self.components.items()):
                if ref[0] == 'P':
                    continue
                for pin in comp.unconnected_pins():
                    # Make sure we declare any wires for unconnected pins that
                    # wouldn't have made it into the netlist
                    f.write('    wire %s;\n' % pin)

                f.write('    %s;\n' % comp)
            
            # And close out the module
            f.write('endmodule');

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print('Usage: generate_agc_verilog.py <input_file> <ouput_file>')
        sys.exit()

    # Parse the netlist XML
    tree = ET.parse(sys.argv[1])
    root = tree.getroot()

    # Determine the module name and output filename
    filename = sys.argv[2]
    module_path, ext = os.path.splitext(filename)
    module = os.path.basename(module_path)
    if ext == '':
        filename += '.v'
        
    # Make a verilog generator and use it to generate some verilog!
    verilog_generator = VerilogGenerator(module, root)
    verilog_generator.generate_file(filename)
