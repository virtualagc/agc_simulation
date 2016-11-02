import argparse
import re
import os
import glob

parser = argparse.ArgumentParser(description="Generate a backplane module from a folder containing AGC modules")
parser.add_argument("filename", help="Output filename")
parser.add_argument("dir", help="Directory of AGC modules")
parser.add_argument("--fpga", action="store_true", default=False, help="Generate a conglomerated module for FPGA synthesis")
args = parser.parse_args()

modules = glob.glob(os.path.join(args.dir, '*.v'))

inputs = set()
outputs = set()
internals = set()
module_args = {}
module_names = {}
module_contents = {}
wands = set()
wors = set()

for m in modules:
    with open(m, 'r') as f:
        s = f.read()

        # Find the number of the module somewhere in the file (most intramodule signal names should have it)
        module_number = re.search('([AB]\d+)_\d+', s).group(1)

        # Pull out the name of the module and its arguments from the module declaration line
        module_header = re.search('^module ([^(]+)(\(.*?);', s, re.MULTILINE)
        module_name = module_header.group(1)
        module_names[module_number] = module_name
        module_args[module_number] = module_header.group(2)

        # Read the module's output wires
        module_outputs = re.findall('output wire (.*?);(?: //FPGA#(wand|wor))?', s)
        for o in module_outputs:
            if o[0] in inputs:
                # If this module output is already in the set of AGC inputs, then it's an intermodule signal.
                # Remove it from the inputs set and add it to the internals set.
                inputs.remove(o[0])
                internals.add(o[0])
            elif o[0] not in internals:
                # Otherwise, if it's not an internal wire, add it to the outputs set
                outputs.add(o[0])

            # If the wire needs to be wand or wor, mark it so
            if o[1] == 'wand':
                wands.add(o[0])
            elif o[1] == 'wor':
                wors.add(o[0])

        # Read in the module's input wires
        module_inputs = re.findall('(input|inout) wire (.*?);(?: //FPGA#(wand|wor))?', s)
        for i in module_inputs:
            if (i[1] not in outputs) and (i[1] not in internals) and i[0] == 'input':
                # If this input isn't another module's output, or an intermodule signal, add it to the AGC inputs set
                inputs.add(i[1])
            elif i[1] in outputs:
                # If it's in the output set, remove it and mark it as an intermodule signal
                outputs.remove(i[1])
                internals.add(i[1])
            elif i[0] == 'inout':
                # inouts already have both an input and an output... so just say internal for now. We should print stats.
                internals.add(i[1])
                if i[1] in inputs:
                    inputs.remove(i[1])

            if i[2] == 'wand':
                wands.add(i[1])
            elif i[2] == 'wor':
                wors.add(i[1])

        if args.fpga:
            # Capture internal signals
            module_internals = re.findall('^\s*wire (.*?);(?: //FPGA#(wand|wor))?', s, re.MULTILINE)
            for n in module_internals:
                internals.add(n[0])

                # If the wire needs to be wand or wor, mark it so
                if n[1] == 'wand':
                    wands.add(n[0])
                elif n[1] == 'wor':
                    wors.add(n[0])

            # Capture all lines in the module that are necessary for a combined FPGA image
            module_body = ''
            lines = s.split('\n')
            for line in lines:
                if (line and (not 'wire' in line) and (not 'timescale' in line) and 
                        (not 'module' in line) and (not 'pull' in line) and
                        (not 'default_nettype' in line)):
                    # Look for lines that have a codegen comment
                    parts = re.match('(.*?)(U\d+)\((.*?)\); //(.*)', line)
                    if parts is not None:
                        prefix = parts.group(1)
                        part_num = parts.group(2)
                        part_pins = parts.group(3).split(', ')
                        codegen_flags = dict([f.split(':') for f in parts.group(4).split(';')])

                        # Process all of the codegen flags
                        if 'FPGA#bidir' in codegen_flags:
                            # Bidirectional pins, which don't have a good FPGA mapping, are used on this part.
                            # They'll also be marked OD, and receive proxied outputs, so we just need to feed
                            # the post-proxy outputs back in as new inputs
                            bidir_pins = [int(pin) for pin in codegen_flags['FPGA#bidir'].split(',')]
                            for bd_pin in bidir_pins:
                                signal_name = part_pins[bd_pin-1]
                                part_pins.append(signal_name)

                        if 'FPGA#OD' in codegen_flags:
                            flag_value = codegen_flags['FPGA#OD']
                            # This component has open-drain or tristate outputs, and therefore requires proxy wires.
                            # Determine which pins need to be proxied
                            od_pins = [int(pin) for pin in codegen_flags['FPGA#OD'].split(',')]
                            for od_pin in od_pins:
                                # Build up a name for the proxy wire from the component name and pin number
                                signal_name = part_pins[od_pin-1]
                                proxy_name = signal_name + '_' + part_num + '_' + str(od_pin)
                                # Attach the proxy wire, rather than the original net, to the OD pin on the component
                                part_pins[od_pin-1] = proxy_name

                                # All proxy wires are going to be internal, so add them to internals
                                internals.add(proxy_name)

                                # Add an assigment statement that makes the original net follow the value of the proxy wire
                                module_body += '    assign ' + signal_name + ' = ' + proxy_name + ';\n'
                        if 'FPGA#inputs' in codegen_flags:
                            # This component has extra inputs when synthesized for an FPGA
                            new_pins = codegen_flags['FPGA#inputs'].split(',')
                            part_pins.extend(new_pins)
                            inputs |= set(new_pins)

                        if 'FPGA#outputs' in codegen_flags:
                            # This component has extra inputs when synthesized for an FPGA
                            new_pins = codegen_flags['FPGA#outputs'].split(',')
                            part_pins.extend(new_pins)
                            outputs |= set(new_pins)

                        module_body += prefix + part_num + '(' + ', '.join(part_pins) + ');\n'
                    else:
                        module_body += line + '\n'

            module_contents[module_number] = module_body


