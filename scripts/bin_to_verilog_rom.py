import argparse
import array

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate a Verilog ROM (switch statement) from a given binary")
    parser.add_argument('input_file', help="Input ROM file")
    parser.add_argument('output_file', help="Output Verilog filename")
    args = parser.parse_args()
    
    words = array.array('H')
    with open(args.input_file, 'rb') as f:
        words.fromfile(f, 36864)

        if f.read() != b'':
            raise RuntimeError("File larger than 36864 bytes supplied; this doesn't fit in the AGC's address space!")

    words.byteswap()

    with open(args.output_file, 'w') as of:
        for i,word in enumerate(words):
            of.write("    %-5u: data = 16'o%06o;\n" % (i, word))
