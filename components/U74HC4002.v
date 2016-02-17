`timescale 1ns/1ps

module U74HC4002(y1, a1, b1, c1, d1, nc1, gnd, nc2, a2, b2, c2, d2, y2, vcc, rst, clk);
    parameter ic1 = 1'b0;
    parameter ic2 = 1'b0;
    localparam delay = 9;
    input wire vcc, gnd, rst, clk;
    input wire a1, b1, c1, d1, a2, b2, c2, d2;
    input wire nc1, nc2;
    output wire y1, y2;

    nor_4 #(delay, ic1) A(y1, a1, b1, c1, d1, rst, clk);
    nor_4 #(delay, ic2) B(y2, a2, b2, c2, d2, rst, clk);
endmodule
