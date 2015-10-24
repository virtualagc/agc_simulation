`timescale 1ns/1ps
`include "modules/timer.v"
`include "modules/scaler.v"

module main;
    reg rst = 1;
    reg clock = 0;
    always #488.281 clock = !clock;

    reg vcc = 1;
    reg gnd = 0;
    reg mstp = 0;
    reg mstrtp = 0;
    wire phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, clk, tt_n, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n, stopa, gojam, gojam_n, stop, stop_n, monwt, q2a, mgojam, mstpit_n;
    reg sby = 0;
    reg alga = 0;
    reg strt1 = 0;
    reg strt2 = 0;
    reg goj1 = 0;

    reg wl15 = 0;
    reg wl15_n = 1;
    reg wl16 = 0;
    reg wl16_n = 1;

    reg rchat_n = 1;
    reg rchbt_n = 1;
    wire fs01_n;

    scaler a1(vcc, gnd, rst, fs01_n, rchat_n, rchbt_n);
    timer a2(vcc, gnd, rst, clock, mstrtp, mstp, phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, clk, tt_n, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n, sby, alga, strt1, strt2, goj1, stopa, gojam, gojam_n, stop, stop_n, wl15, wl15_n, wl16, wl16_n, fs01_n, monwt, q2a, mgojam, mstpit_n);
    
    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #10 rst = 0;
        #1000 strt1 = 1;
        #1000 strt1 = 0;
        #5000 goj1 = 1;
        #1000 goj1 = 0;
        #5000000 strt1 = 1;
        #5000 $finish;
    end
endmodule
