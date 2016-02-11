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
        module_outputs = re.findall('output wire (.*?);( //FPGA:wand)?', s)
        for o in module_outputs:
            if o[0] in inputs:
                # If this module output is already in the set of AGC inputs, then it's an intermodule signal.
                # Remove it from the inputs set and add it to the internals set.
                inputs.remove(o[0])
                internals.add(o[0])
            elif o[0] not in internals:
                # Otherwise, if it's not an internal wire, add it to the outputs set
                outputs.add(o[0])

            if o[1] != '':
                wands.add(o[0])

        # Read in the module's input wires
        module_inputs = re.findall('(input|inout) wire (.*?);( //FPGA:wand)?', s)
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

            if i[2] != '':
                wands.add(i[1])

        if args.fpga:
            module_internals = re.findall('^\s*wire (.*?);( //FPGA:wand)?', s, re.MULTILINE)
            for n in module_internals:
                internals.add(n[0])

                if n[1] != '':
                    wands.add(n[0])

            module_body = ''
            lines = s.split('\n')
            for line in lines:
                if (not 'wire' in line) and (not 'timescale' in line) and (not 'module' in line) and (not 'pullup' in line):
                    parts = re.match('(.*?)(U\d+)\((.*?)\); //OD:([\d,]+)', line)
                    if parts is not None:
                        prefix = parts.group(1)
                        part_num = parts.group(2)
                        part_pins = parts.group(3).split(', ')
                        od_pins = [int(pin) for pin in parts.group(4).split(',')]

                        for od_pin in od_pins:
                            signal_name = part_pins[od_pin-1]
                            proxy_name = signal_name + '_' + part_num + '_' + str(od_pin)
                            part_pins[od_pin-1] = proxy_name

                            internals.add(proxy_name)

                            module_body += '    assign ' + signal_name + ' = ' + proxy_name + ';\n'
                        module_body += prefix + part_num + '(' + ', '.join(part_pins) + ');\n'
                    else:
                        module_body += line + '\n'

            module_contents[module_number] = module_body


# These should always end up in the input set -- they're special, so we want to handle them separately
inputs.remove('VCC')
inputs.remove('GND')
inputs.remove('SIM_RST')
inputs.remove('SIM_CLK')

sorted_inputs = sorted(inputs)
sorted_outputs = sorted(outputs)
sorted_internals = sorted(internals)

with open(args.filename, 'w') as f:
    f.write('`timescale 1ns/1ps\n\n')

    # Write the module declaration
    f.write('module agc(VCC, GND, SIM_RST, SIM_CLK, ' + ', '.join(sorted_inputs))
    f.write(', ' + ', '.join(sorted_outputs))
    f.write(');\n\n')

    # Write out wire declarations
    f.write('    input wire VCC;\n')
    f.write('    input wire GND;\n')
    f.write('    input wire SIM_RST;\n')
    f.write('    input wire SIM_CLK;\n')
    for i in sorted_inputs:
        f.write('    input wire %s;\n' % i)

    for o in sorted_outputs:
        if args.fpga and o in wands:
            f.write('    output wand %s;\n' % o)
        else:
            f.write('    output wire %s;\n' % o)

    for n in sorted_internals:
        if args.fpga and n in wands:
            f.write('    wand %s;\n' % n)
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
