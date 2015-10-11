module nor2(y, a, b, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, rst;
    output reg y;
    always @(*) begin
        if (rst) y = iv;
        else #delay y = ~(a | b);
    end
endmodule

module nor3(y, a, b, c, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, c, rst;
    output reg y;
    always @(*) begin
        if (rst) y = iv;
        else #delay y = ~(a | b | c);
    end
endmodule

module nor4(y, a, b, c, d, rst);
    parameter delay = 9;
    parameter iv = 0;
    input wire a, b, c, d, rst;
    output reg y;
    always @(*) begin
        if (rst) y = iv;
        else #delay y = ~(a | b | c | d);
    end
endmodule
