`timescale 1ns/1ps
`default_nettype none
`include "modules/timer.v"
`include "modules/scaler.v"
`include "modules/sq_register.v"
`include "modules/stage_branch.v"

module main;
    reg rst = 1;
    reg clock = 0;
    always #488.281 clock = !clock;

    reg vcc = 1;
    reg gnd = 0;
    reg mstp = 0;
    reg mstrtp = 0;
    wire phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, clk, tt_n, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n, stopa, gojam, gojam_n, stop, stop_n, monwt, q2a, mgojam, mstpit_n;
    wire t01, t01_n, t02, t02_n, t03, t03_n, t04, t04_n, t05, t05_n, t06, t06_n, t07, t07_n, t08, t08_n, t09, t09_n, t10, t10_n, t11, t11_n, t12, t12_n;
    reg sby = 0;
    reg alga = 0;
    reg strt1 = 0;
    reg strt2 = 0;
    reg wl16 = 0;
    reg wl16_n = 1;
    reg wl15 = 0;
    reg wl15_n = 1;
    reg wl14 = 0;
    reg wl14_n = 1;
    reg wl13 = 0;
    reg wl13_n = 1;
    reg wl12 = 0;
    reg wl12_n = 1;
    reg wl11 = 0;
    reg wl11_n = 1;
    reg wl10 = 0;
    reg wl10_n = 1;

    reg rchat_n = 1;
    reg rchbt_n = 1;
    wire fs01_n;

    reg nisq = 0;
    reg ext = 0;
    reg extpls = 0;
    reg inkl = 0;
    reg inkbt1 = 0;
    reg inhlpls = 0;
    reg relpls = 0;
    reg ovnhrp = 0;
    reg ruptor_n = 1;
    reg krpt = 0;
    reg n5xp4 = 0;
    reg mnhrpt = 0;
    reg mtcsai = 0;

    reg br2_n = 1;
    reg br1b2b = 0;
    reg rxor0 = 0;

    wire goj1;

    reg st1 = 0;
    reg st2 = 0;

    reg dvst = 0;
    reg dvst_n = 1;
    reg rststg = 0;
    reg trsm_n = 1;
    reg xt1_n = 1;
    reg xb7_n = 1;
    reg ndr100_n = 1;

    wire strtfc;
    wire st0_n, st1_n, std2, st3_n, st4;

    scaler a1(vcc, gnd, rst, fs01_n, rchat_n, rchbt_n);
    timer a2(vcc, gnd, rst, clock, mstrtp, mstp, phs2, phs2_n, phs3_n, phs4, phs4_n, rt, rt_n, wt, wt_n, ct, ct_n, clk, tt_n, p01, p01_n, p02, p02_n, p03, p03_n, p04, p04_n, p05, p05_n, sby, alga, strt1, strt2, goj1, stopa, gojam, gojam_n, stop, stop_n, wl15, wl15_n, wl16, wl16_n, fs01_n, t01, t01_n, t02, t02_n, t03, t03_n, t04, t04_n, t05, t05_n, t06, t06_n, t07, t07_n, t08, t08_n, t09, t09_n, t10, t10_n, t11, t11_n, t12, t12_n, monwt, q2a, mgojam, mstpit_n);
    sq_register a3(vcc, gnd, rst, gojam, nisq, t01_n, t02, t12_n, phs2_n, rt_n, ct_n, wt_n, wl16_n, wl14_n, wl13_n, wl12_n, wl11_n, wl10_n, ext, extpls, inkl, relpls, inhlpls, ovnhrp, ruptor_n, krpt, n5xp4, st0_n, st1_n, st3_n, std2, br2_n, br1b2b, rxor0, strtfc, goj1, mnhrpt, mtcsai);

    stage_branch a4(vcc, gnd, rst, gojam, t01, t03, t12_n, phs3_n, st1, st2, inkl, strtfc, dvst, dvst_n, rststg, trsm_n, xt1_n, xb7_n, ndr100_n, st0_n, st1_n, std2, st3_n, st4, mtcsai);

    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #5000 rst = 0;
        #10000 strt1 = 1;
        #20000  strt1 = 0;
        #20000 wl13 = 1;
        wl13_n = 0;
        #5000 nisq = 1;
        #5000 nisq = 0;
        #20000 wl14 = 1;
        wl14_n = 0;
        #5000 nisq = 1;
        #5000 nisq = 0;
        #20000 ext = 1;
        nisq = 1;
        #5000 ext = 0;
        nisq = 0;
        #50000 strt1 = 1;
        #5000 strt1 = 0;
        #500000 $finish;
    end
endmodule
