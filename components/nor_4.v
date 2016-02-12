`timescale 1ns/1ps

module nor_4(y, a, b, c, d, rst, clk);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, c, d, rst, clk;

`ifdef TARGET_FPGA
    output reg y = iv;
    reg next_val = iv;

    always @(posedge clk)
    begin
        y = next_val;
    end

    always @(negedge clk)
    begin
        next_val = ~(a|b|c|d);
    end
`else
    output wire y;
    assign #delay y = (rst) ? iv : ~(a|b|c|d);
`endif
endmodule
