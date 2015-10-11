`timescale 1ns/1ps
`include "modules/timer.v"

module main;
    reg rst = 1;
    reg clock = 0;
    always #488.281 clock = !clock;

    wire vcc, gnd;
    wire phs2, phs2_n, phs4, phs4_n, rt, ct, ct_n, wt, wt_n;
    timer a1(vcc, gnd, rst, clock, phs2, phs2_n, phs4, phs4_n, rt, ct, ct_n, wt, wt_n);
    
    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #10 rst = 0;
        #100000 $finish;
    end
endmodule
