`timescale 1ns/1ps

module U74HC02(y1, a1, b1, y2, a2, b2, gnd, a3, b3, y3, a4, b4, y4, vcc, rst, clk);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    parameter ic4 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst, clk;
    input wire a1, b1, a2, b2, a3, b3, a4, b4;
    output wire y1, y2, y3, y4;

    nor_2 #(delay, ic1) A(y1, a1, b1, rst, clk);
    nor_2 #(delay, ic2) B(y2, a2, b2, rst, clk);
    nor_2 #(delay, ic3) C(y3, a3, b3, rst, clk);
    nor_2 #(delay, ic4) D(y4, a4, b4, rst, clk);
endmodule
