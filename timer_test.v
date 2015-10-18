`timescale 1ns/1ps
`include "modules/timer.v"

module main;
    reg rst = 1;
    reg clock = 0;
    always #488.281 clock = !clock;

    reg vcc = 1;
    reg gnd = 0;
    reg stop = 0;
    wire phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, tt_n, ovfstb_n, clk, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n;

    timer a1(vcc, gnd, rst, clock, stop, phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, tt_n, ovfstb_n, clk, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n);
    
    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #10 rst = 0;
        #1000000 stop = 1;
        #2000000 stop = 0;
        #5000000 $finish;
    end
endmodule
