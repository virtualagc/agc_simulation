`timescale 1ns/1ps
`default_nettype none

module od_buf(y, a);
    parameter delay = 2;
    input wire a;
    output wire y;

`ifdef TARGET_FPGA
    assign y = a;
`else
    assign #delay y = (a == 1'b1) ? 1'bZ : 1'b0;
`endif
endmodule