# These should always end up in the input set -- they're special, so we want to handle them separately
inputs.remove('p4VDC')
inputs.remove('p4VSW')
inputs.remove('GND')
inputs.remove('SIM_RST')
inputs.remove('SIM_CLK')

sorted_inputs = sorted(inputs)
sorted_outputs = sorted(outputs)
sorted_internals = sorted(internals)

with open(args.filename, 'w') as f:
    f.write('`timescale 1ns/1ps\n')
    f.write('`default_nettype none\n\n')

    # Write the module declaration
    f.write('module ');
    if args.fpga:
        f.write('fpga_')
    f.write('agc(p4VDC, p4VSW, GND, SIM_RST, SIM_CLK, ' + ', '.join(sorted_inputs))
    f.write(', ' + ', '.join(sorted_outputs))
    f.write(');\n')

    # Write out wire declarations
    f.write('    input wire p4VDC;\n')
    f.write('    input wire p4VSW;\n')
    f.write('    input wire GND;\n')
    f.write('    input wire SIM_RST;\n')
    f.write('    input wire SIM_CLK;\n')
    for i in sorted_inputs:
        f.write('    input wire %s;\n' % i)

    for o in sorted_outputs:
        if args.fpga and o in wands:
            f.write('    output wand %s;\n' % o)
        elif args.fpga and o in wors:
            f.write('    output wor %s;\n' % o)
        else:
            f.write('    output wire %s;\n' % o)

    for n in sorted_internals:
        if args.fpga and n in wands:
            f.write('    wand %s;\n' % n)
        elif args.fpga and n in wors:
            f.write('    wor %s;\n' % n)
        else:
            f.write('    wire %s;\n' % n)

    f.write('\n')

    # Write out the module instantiations
    for m in sorted(module_names.keys()):
        if args.fpga:
            f.write(module_contents[m])
        else:
            f.write('    %s %s%s;\n' % (module_names[m], m, module_args[m]))
    
    f.write('endmodule\n')
