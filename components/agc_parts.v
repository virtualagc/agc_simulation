`timescale 1ns/1ps

module U74HC04(a1, y1, a2, y2, a3, y3, gnd, y4, a4, y5, a5, y6, a6, vcc, rst);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    parameter ic4 = 0;
    parameter ic5 = 0;
    parameter ic6 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst;
    input wire a1, a2, a3, a4, a5, a6;
    output wire y1, y2, y3, y4, y5, y6;

    nor1 #(delay, ic1) A(y1, a1, rst);
    nor1 #(delay, ic2) B(y2, a2, rst);
    nor1 #(delay, ic3) C(y3, a3, rst);
    nor1 #(delay, ic4) D(y4, a4, rst);
    nor1 #(delay, ic5) E(y5, a5, rst);
    nor1 #(delay, ic6) F(y6, a6, rst);
endmodule

module U74HC02(y1, a1, b1, y2, a2, b2, gnd, a3, b3, y3, a4, b4, y4, vcc, rst);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    parameter ic4 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst;
    input wire a1, b1, a2, b2, a3, b3, a4, b4;
    output wire y1, y2, y3, y4;

    nor2 #(delay, ic1) A(y1, a1, b1, rst);
    nor2 #(delay, ic2) B(y2, a2, b2, rst);
    nor2 #(delay, ic3) C(y3, a3, b3, rst);
    nor2 #(delay, ic4) D(y4, a4, b4, rst);
endmodule

module U74HC27(a1, b1, a2, b2, c2, y2, gnd, y3, a3, b3, c3, y1, c1, vcc, rst);
    parameter ic1 = 0;
    parameter ic2 = 0;
    parameter ic3 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst;
    input wire a1, b1, c1, a2, b2, c2, a3, b3, c3;
    output wire y1, y2, y3;

    nor3 #(delay, ic1) A(y1, a1, b1, c1, rst);
    nor3 #(delay, ic2) B(y2, a2, b2, c2, rst);
    nor3 #(delay, ic3) C(y3, a3, b3, c3, rst);
endmodule

module U74HC4002(y1, a1, b1, c1, d1, nc1, gnd, nc2, a2, b2, c2, d2, y2, vcc, rst);
    parameter ic1 = 0;
    parameter ic2 = 0;
    localparam delay = 9;
    input wire vcc, gnd, rst;
    input wire a1, b1, c1, d1, a2, b2, c2, d2;
    input wire nc1, nc2;
    output wire y1, y2;

    nor4 #(delay, ic1) A(y1, a1, b1, c1, d1, rst);
    nor4 #(delay, ic2) B(y2, a2, b2, c2, d2, rst);
endmodule

module U74LVC07(a1, y1, a2, y2, a3, y3, gnd, y4, a4, y5, a5, y6, a6, vcc, rst);
    localparam delay = 2;
    input wire vcc, gnd, rst;
    input wire a1, a2, a3, a4, a5, a6;
    output wire y1, y2, y3, y4, y5, y6;

    od_buf #(delay) A(y1, a1);
    od_buf #(delay) B(y2, a2);
    od_buf #(delay) C(y3, a3);
    od_buf #(delay) D(y4, a4);
    od_buf #(delay) E(y5, a5);
    od_buf #(delay) F(y6, a6);
endmodule
