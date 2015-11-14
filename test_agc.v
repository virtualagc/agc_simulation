`timescale 1ns/1ps
`default_nettype none

module main;
    reg VCC = 1;
    reg GND = 0;
    reg SIM_RST = 1;
    reg ALGA = 0;
    reg BR1B2B = 0;
    reg BR2_n = 1;
    reg CLOCK = 0;
    reg DVST = 0;
    reg DVST_n = 1;
    reg EXT = 0;
    reg EXTPLS = 0;
    reg GEQZRO_n = 1;
    reg INHLPLS = 0;
    reg INKL = 0;
    reg KRPT = 0;
    reg L15_n = 1;
    reg MNHRPT = 0;
    reg MSTP = 0;
    reg MSTRTP = 0;
    reg MTCSAI = 0;
    reg NDR100_n = 1;
    reg NISQ = 0;
    reg OVNHRP = 0;
    reg RCHAT_n = 1;
    reg RCHBT_n = 1;
    reg RELPLS = 0;
    reg RSTSTG = 0;
    reg RUPTOR_n = 1;
    reg RXOR0 = 0;
    reg SBY = 0;
    reg ST1 = 0;
    reg ST2 = 0;
    reg ST4 = 0;
    reg STRT1 = 0;
    reg STRT2 = 0;
    reg SUMA16_n = 1;
    reg SUMB16_n = 1;
    reg TL15 = 0;
    reg TMZ_n = 1;
    reg TOV_n = 1;
    reg TPZG_n = 1;
    reg TRSM_n = 1;
    reg TSGN2 = 0;
    reg TSGN_n = 1;
    reg TSGU_n = 1;
    reg WL01_n = 1;
    reg WL02_n = 1;
    reg WL03_n = 1;
    reg WL04_n = 1;
    reg WL05_n = 1;
    reg WL06_n = 1;
    reg WL07_n = 1;
    reg WL08_n = 1;
    reg WL09_n = 1;
    reg WL10_n = 1;
    reg WL11_n = 1;
    reg WL12_n = 1;
    reg WL13_n = 1;
    reg WL14_n = 1;
    reg WL15 = 0;
    reg WL15_n = 1;
    reg WL16 = 0;
    reg WL16_n = 1;
    reg XB7_n = 1;
    reg XT1_n = 1;
    reg n5XP4 = 0;

    agc AGC(VCC, GND, SIM_RST, ALGA, BR1B2B, BR2_n, CLOCK, DVST, DVST_n, EXT, EXTPLS, GEQZRO_n, INHLPLS, INKL, KRPT, L15_n, MNHRPT, MSTP, MSTRTP, MTCSAI, NDR100_n, NISQ, OVNHRP, RCHAT_n, RCHBT_n, RELPLS, RSTSTG, RUPTOR_n, RXOR0, SBY, ST1, ST2, ST4, STRT1, STRT2, SUMA16_n, SUMB16_n, TL15, TMZ_n, TOV_n, TPZG_n, TRSM_n, TSGN2, TSGN_n, TSGU_n, WL01_n, WL02_n, WL03_n, WL04_n, WL05_n, WL06_n, WL07_n, WL08_n, WL09_n, WL10_n, WL11_n, WL12_n, WL13_n, WL14_n, WL15, WL15_n, WL16, WL16_n, XB7_n, XT1_n, n5XP4);

    always #488.281 CLOCK = !CLOCK;

    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #5000 SIM_RST = 0;
        #10000 STRT1 = 1;
        #20000  STRT1 = 0;
        #20000 WL13_n = 0;
        #5000 NISQ = 1;
        #5000 NISQ = 0;
        #20000 WL14_n = 0;
        #5000 NISQ = 1;
        #5000 NISQ = 0;
        #20000 EXT = 1;
        NISQ = 1;
        #5000 EXT = 0;
        NISQ = 0;
        #50000 STRT1 = 1;
        #5000 STRT1 = 0;
        #500000 $finish;
    end
endmodule
