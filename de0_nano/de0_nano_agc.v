`timescale 1ns/1ps
`default_nettype none

module de0_nano_agc(OSC_50, KEY0, EPCS_DATA, EPCS_CSN, EPCS_DCLK, EPCS_ASDI, CAURST, MAINRS, MKEY1, MKEY2, MKEY3, MKEY4, MKEY5, PROCEED, COMACT, KYRLS, RESTRT, OPEROR, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05, RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14, RYWD16, SBYLIT, TMPCAU, UPLACT, VNFLSH);
    input wire OSC_50;
    input wire EPCS_DATA;
    input wire KEY0;
    output wire EPCS_CSN;
    output wire EPCS_DCLK;
    output wire EPCS_ASDI;

    reg VCC = 1;
    reg GND = 0;
    reg SIM_RST = 1;
    reg BLKUPL_n = 1; //input
    reg BMGXM = 0; //input
    reg BMGXP = 0; //input
    reg BMGYM = 0; //input
    reg BMGYP = 0; //input
    reg BMGZM = 0; //input
    reg BMGZP = 0; //input
    input wire CAURST; //input
    reg CDUFAL = 0; //input
    reg CDUXM = 0; //input
    reg CDUXP = 0; //input
    reg CDUYM = 0; //input
    reg CDUYP = 0; //input
    reg CDUZM = 0; //input
    reg CDUZP = 0; //input
    reg CTLSAT = 0; //input
    reg DBLTST = 0; //monitor input
    reg DKBSNC = 0; //input
    reg DKEND = 0; //input
    reg DKSTRT = 0; //input
    reg DOSCAL = 0; //input
    reg FLTOUT = 0;
    reg FREFUN = 0; //input
    reg GATEX_n = 1; //input
    reg GATEY_n = 1; //input
    reg GATEZ_n = 1; //input
    reg GCAPCL = 0; //input
    reg GUIREL = 0; //input
    reg HOLFUN = 0; //input
    reg IMUCAG = 0; //input
    reg IMUFAL = 0; //input
    reg IMUOPR = 0; //input
    reg IN3008 = 0; //input
    reg IN3212 = 0; //input
    reg IN3213 = 0; //input
    wire IN3214; //input
    reg IN3216 = 0; //input
    reg IN3301 = 0; //input
    reg ISSTOR = 0; //input
    reg LEMATT = 0; //input
    reg LFTOFF = 0; //input
    reg LRIN0 = 0; //input
    reg LRIN1 = 0; //input
    reg LRRLSC = 0; //input
    reg LVDAGD = 0; //input
    input wire MAINRS; //input
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
    input wire MKEY1; //input
    input wire MKEY2; //input
    input wire MKEY3; //input
    input wire MKEY4; //input
    input wire MKEY5; //input
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
    reg PCHGOF = 0; //input
    reg PIPAXm = 0; //input
    reg PIPAXp = 0; //input
    reg PIPAYm = 0; //input
    reg PIPAYp = 0; //input
    reg PIPAZm = 0; //input
    reg PIPAZp = 0; //input
    reg ROLGOF = 0; //input
    reg RRIN0 = 0; //input
    reg RRIN1 = 0; //input
    reg RRPONA = 0; //input
    reg RRRLSC = 0; //input
    reg S4BSAB = 0; //input
    wire SBYBUT; //input
    reg SCAFAL = 0;
    reg SHAFTM = 0; //input
    reg SHAFTP = 0; //input
    reg SIGNX = 0; //input
    reg SIGNY = 0; //input
    reg SIGNZ = 0; //input
    reg SMSEPR = 0; //input
    reg SPSRDY = 0; //input
    reg STRPRS = 0; //input
    reg TEMPIN = 1; //input
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
    reg XLNK0 = 0; //input
    reg XLNK1 = 0; //input
    reg ZEROP = 0; //input
    reg n2FSFAL = 0;
    output wire COMACT; //output
    output wire KYRLS; //output
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
    output wire OPEROR; //output
    output wire RESTRT; //output
    output wire RLYB01; //output
    output wire RLYB02; //output
    output wire RLYB03; //output
    output wire RLYB04; //output
    output wire RLYB05; //output
    output wire RLYB06; //output
    output wire RLYB07; //output
    output wire RLYB08; //output
    output wire RLYB09; //output
    output wire RLYB10; //output
    output wire RLYB11; //output
    output wire RYWD12; //output
    output wire RYWD13; //output
    output wire RYWD14; //output
    output wire RYWD16; //output
    output wire SBYLIT; //output
    output wire TMPCAU; //output
    output wire UPLACT; //output
    output wire VNFLSH; //output
	 
	 input wire PROCEED; //input
	 assign IN3214 = PROCEED;
	 assign SBYBUT = PROCEED;

    // Make a 51.2MHz system clock for propagating state, and a 2.048MHz clock
    // that serves as the AGC's clock source
    wire CLOCK;
    wire SIM_CLK;
    pll agc_clock(OSC_50, SIM_CLK, CLOCK);
     
    wire STRT2;
    assign STRT2 = ~KEY0;
     
    fpga_agc AGC(VCC, GND, SIM_RST, SIM_CLK, BLKUPL_n, BMGXM, BMGXP, BMGYM, BMGYP, BMGZM, BMGZP, CAURST, CDUFAL, CDUXM, CDUXP, CDUYM, CDUYP, CDUZM, CDUZP, CLOCK, CTLSAT, DBLTST, DKBSNC, DKEND, DKSTRT, DOSCAL, EPCS_DATA, FLTOUT, FREFUN, GATEX_n, GATEY_n, GATEZ_n, GCAPCL, GUIREL, HOLFUN, IMUCAG, IMUFAL, IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR, LEMATT, LFTOFF, LRIN0, LRIN1, LRRLSC, LVDAGD, MAINRS, MAMU, MANmP, MANmR, MANmY, MANpP, MANpR, MANpY, MARK, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MKEY1, MKEY2, MKEY3, MKEY4, MKEY5, MLDCH, MLOAD, MNHNC, MNHRPT, MNHSBF, MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, MONPAR, MONWBK, MRDCH, MREAD, MRKREJ, MRKRST, MSTP, MSTRT, MTCSAI, NAVRST, NHALGA, NHVFAL, NKEY1, NKEY2, NKEY3, NKEY4, NKEY5, OPCDFL, OPMSW2, OPMSW3, PCHGOF, PIPAXm, PIPAXp, PIPAYm, PIPAYp, PIPAZm, PIPAZp, ROLGOF, RRIN0, RRIN1, RRPONA, RRRLSC, S4BSAB, SBYBUT, SCAFAL, SHAFTM, SHAFTP, SIGNX, SIGNY, SIGNZ, SMSEPR, SPSRDY, STRPRS, STRT2, TEMPIN, TRANmX, TRANmY, TRANmZ, TRANpX, TRANpY, TRANpZ, TRNM, TRNP, TRST10, TRST9, ULLTHR, UPL0, UPL1, VFAIL, XLNK0, XLNK1, ZEROP, n2FSFAL, COMACT, EPCS_ASDI, EPCS_CSN, EPCS_DCLK, KYRLS, MGOJAM, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12, OPEROR, RESTRT, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05, RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14, RYWD16, SBYLIT, TMPCAU, UPLACT, VNFLSH);

endmodule
