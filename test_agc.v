`timescale 1ns/1ps
`default_nettype none

module main;
    reg VCC = 1;
    reg GND = 0;
    reg SIM_RST = 1;
    reg SIM_CLK = 1;
    reg ALTEST = 0;
    reg BLKUPL_n = 1; //input
    reg BMGXM = 0; //input
    reg BMGXP = 0; //input
    reg BMGYM = 0; //input
    reg BMGYP = 0; //input
    reg BMGZM = 0; //input
    reg BMGZP = 0; //input
    reg CAURST = 0; //input
    reg CCH13 = 0;
    reg CCH14 = 0;
    reg CDUFAL = 0; //input
    reg CDUSTB_n = 1;
    reg CDUXD = 0;
    reg CDUXM = 0;
    reg CDUXP = 0;
    reg CDUYD = 0;
    reg CDUYM = 0;
    reg CDUYP = 0;
    reg CDUZD = 0;
    reg CDUZM = 0;
    reg CDUZP = 0;
    reg CH01 = 0;
    reg CH02 = 0;
    reg CH03 = 0;
    reg CH04 = 0;
    reg CH05 = 0;
    reg CH06 = 0;
    reg CH07 = 0;
    reg CH0705 = 0;
    reg CH0706 = 0;
    reg CH0707 = 0;
    reg CH08 = 0;
    reg CH09 = 0;
    reg CH10 = 0;
    reg CH11 = 0;
    reg CH12 = 0;
    reg CH13 = 0;
    reg CH1301 = 0;
    reg CH1302 = 0;
    reg CH1303 = 0;
    reg CH1304 = 0;
    reg CH1307 = 0;
    reg CH1309 = 0;
    reg CH1310 = 0;
    reg CH1311 = 0;
    reg CH1316 = 0;
    reg CH14 = 0;
    reg CH1411 = 0;
    reg CH1412 = 0;
    reg CH1413 = 0;
    reg CH1414 = 0;
    reg CH1416 = 0;
    reg CH1501 = 0;
    reg CH1502 = 0;
    reg CH1503 = 0;
    reg CH1504 = 0;
    reg CH16 = 0;
    reg CH3312 = 0;
    reg CHWL01_n = 1;
    reg CHWL02_n = 1;
    reg CHWL03_n = 1;
    reg CHWL04_n = 1;
    reg CHWL05_n = 1;
    reg CHWL06_n = 1;
    reg CHWL07_n = 1;
    reg CHWL08_n = 1;
    reg CHWL09_n = 1;
    reg CHWL10_n = 1;
    reg CHWL11_n = 1;
    reg CHWL12_n = 1;
    reg CHWL13_n = 1;
    reg CHWL14_n = 1;
    reg CHWL16_n = 1;
    reg CLOCK = 0;
    reg CTLSAT; //input
    reg DBLTEST = 0; //monitor input
    reg DLKPLS = 0;
    reg E5 = 0;
    reg E6 = 0;
    reg E7_n = 1;
    reg FLASH = 0;
    reg FLASH_n = 1;
    reg FLTOUT = 0;
    reg FREFUN = 0; //input
    reg GATEX_n = 1; //input
    reg GATEY_n = 1; //input
    reg GATEZ_n = 1; //input
    reg GCAPCL = 0; //input
    reg GTONE = 0;
    reg GTSET = 0;
    reg GTSET_n = 1;
    reg GUIREL = 0; //input
    reg HNDRPT = 0;
    reg HOLFUN = 0; //input
    reg IMUCAG = 0; //input
    reg IMUFAL = 0; //input
    reg IMUOPR = 0; //input
    reg IN3008 = 0; //input
    reg IN3212 = 0; //input
    reg IN3213 = 0; //input
    reg IN3214 = 0; //input
    reg IN3216 = 0; //input
    reg IN3301 = 0; //input
    reg ISSTOR = 0; //input
    reg KYRPT1 = 0;
    reg KYRPT2 = 0;
    reg LEMATT = 0; //input
    reg LFTOFF = 0; //input
    reg LRRLSC = 0; //input
    reg LVDAGD = 0; //input
    reg MAMU = 0; //monitor input
    reg MANmP = 0; //input
    reg MANmR = 0; //input
    reg MANmY = 0; //input
    reg MANpP = 0; //input
    reg MANpR = 0; //input
    reg MANpY = 0; //input
    reg MDT01 = 0; //monitor input
    reg MDT02 = 0; //monitor input
    reg MDT03 = 0; //monitor input
    reg MDT04 = 0; //monitor input
    reg MDT05 = 0; //monitor input
    reg MDT06 = 0; //monitor input
    reg MDT07 = 0; //monitor input
    reg MDT08 = 0; //monitor input
    reg MDT09 = 0; //monitor input
    reg MDT10 = 0; //monitor input
    reg MDT11 = 0; //monitor input
    reg MDT12 = 0; //monitor input
    reg MDT13 = 0; //monitor input
    reg MDT14 = 0; //monitor input
    reg MDT15 = 0; //monitor input
    reg MDT16 = 0; //monitor input
    reg MKRPT = 0;
    reg MLDCH = 0; //monitor input
    reg MLOAD = 0; //monitor input
    reg MNHNC = 0; //monitor input
    reg MNHRPT = 0; //monitor input
    reg MNHSBF = 0; //monitor input
    reg MNIMmP = 0; //input
    reg MNIMmR = 0; //input
    reg MNIMmY = 0; //input
    reg MNIMpP = 0; //input
    reg MNIMpR = 0; //input
    reg MNIMpY = 0; //input
    reg MONPAR = 0; //monitor input
    reg MONWBK = 0; //monitor input
    reg MRDCH = 0; //monitor input
    reg MREAD = 0; //monitor input
    reg MSTP = 0; //monitor input
    reg MSTRT = 0; //monitor input
    reg MTCSAI = 0; //monitor input
    reg NHALGA = 0; //monitor input
    reg NHVFAL = 0; //input
    reg OPCDFL = 0; //input
    reg OPMSW2 = 0; //input
    reg OPMSW3 = 0; //input
    reg OVNHRP = 0;
    reg PCHGOF; //input
    reg PIPAFL = 0;
    reg PIPPLS_n = 1;
    reg PIPXM = 0;
    reg PIPXP = 0;
    reg PIPYM = 0;
    reg PIPYP = 0;
    reg PIPZM = 0;
    reg PIPZP = 0;
    reg RADRPT = 0;
    reg RCH13_n = 1;
    reg RCH14_n = 1;
    reg RCH33_n = 1;
    reg RCHAT_n = 1;
    reg RCHBT_n = 1;
    reg RNRADM = 0;
    reg RNRADP = 0;
    reg ROLGOF = 0; //input
    reg RRPONA = 0; //input
    reg RRRLSC = 0; //input
    reg S4BSAB = 0; //input
    reg SBY = 0;
    reg SCAFAL = 0;
    reg SHAFTD = 0;
    reg SHAFTM = 0;
    reg SHAFTP = 0;
    reg SIGNX = 0; //input
    reg SIGNY = 0; //input
    reg SIGNZ = 0; //input
    reg SMSEPR = 0; //input
    reg SPSRDY = 0; //input
    reg STNDBY_n = 1;
    reg STRPRS = 0;
    reg STRT2 = 0;
    reg T6ON_n = 1;
    reg TEMPIN = 0; //input
    reg TEMPIN_n = 1;
    reg TMPOUT = 0;
    reg TPOR_n = 1;
    reg TRANmX = 0; //input
    reg TRANmY = 0; //input
    reg TRANmZ = 0; //input
    reg TRANpX = 0; //input
    reg TRANpY = 0; //input
    reg TRANpZ = 0; //input
    reg TRNM = 0;
    reg TRNP = 0;
    reg TRST10 = 0;
    reg TRST9 = 0;
    reg TRUND = 0;
    reg ULLTHR = 0; //input
    reg UPL0 = 0; //input
    reg UPL1 = 0; //input
    reg UPRUPT = 0;
    reg VFAIL = 0;
    reg WCH13_n = 1;
    reg WCH14_n = 1;
    reg XLNK0 = 0; //input
    reg XLNK1 = 0; //input
    reg ZEROP = 0; //input
    reg n2FSFAL = 0;
    wire MGOJAM; //monitor output
    wire MT01; //monitor output
    wire MT02; //monitor output
    wire MT03; //monitor output
    wire MT04; //monitor output
    wire MT05; //monitor output
    wire MT06; //monitor output
    wire MT07; //monitor output
    wire MT08; //monitor output
    wire MT09; //monitor output
    wire MT10; //monitor output
    wire MT11; //monitor output
    wire MT12; //monitor output

    always #244.140625 CLOCK = !CLOCK;

