`include "components/nor_gates.v"

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
