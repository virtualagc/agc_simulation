`timescale 1ns/1ps

module od_buf(y, a);
    parameter delay = 2;
    input wire a;
    output wire y;
    assign #delay y = (a == 1'b1) ? 1'bZ : 1'b0;
endmodule