`ifdef TARGET_FPGA
    always #10 SIM_CLK = !SIM_CLK;

    wire EPCS_CSN;
    wire EPCS_ASDI;
    wire EPCS_DCLK;
    reg EPCS_DATA = 0;
    
    fpga_agc AGC(VCC, GND, SIM_RST, SIM_CLK, ALGA, C24A, C25A, C26A, C27A, C30A, C37P, C40P, C41P, C42P, C43P, C44P, CA2_n, CA3_n, CAD1, CAD2, CAD3, CAD4, CAD5, CAD6, CDUSTB_n, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH08, CH09, CH10, CH11, CH12, CH13, CH14, CH16, CHINC, CHINC_n, CLOCK, DINC, DINC_n, DLKPLS, E5, E6, E7_n, EPCS_DATA, FETCH0, FETCH0_n, FETCH1, HNDRPT, INCSET_n, INKL, INKL_n, INOTLD, KYRPT1, KYRPT2, MAMU, MCDU, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MINC, MKRPT, MNHRPT, MNHSBF, MONPAR, MONPCH, MONWBK, MON_n, MSTP, MSTRTP, MTCSAI, OVNHRP, PCDU, PIPPLS_n, RADRPT, RCHAT_n, RCHBT_n, SBY, SHANC_n, SHIFT, SHIFT_n, STFET1_n, STORE1_n, STRT1, STRT2, UPRUPT, ZOUT_n, EPCS_ASDI, EPCS_DCLK, EPCS_CSN, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12);
`else
    agc AGC(VCC, GND, SIM_RST, SIM_CLK, ALTEST, BLKUPL_n, BMGXM, BMGXP, BMGYM, BMGYP, BMGZM, BMGZP, CAURST, CCH13, CCH14, CDUFAL, CDUSTB_n, CDUXD, CDUXM, CDUXP, CDUYD, CDUYM, CDUYP, CDUZD, CDUZM, CDUZP, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH0705, CH0706, CH0707, CH08, CH09, CH10, CH11, CH12, CH13, CH1301, CH1302, CH1303, CH1304, CH1307, CH1309, CH1310, CH1311, CH1316, CH14, CH1411, CH1412, CH1413, CH1414, CH1416, CH1501, CH1502, CH1503, CH1504, CH16, CH3312, CHWL01_n, CHWL02_n, CHWL03_n, CHWL04_n, CHWL05_n, CHWL06_n, CHWL07_n, CHWL08_n, CHWL09_n, CHWL10_n, CHWL11_n, CHWL12_n, CHWL13_n, CHWL14_n, CHWL16_n, CLOCK, CTLSAT, DBLTEST, DLKPLS, E5, E6, E7_n, FLASH, FLASH_n, FLTOUT, FREFUN, GATEX_n, GATEY_n, GATEZ_n, GCAPCL, GTONE, GTSET, GTSET_n, GUIREL, HNDRPT, HOLFUN, IMUCAG, IMUFAL, IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR, KYRPT1, KYRPT2, LEMATT, LFTOFF, LRRLSC, LVDAGD, MAMU, MANmP, MANmR, MANmY, MANpP, MANpR, MANpY, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MKRPT, MLDCH, MLOAD, MNHNC, MNHRPT, MNHSBF, MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, MONPAR, MONWBK, MRDCH, MREAD, MSTP, MSTRT, MTCSAI, NHALGA, NHVFAL, OPCDFL, OPMSW2, OPMSW3, OVNHRP, PCHGOF, PIPAFL, PIPPLS_n, PIPXM, PIPXP, PIPYM, PIPYP, PIPZM, PIPZP, RADRPT, RCH13_n, RCH14_n, RCH33_n, RCHAT_n, RCHBT_n, RNRADM, RNRADP, ROLGOF, RRPONA, RRRLSC, S4BSAB, SBY, SCAFAL, SHAFTD, SHAFTM, SHAFTP, SIGNX, SIGNY, SIGNZ, SMSEPR, SPSRDY, STNDBY_n, STRPRS, STRT2, T6ON_n, TEMPIN, TEMPIN_n, TPOR_n, TRANmX, TRANmY, TRANmZ, TRANpX, TRANpY, TRANpZ, TRNM, TRNP, TRST10, TRST9, TRUND, ULLTHR, UPL0, UPL1, UPRUPT, VFAIL, WCH13_n, WCH14_n, XLNK0, XLNK1, ZEROP, n2FSFAL, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12);
`endif


    initial begin
        $dumpfile("dump.lxt");
        $dumpvars(0, main);
        #5000 SIM_RST = 0;
        #50000 MSTRT = 1;
        #5000 MSTRT = 0;
        #50000000 $finish;
    end
endmodule
