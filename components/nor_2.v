`timescale 1ns/1ps

module nor_2(y, a, b, rst, clk);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, rst, clk;

`ifdef TARGET_FPGA
    output reg y = iv;
    reg next_val = iv;

    always @(posedge clk)
    begin
        y = next_val;
    end

    always @(negedge clk)
    begin
        next_val = ~(a|b);
    end
`else
    output wire y;
    assign #delay y = (rst) ? iv : ~(a|b);
`endif
endmodule
