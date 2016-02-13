`timescale 1ns/1ps
`default_nettype none

module U74HC27(a1, b1, a2, b2, c2, y2, gnd, y3, a3, b3, c3, y1, c1, vcc, rst, clk);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst, clk;
    input wire a1, b1, c1, a2, b2, c2, a3, b3, c3;
    output wire y1, y2, y3;

    nor_3 #(delay, ic1) A(y1, a1, b1, c1, rst, clk);
    nor_3 #(delay, ic2) B(y2, a2, b2, c2, rst, clk);
    nor_3 #(delay, ic3) C(y3, a3, b3, c3, rst, clk);
endmodule
