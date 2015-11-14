import argparse
import re
import os
import glob

parser = argparse.ArgumentParser(description="Generate a backplane module from a folder containing AGC modules")
parser.add_argument("filename", help="Output filename")
parser.add_argument("dir", help="Directory of AGC modules")
args = parser.parse_args()

modules = glob.glob(os.path.join(args.dir, '*.v'))

inputs = set()
outputs = set()
internals = set()
module_args = {}
module_names = {}

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

        # Read the module's input wires
        module_outputs = re.findall('(?:inout|output) wire (.*?);', s)
        for o in module_outputs:
            if o in inputs:
                # If this module output is already in the set of AGC inputs, then it's an intermodule signal.
                # Remove it from the inputs set and add it to the internals set.
                inputs.remove(o)
                internals.add(o)
            elif o not in internals:
                # Otherwise, if it's not an internal wire, add it to the outputs set
                outputs.add(o)

        # Read in the module's output wires
        module_inputs = re.findall('input wire (.*?);', s)
        for i in module_inputs:
            if (i not in outputs) and (i not in internals):
                # If this input isn't another module's output, or an intermodule signal, add it to the AGC inputs set
                inputs.add(i)
            elif i in outputs:
                # If it's in the output set, remove it and mark it as an intermodule signal
                outputs.remove(i)
                internals.add(i)


# These should always end up in the input set -- they're special, so we want to handle them separately
inputs.remove('VCC')
inputs.remove('GND')
inputs.remove('SIM_RST')

sorted_inputs = sorted(inputs)
sorted_outputs = sorted(outputs)
sorted_internals= sorted(internals)

with open(args.filename, 'w') as f:
    f.write('`timescale 1ns/1ps\n\n')

    # Write the module declaration
    f.write('module agc(VCC, GND, SIM_RST, ' + ', '.join(sorted_inputs))
    # TODO: uncomment this when there are few enough "outputs"
    # f.write(', ' + ', '.join(outputs))
    f.write(');\n\n')

    # Write out wire declarations
    f.write('    input wire VCC;\n')
    f.write('    input wire GND;\n')
    f.write('    input wire SIM_RST;\n')
    for i in sorted_inputs:
        f.write('    input wire %s;\n' % i)

    for o in sorted_outputs:
        # TODO: add 'output' to this when there are few enough "outputs"
        f.write('    wire %s;\n' % o)

    for n in sorted_internals:
        f.write('    wire %s;\n' % n)

    f.write('\n')

    # Write out the module instantiations
    for m in sorted(module_names.keys()):
        f.write('    %s %s%s;\n' % (module_names[m], m, module_args[m]))
    
    f.write('endmodule\n')
