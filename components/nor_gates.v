`ifndef _NOR_GATES_V_
`define _NOR_GATES_V_

module nor1(y, a, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, rst;
    output wire y;
    assign #delay y = (rst) ? iv : ~a;
endmodule

module nor2(y, a, b, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, rst;
    output wire y;
    assign #delay y = (rst) ? iv : ~(a|b);
endmodule

module nor3(y, a, b, c, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, c, rst;
    output wire y;
    assign #delay y = (rst) ? iv : ~(a|b|c);
endmodule

module nor4(y, a, b, c, d, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, c, d, rst;
    output wire y;
    assign #delay y = (rst) ? iv : ~(a|b|c|d);
endmodule

`endif
