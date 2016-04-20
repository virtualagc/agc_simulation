`timescale 1ns/1ps
`default_nettype none

module main;
    reg VCC = 1;
    reg GND = 0;
    reg SIM_RST = 1;
    reg SIM_CLK = 1;
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
    reg CCH34 = 0;
    reg CCH35 = 0;
    reg CDUFAL = 0; //input
    reg CDUSTB_n = 1;
    reg CDUXM = 0; //input
    reg CDUXP = 0; //input
    reg CDUYM = 0; //input
    reg CDUYP = 0; //input
    reg CDUZM = 0; //input
    reg CDUZP = 0; //input
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
    reg DKBSNC = 0; //input
    reg DKEND = 0; //input
    reg DKSTRT = 0; //input
    reg FLASH = 0;
    reg FLASH_n = 1;
    reg FLTOUT = 0;
    reg FREFUN = 0; //input
    reg GATEX_n = 1; //input
    reg GATEY_n = 1; //input
    reg GATEZ_n = 1; //input
    reg GCAPCL = 0; //input
    reg GTONE = 0;
    reg GTRST_n = 1;
    reg GTSET = 0;
    reg GTSET_n = 1;
    reg GUIREL = 0; //input
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
    reg LEMATT = 0; //input
    reg LFTOFF = 0; //input
    reg LRIN0 = 0; //input
    reg LRIN1 = 0; //input
    reg LRRLSC = 0; //input
    reg LVDAGD = 0; //input
    reg MAINRS = 0; //input
    reg MAMU = 0; //monitor input
    reg MANmP = 0; //input
    reg MANmR = 0; //input
    reg MANmY = 0; //input
    reg MANpP = 0; //input
    reg MANpR = 0; //input
    reg MANpY = 0; //input
    reg MARK = 0; //input
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
    reg MKEY1 = 0; //input
    reg MKEY2 = 0; //input
    reg MKEY3 = 0; //input
    reg MKEY4 = 0; //input
    reg MKEY5 = 0; //input
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
    reg MRKREJ = 0; //input
    reg MRKRST = 0; //input
    reg MSTP = 0; //monitor input
    reg MSTRT = 0; //monitor input
    reg MTCSAI = 0; //monitor input
    reg NAVRST = 0; //input
    reg NHALGA = 0; //monitor input
    reg NHVFAL = 0; //input
    reg NKEY1 = 0; //input
    reg NKEY2 = 0; //input
    reg NKEY3 = 0; //input
    reg NKEY4 = 0; //input
    reg NKEY5 = 0; //input
    reg OPCDFL = 0; //input
    reg OPMSW2 = 0; //input
    reg OPMSW3 = 0; //input
    reg PCHGOF; //input
    reg PIPAXm = 0; //input
    reg PIPAXp = 0; //input
    reg PIPAYm = 0; //input
    reg PIPAYp = 0; //input
    reg PIPAZm = 0; //input
    reg PIPAZp = 0; //input
    reg PIPPLS_n = 1;
    reg RCH13_n = 1;
    reg RCH14_n = 1;
    reg RCH33_n = 1;
    reg RCHAT_n = 1;
    reg RCHBT_n = 1;
    reg ROLGOF = 0; //input
    reg RRIN0 = 0; //input
    reg RRIN1 = 0; //input
    reg RRPONA = 0; //input
    reg RRRLSC = 0; //input
    reg S4BSAB = 0; //input
    reg SBYBUT = 0; //input
    reg SCAFAL = 0;
    reg SHAFTM = 0; //input
    reg SHAFTP = 0; //input
    reg SIGNX = 0; //input
    reg SIGNY = 0; //input
    reg SIGNZ = 0; //input
    reg SMSEPR = 0; //input
    reg SPSRDY = 0; //input
    reg STRPRS = 0; //input
    reg STRT2 = 0;
    reg TEMPIN = 0; //input
    reg TEMPIN_n = 1;
    reg TRANmX = 0; //input
    reg TRANmY = 0; //input
    reg TRANmZ = 0; //input
    reg TRANpX = 0; //input
    reg TRANpY = 0; //input
    reg TRANpZ = 0; //input
    reg TRNM = 0; //input
    reg TRNP = 0; //input
    reg TRST10 = 0; //input
    reg TRST9 = 0; //input
    reg ULLTHR = 0; //input
    reg UPL0 = 0; //input
    reg UPL1 = 0; //input
    reg VFAIL = 0;
    reg WCH13_n = 1;
    reg WCH14_n = 1;
    reg WCH34_n = 1;
    reg WCH35_n = 1;
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
    agc AGC(VCC, GND, SIM_RST, SIM_CLK, BLKUPL_n, BMGXM, BMGXP, BMGYM, BMGYP, BMGZM, BMGZP, CAURST, CCH13, CCH14, CCH34, CCH35, CDUFAL, CDUSTB_n, CDUXM, CDUXP, CDUYM, CDUYP, CDUZM, CDUZP, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH08, CH09, CH10, CH11, CH12, CH13, CH14, CH16, CHWL01_n, CHWL02_n, CHWL03_n, CHWL04_n, CHWL05_n, CHWL06_n, CHWL07_n, CHWL08_n, CHWL09_n, CHWL10_n, CHWL11_n, CHWL12_n, CHWL13_n, CHWL14_n, CHWL16_n, CLOCK, CTLSAT, DBLTEST, DKBSNC, DKEND, DKSTRT, FLASH, FLASH_n, FLTOUT, FREFUN, GATEX_n, GATEY_n, GATEZ_n, GCAPCL, GTONE, GTRST_n, GTSET, GTSET_n, GUIREL, HOLFUN, IMUCAG, IMUFAL, IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR, LEMATT, LFTOFF, LRIN0, LRIN1, LRRLSC, LVDAGD, MAINRS, MAMU, MANmP, MANmR, MANmY, MANpP, MANpR, MANpY, MARK, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MKEY1, MKEY2, MKEY3, MKEY4, MKEY5, MLDCH, MLOAD, MNHNC, MNHRPT, MNHSBF, MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, MONPAR, MONWBK, MRDCH, MREAD, MRKREJ, MRKRST, MSTP, MSTRT, MTCSAI, NAVRST, NHALGA, NHVFAL, NKEY1, NKEY2, NKEY3, NKEY4, NKEY5, OPCDFL, OPMSW2, OPMSW3, PCHGOF, PIPAXm, PIPAXp, PIPAYm, PIPAYp, PIPAZm, PIPAZp, PIPPLS_n, RCH13_n, RCH14_n, RCH33_n, RCHAT_n, RCHBT_n, ROLGOF, RRIN0, RRIN1, RRPONA, RRRLSC, S4BSAB, SBYBUT, SCAFAL, SHAFTM, SHAFTP, SIGNX, SIGNY, SIGNZ, SMSEPR, SPSRDY, STRPRS, STRT2, TEMPIN, TEMPIN_n, TRANmX, TRANmY, TRANmZ, TRANpX, TRANpY, TRANpZ, TRNM, TRNP, TRST10, TRST9, ULLTHR, UPL0, UPL1, VFAIL, WCH13_n, WCH14_n, WCH34_n, WCH35_n, XLNK0, XLNK1, ZEROP, n2FSFAL, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12);
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
