`timescale 1ns/1ps
`default_nettype none

module de0_nano_agc(OSC_50, KEY0, EPCS_DATA, EPCS_CSN, EPCS_DCLK, EPCS_ASDI, CAURST, MAINRS, MKEY1, MKEY2, MKEY3, MKEY4, MKEY5, PROCEED, COMACT, KYRLS, RESTRT, OPEROR, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05, RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14, RYWD16, SBYLIT, TMPCAU, UPLACT, VNFLSH, MT12);
    input wire OSC_50;
    input wire EPCS_DATA;
    input wire KEY0;
    output wire EPCS_CSN;
    output wire EPCS_DCLK;
    output wire EPCS_ASDI;

    reg p4VDC = 1;
	 wire p4VSW;
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
    wire DBLTST; //monitor input
    reg DKBSNC = 0; //input
    reg DKEND = 0; //input
    reg DKSTRT = 0; //input
    wire DOSCAL; //monitor input
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
    reg IMUOPR = 1; //input
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
    wire MAMU; //monitor input
    reg MANmP = 0; //input
    reg MANmR = 0; //input
    reg MANmY = 0; //input
    reg MANpP = 0; //input
    reg MANpR = 0; //input
    reg MANpY = 0; //input
    reg MARK = 0; //input
    wire MDT01; //monitor input
    wire MDT02; //monitor input
    wire MDT03; //monitor input
    wire MDT04; //monitor input
    wire MDT05; //monitor input
    wire MDT06; //monitor input
    wire MDT07; //monitor input
    wire MDT08; //monitor input
    wire MDT09; //monitor input
    wire MDT10; //monitor input
    wire MDT11; //monitor input
    wire MDT12; //monitor input
    wire MDT13; //monitor input
    wire MDT14; //monitor input
    wire MDT15; //monitor input
    wire MDT16; //monitor input
    input wire MKEY1; //input
    input wire MKEY2; //input
    input wire MKEY3; //input
    input wire MKEY4; //input
    input wire MKEY5; //input
    wire MLDCH; //monitor input
    wire MLOAD; //monitor input
    wire MNHNC; //monitor input
    wire MNHRPT; //monitor input
    wire MNHSBF; //monitor input
    reg MNIMmP = 0; //input
    reg MNIMmR = 0; //input
    reg MNIMmY = 0; //input
    reg MNIMpP = 0; //input
    reg MNIMpR = 0; //input
    reg MNIMpY = 0; //input
    wire MONPAR; //monitor input
    wire MONWBK; //monitor input
    wire MRDCH; //monitor input
    wire MREAD; //monitor input
    reg MRKREJ = 0; //input
    reg MRKRST = 0; //input
    wire MSTP; //monitor input
    wire MSTRT; //monitor input
    wire MTCSAI; //monitor input
    reg NAVRST = 0; //input
    wire NHALGA; //monitor input
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
    wire PIPAXm; //input
    wire PIPAXp; //input
    wire PIPAYm; //input
    wire PIPAYp; //input
    wire PIPAZm; //input
    wire PIPAZp; //input
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
    wire CDUXDP; //output
    wire CDUXDM; //output
    wire CDUYDP; //output
    wire CDUYDM; //output
    wire CDUZDP; //output
    wire CDUZDM; //output
    output wire COMACT; //output
    output wire KYRLS; //output
    wire MBR1; //monitor output
    wire MBR2; //monitor output
    wire MCTRAL_n; //monitor output
    wire MGOJAM; //monitor output
    wire MGP_n; //monitor output
    wire MIIP; //monitor output
    wire MINHL; //monitor output
    wire MINKL; //monitor output
    wire MNISQ; //monitor output
    wire MON800; //monitor output
    wire MONWT; //monitor output
    wire MOSCAL_n; //monitor output
    wire MPAL_n; //monitor output
    wire MPIPAL_n; //monitor output
    wire MRAG; //monitor output
    wire MRCH; //monitor output
    wire MREQIN; //monitor output
    wire MRGG; //monitor output
    wire MRLG; //monitor output
    wire MRPTAL_n; //monitor output
    wire MRSC; //monitor output
    wire MRULOG; //monitor output
    wire MSCAFL_n; //monitor output
    wire MSCDBL_n; //monitor output
    wire MSP; //monitor output
    wire MSQ10; //monitor output
    wire MSQ11; //monitor output
    wire MSQ12; //monitor output
    wire MSQ13; //monitor output
    wire MSQ14; //monitor output
    wire MSQ16; //monitor output
    wire MSQEXT; //monitor output
    wire MST1; //monitor output
    wire MST2; //monitor output
    wire MST3; //monitor output
    wire MSTPIT_n; //monitor output
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
    output wire MT12; //monitor output
    wire MTCAL_n; //monitor output
    wire MTCSA_n; //monitor output
    wire MVFAIL_n; //monitor output
    wire MWAG; //monitor output
    wire MWARNF_n; //monitor output
    wire MWATCH_n; //monitor output
    wire MWBBEG; //monitor output
    wire MWBG; //monitor output
    wire MWCH; //monitor output
    wire MWEBG; //monitor output
    wire MWFBG; //monitor output
    wire MWG; //monitor output
    wire MWL01; //monitor output
    wire MWL02; //monitor output
    wire MWL03; //monitor output
    wire MWL04; //monitor output
    wire MWL05; //monitor output
    wire MWL06; //monitor output
    wire MWL07; //monitor output
    wire MWL08; //monitor output
    wire MWL09; //monitor output
    wire MWL10; //monitor output
    wire MWL11; //monitor output
    wire MWL12; //monitor output
    wire MWL13; //monitor output
    wire MWL14; //monitor output
    wire MWL15; //monitor output
    wire MWL16; //monitor output
    wire MWLG; //monitor output
    wire MWQG; //monitor output
    wire MWSG; //monitor output
    wire MWYG; //monitor output
    wire MWZG; //monitor output
    output wire OPEROR; //output
    wire PIPASW; //output
    wire PIPDAT; //output
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
	 wire SBYREL_n;
    output wire TMPCAU; //output
    output wire UPLACT; //output
    output wire VNFLSH; //output
	 
	 assign p4VSW = (p4VDC && SBYREL_n);
    
    input wire PROCEED; //input
    assign IN3214 = PROCEED;
    assign SBYBUT = PROCEED;

    // Make a 51.2MHz system clock for propagating state, and a 2.048MHz clock
    // that serves as the AGC's clock source
    wire CLOCK;
    wire SIM_CLK;
    pll agc_clock(OSC_50, SIM_CLK, CLOCK);
    
    // Allow STRT2 to be injected via the KEY0 button 
    wire STRT2;
    assign STRT2 = ~KEY0;
  
    // PIPA spoofing -- simulate 3-3 moding on PIPA inputs, synced with PIPDAT
    // and counting on PIPASW
    reg [2:0] moding_counter = 3'b0;
    always @(posedge PIPASW) begin
        moding_counter = moding_counter + 3'b1;
        if (moding_counter == 3'd6) begin
            moding_counter = 3'b0;
        end
    end
  
    assign PIPAXm = PIPDAT && (moding_counter >= 3'd3);
    assign PIPAYm = PIPDAT && (moding_counter >= 3'd3);
    assign PIPAZm = PIPDAT && (moding_counter >= 3'd3);
    assign PIPAXp = PIPDAT && (moding_counter < 3'd3);
    assign PIPAYp = PIPDAT && (moding_counter < 3'd3);
    assign PIPAZp = PIPDAT && (moding_counter < 3'd3);

    jtag_monitor Monitor(SIM_CLK, MSTRT, MSTP, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MONPAR, MREAD, MLOAD, MRDCH, MLDCH, MTCSAI, MONWBK, MNHRPT, MNHNC, MNHSBF, MAMU, NHALGA, DBLTST, DOSCAL, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12, MWL01, MWL02, MWL03, MWL04, MWL05, MWL06, MWL07, MWL08, MWL09, MWL10, MWL11, MWL12, MWL13, MWL14, MWL15, MWL16, MSQ16, MSQ14, MSQ13, MSQ12, MSQ11, MSQ10, MSQEXT, MST1, MST2, MST3, MNISQ, MWAG, MWLG, MWQG, MWZG, MWBBEG, MWEBG, MWFBG, MWG, MWSG, MWBG, MWCH, MRGG, MREQIN, MTCSA_n);
    fpga_agc AGC(p4VDC, p4VSW, GND, SIM_RST, SIM_CLK, BLKUPL_n, BMGXM, BMGXP, BMGYM, BMGYP, BMGZM, BMGZP, CAURST, CDUFAL, CDUXM, CDUXP, CDUYM, CDUYP, CDUZM, CDUZP, CLOCK, CTLSAT, DBLTST, DKBSNC, DKEND, DKSTRT, DOSCAL, EPCS_DATA, FLTOUT, FREFUN, GATEX_n, GATEY_n, GATEZ_n, GCAPCL, GUIREL, HOLFUN, IMUCAG, IMUFAL, IMUOPR, IN3008, IN3212, IN3213, IN3214, IN3216, IN3301, ISSTOR, LEMATT, LFTOFF, LRIN0, LRIN1, LRRLSC, LVDAGD, MAINRS, MAMU, MANmP, MANmR, MANmY, MANpP, MANpR, MANpY, MARK, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MKEY1, MKEY2, MKEY3, MKEY4, MKEY5, MLDCH, MLOAD, MNHNC, MNHRPT, MNHSBF, MNIMmP, MNIMmR, MNIMmY, MNIMpP, MNIMpR, MNIMpY, MONPAR, MONWBK, MRDCH, MREAD, MRKREJ, MRKRST, MSTP, MSTRT, MTCSAI, NAVRST, NHALGA, NHVFAL, NKEY1, NKEY2, NKEY3, NKEY4, NKEY5, OPCDFL, OPMSW2, OPMSW3, PCHGOF, PIPAXm, PIPAXp, PIPAYm, PIPAYp, PIPAZm, PIPAZp, ROLGOF, RRIN0, RRIN1, RRPONA, RRRLSC, S4BSAB, SBYBUT, SCAFAL, SHAFTM, SHAFTP, SIGNX, SIGNY, SIGNZ, SMSEPR, SPSRDY, STRPRS, STRT2, TEMPIN, TRANmX, TRANmY, TRANmZ, TRANpX, TRANpY, TRANpZ, TRNM, TRNP, TRST10, TRST9, ULLTHR, UPL0, UPL1, VFAIL, XLNK0, XLNK1, ZEROP, n2FSFAL, CDUXDM, CDUXDP, CDUYDM, CDUYDP, CDUZDM, CDUZDP, COMACT, EPCS_ASDI, EPCS_CSN, EPCS_DCLK, KYRLS, MBR1, MBR2, MCTRAL_n, MGOJAM, MGP_n, MIIP, MINHL, MINKL, MNISQ, MON800, MONWT, MOSCAL_n, MPAL_n, MPIPAL_n, MRAG, MRCH, MREQIN, MRGG, MRLG, MRPTAL_n, MRSC, MRULOG, MSCAFL_n, MSCDBL_n, MSP, MSQ10, MSQ11, MSQ12, MSQ13, MSQ14, MSQ16, MSQEXT, MST1, MST2, MST3, MSTPIT_n, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12, MTCAL_n, MTCSA_n, MVFAIL_n, MWAG, MWARNF_n, MWATCH_n, MWBBEG, MWBG, MWCH, MWEBG, MWFBG, MWG, MWL01, MWL02, MWL03, MWL04, MWL05, MWL06, MWL07, MWL08, MWL09, MWL10, MWL11, MWL12, MWL13, MWL14, MWL15, MWL16, MWLG, MWQG, MWSG, MWYG, MWZG, OPEROR, PIPASW, PIPDAT, RESTRT, RLYB01, RLYB02, RLYB03, RLYB04, RLYB05, RLYB06, RLYB07, RLYB08, RLYB09, RLYB10, RLYB11, RYWD12, RYWD13, RYWD14, RYWD16, SBYLIT, SBYREL_n, TMPCAU, UPLACT, VNFLSH);

endmodule
