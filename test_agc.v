`timescale 1ns/1ps
`default_nettype none

module main;
    reg VCC = 1;
    reg GND = 0;
    reg SIM_RST = 1;
    reg SIM_CLK = 1;
    reg ALGA = 0;
    reg C24A = 0;
    reg C25A = 0;
    reg C26A = 0;
    reg C27A = 0;
    reg C30A = 0;
    reg C37P = 0;
    reg C40P = 0;
    reg C41P = 0;
    reg C42P = 0;
    reg C43P = 0;
    reg C44P = 0;
    reg CA2_n = 1;
    reg CA3_n = 1;
    reg CAD1 = 0;
    reg CAD2 = 0;
    reg CAD3 = 0;
    reg CAD4 = 0;
    reg CAD5 = 0;
    reg CAD6 = 0;
    reg CDUSTB_n = 1;
    reg CH01 = 0;
    reg CH02 = 0;
    reg CH03 = 0;
    reg CH04 = 0;
    reg CH05 = 0;
    reg CH06 = 0;
    reg CH07 = 0;
    reg CH08 = 0;
    reg CH09 = 0;
    reg CH10 = 0;
    reg CH11 = 0;
    reg CH12 = 0;
    reg CH13 = 0;
    reg CH14 = 0;
    reg CH16 = 0;
    reg CHINC = 0;
    reg CHINC_n = 1;
    reg CLOCK = 0;
    reg DINC = 0;
    reg DINC_n = 1;
    reg DLKPLS = 0;
    reg E5 = 0;
    reg E6 = 0;
    reg E7_n = 1;
    reg FETCH0 = 0;
    reg FETCH0_n = 1;
    reg FETCH1 = 0;
    reg G16SW_n = 1;
    reg HNDRPT = 0;
    reg INCSET_n = 1;
    reg INKL = 0;
    reg INKL_n = 1;
    reg KYRPT1 = 0;
    reg KYRPT2 = 0;
    reg INOTLD = 0;
    reg MAMU = 0;
    reg MCDU = 0;
    reg MDT01 = 0;
    reg MDT02 = 0;
    reg MDT03 = 0;
    reg MDT04 = 0;
    reg MDT05 = 0;
    reg MDT06 = 0;
    reg MDT07 = 0;
    reg MDT08 = 0;
    reg MDT09 = 0;
    reg MDT10 = 0;
    reg MDT11 = 0;
    reg MDT12 = 0;
    reg MDT13 = 0;
    reg MDT14 = 0;
    reg MDT15 = 0;
    reg MDT16 = 0;
    reg MINC = 0;
    reg MKRPT = 0;
    reg MNHRPT = 0;
    reg MNHSBF = 0;
    reg MONPAR = 0;
    reg MONPCH = 0;
    reg MONWBK = 0;
    reg MON_n = 1;
    reg MSTP = 0;
    reg MSTRTP = 0;
    reg MTCSAI = 0;
    reg OVNHRP = 0;
    reg PCDU = 0;
    reg PIPPLS_n = 1;
    reg RADRPT = 0;
    reg RCHAT_n = 1;
    reg RCHBT_n = 1;
    reg SBY = 0;
    reg SHANC_n = 1;
    reg SHIFT = 0;
    reg SHIFT_n = 1;
    reg STFET1_n = 1;
    reg STORE1_n = 1;
    reg STRT1 = 0;
    reg STRT2 = 0;
    reg UPRUPT = 0;
    reg ZOUT_n = 1;
    wire MGOJAM;
    wire MT01;
    wire MT02;
    wire MT03;
    wire MT04;
    wire MT05;
    wire MT06;
    wire MT07;
    wire MT08;
    wire MT09;
    wire MT10;
    wire MT11;
    wire MT12;

    always #244.140625 CLOCK = !CLOCK;

`ifdef TARGET_FPGA
    always #10 SIM_CLK = !SIM_CLK;

    wire EPCS_CSN;
    wire EPCS_ASDI;
    wire EPCS_DCLK;
    reg EPCS_DATA = 0;
    
    fpga_agc AGC(VCC, GND, SIM_RST, SIM_CLK, ALGA, C24A, C25A, C26A, C27A, C30A, C37P, C40P, C41P, C42P, C43P, C44P, CA2_n, CA3_n, CAD1, CAD2, CAD3, CAD4, CAD5, CAD6, CDUSTB_n, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH08, CH09, CH10, CH11, CH12, CH13, CH14, CH16, CHINC, CHINC_n, CLOCK, DINC, DINC_n, DLKPLS, E5, E6, E7_n, EPCS_DATA, FETCH0, FETCH0_n, FETCH1, G16SW_n, HNDRPT, INCSET_n, INKL, INKL_n, INOTLD, KYRPT1, KYRPT2, MAMU, MCDU, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MINC, MKRPT, MNHRPT, MNHSBF, MONPAR, MONPCH, MONWBK, MON_n, MSTP, MSTRTP, MTCSAI, OVNHRP, PCDU, PIPPLS_n, RADRPT, RCHAT_n, RCHBT_n, SBY, SHANC_n, SHIFT, SHIFT_n, STFET1_n, STORE1_n, STRT1, STRT2, UPRUPT, ZOUT_n, EPCS_ASDI, EPCS_DCLK, EPCS_CSN, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12);
`else
    agc AGC(VCC, GND, SIM_RST, SIM_CLK, ALGA, C24A, C25A, C26A, C27A, C30A, C37P, C40P, C41P, C42P, C43P, C44P, CA2_n, CA3_n, CAD1, CAD2, CAD3, CAD4, CAD5, CAD6, CDUSTB_n, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH08, CH09, CH10, CH11, CH12, CH13, CH14, CH16, CHINC, CHINC_n, CLOCK, DINC, DINC_n, DLKPLS, E5, E6, E7_n, FETCH0, FETCH0_n, FETCH1, G16SW_n, HNDRPT, INCSET_n, INKL, INKL_n, INOTLD, KYRPT1, KYRPT2, MAMU, MCDU, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MINC, MKRPT, MNHRPT, MNHSBF, MONPAR, MONPCH, MONWBK, MON_n, MSTP, MSTRTP, MTCSAI, OVNHRP, PCDU, PIPPLS_n, RADRPT, RCHAT_n, RCHBT_n, SBY, SHANC_n, SHIFT, SHIFT_n, STFET1_n, STORE1_n, STRT1, STRT2, UPRUPT, ZOUT_n, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12);
`endif


    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #5000 SIM_RST = 0;
        #50000 STRT1 = 1;
        #5000 STRT1 = 0;
        #400000 $finish;
    end
endmodule
