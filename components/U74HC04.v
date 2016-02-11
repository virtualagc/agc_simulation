`timescale 1ns/1ps

module U74HC04(a1, y1, a2, y2, a3, y3, gnd, y4, a4, y5, a5, y6, a6, vcc, rst, clk);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    parameter ic4 = 0;
    parameter ic5 = 0;
    parameter ic6 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst, clk;
    input wire a1, a2, a3, a4, a5, a6;
    output wire y1, y2, y3, y4, y5, y6;

    nor_1 #(delay, ic1) A(y1, a1, rst, clk);
    nor_1 #(delay, ic2) B(y2, a2, rst, clk);
    nor_1 #(delay, ic3) C(y3, a3, rst, clk);
    nor_1 #(delay, ic4) D(y4, a4, rst, clk);
    nor_1 #(delay, ic5) E(y5, a5, rst, clk);
    nor_1 #(delay, ic6) F(y6, a6, rst, clk);
endmodule
