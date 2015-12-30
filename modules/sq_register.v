`timescale 1ns/1ps

module sq_register(VCC, GND, SIM_RST, GOJAM, T01_n, T02, T12_n, PHS2_n, RT_n, CT_n, WT_n, WL16_n, WL14_n, WL13_n, WL12_n, WL11_n, WL10_n, INKL, INHPLS, RELPLS, OVNHRP, RUPTOR_n, RPTSET, KRPT, ST0_n, ST1_n, STD2, ST3_n, BR2_n, BR1B2B, RXOR0, EXT, EXTPLS, NISQ, n5XP4, MTCSAI, MNHRPT, RBSQ, SQ0_n, SQ1_n, SQ2_n, QC0_n, QC1_n, QC2_n, QC3_n, SQR12_n, SQR10, SQR10_n, SQEXT_n, EXST0_n, EXST1_n, STRTFC, AD0, ADS0, AUG0_n, CCS0, CCS0_n, DAS0, DAS0_n, DAS1, DAS1_n, DCA0, DCS0, DIM0_n, DXCH0, GOJ1, GOJ1_n, INCR0, MASK0, MASK0_n, MP0, MP0_n, MP1, MP1_n, MP3, MP3_n, MP3A, MSU0, MSU0_n, NDX0_n, NDXX1_n, QXCH0_n, RSM3, RSM3_n, SU0, TC0, TC0_n, TCF0, TCSAJ3_n, TS0, TS0_n, IC1, IC2, IC2_n, IC3, IC4, IC5, IC5_n, IC6, IC7, IC8_n, IC9, IC10, IC10_n, IC11, IC11_n, IC12, IC12_n, IC13, IC14, IC15, IC15_n, IC16, IC16_n, IC17);
    input wire SIM_RST;
    output wire AD0;
    output wire ADS0;
    output wire AUG0_n;
    input wire BR1B2B;
    input wire BR2_n;
    output wire CCS0;
    output wire CCS0_n;
    input wire CT_n;
    output wire DAS0;
    output wire DAS0_n;
    output wire DAS1;
    output wire DAS1_n;
    output wire DCA0;
    output wire DCS0;
    output wire DIM0_n;
    output wire DXCH0;
    output wire EXST0_n;
    output wire EXST1_n;
    input wire EXT;
    input wire EXTPLS;
    input wire GND;
    output wire GOJ1;
    output wire GOJ1_n;
    input wire GOJAM;
    output wire IC1;
    output wire IC10;
    output wire IC10_n;
    output wire IC11;
    output wire IC11_n;
    output wire IC12;
    output wire IC12_n;
    output wire IC13;
    output wire IC14;
    output wire IC15;
    output wire IC15_n;
    output wire IC16;
    output wire IC16_n;
    output wire IC17;
    output wire IC2;
    output wire IC2_n;
    output wire IC3;
    output wire IC4;
    output wire IC5;
    output wire IC5_n;
    output wire IC6;
    output wire IC7;
    output wire IC8_n;
    output wire IC9;
    output wire INCR0;
    input wire INHPLS;
    input wire INKL;
    input wire KRPT;
    output wire MASK0;
    output wire MASK0_n;
    input wire MNHRPT;
    output wire MP0;
    output wire MP0_n;
    output wire MP1;
    output wire MP1_n;
    output wire MP3;
    output wire MP3A;
    output wire MP3_n;
    output wire MSU0;
    output wire MSU0_n;
    input wire MTCSAI;
    output wire NDX0_n;
    output wire NDXX1_n;
    wire NET_161;
    wire NET_163;
    wire NET_164;
    wire NET_165;
    wire NET_166;
    wire NET_167;
    wire NET_168;
    wire NET_169;
    wire NET_170;
    wire NET_171;
    wire NET_172;
    wire NET_174;
    wire NET_175;
    wire NET_176;
    wire NET_177;
    wire NET_178;
    wire NET_179;
    wire NET_180;
    wire NET_181;
    wire NET_182;
    wire NET_183;
    wire NET_184;
    wire NET_185;
    wire NET_186;
    wire NET_187;
    wire NET_188;
    wire NET_189;
    wire NET_190;
    wire NET_191;
    wire NET_192;
    wire NET_193;
    wire NET_194;
    wire NET_195;
    wire NET_196;
    wire NET_197;
    wire NET_198;
    wire NET_199;
    wire NET_200;
    wire NET_201;
    wire NET_202;
    wire NET_203;
    wire NET_204;
    wire NET_205;
    wire NET_206;
    wire NET_207;
    wire NET_208;
    wire NET_209;
    wire NET_210;
    wire NET_212;
    wire NET_213;
    wire NET_214;
    wire NET_215;
    wire NET_216;
    wire NET_217;
    wire NET_218;
    wire NET_219;
    wire NET_220;
    wire NET_221;
    wire NET_222;
    wire NET_223;
    wire NET_226;
    wire NET_227;
    wire NET_228;
    wire NET_229;
    wire NET_232;
    wire NET_233;
    input wire NISQ;
    input wire OVNHRP;
    input wire PHS2_n;
    output wire QC0_n;
    output wire QC1_n;
    output wire QC2_n;
    output wire QC3_n;
    output wire QXCH0_n;
    output wire RBSQ;
    input wire RELPLS;
    inout wire RPTSET;
    output wire RSM3;
    output wire RSM3_n;
    input wire RT_n;
    input wire RUPTOR_n;
    input wire RXOR0;
    output wire SQ0_n;
    output wire SQ1_n;
    output wire SQ2_n;
    output wire SQEXT_n;
    output wire SQR10;
    output wire SQR10_n;
    output wire SQR12_n;
    input wire ST0_n;
    input wire ST1_n;
    input wire ST3_n;
    input wire STD2;
    output wire STRTFC;
    output wire SU0;
    input wire T01_n;
    input wire T02;
    input wire T12_n;
    output wire TC0;
    output wire TC0_n;
    output wire TCF0;
    output wire TCSAJ3_n;
    output wire TS0;
    output wire TS0_n;
    input wire VCC;
    input wire WL10_n;
    input wire WL11_n;
    input wire WL12_n;
    input wire WL13_n;
    input wire WL14_n;
    input wire WL16_n;
    input wire WT_n;
    wire __A03_1__CSQG;
    wire __A03_1__FUTEXT;
    wire __A03_1__IIP;
    wire __A03_1__IIP_n;
    wire __A03_1__INHINT;
    wire __A03_1__INKBT1;
    wire __A03_1__MIIP;
    wire __A03_1__MINHL;
    wire __A03_1__MSQ10;
    wire __A03_1__MSQ11;
    wire __A03_1__MSQ12;
    wire __A03_1__MSQ13;
    wire __A03_1__MSQ14;
    wire __A03_1__MSQ16;
    wire __A03_1__MSQEXT;
    wire __A03_1__NISQL;
    wire __A03_1__NISQL_n;
    wire __A03_1__QC0;
    wire __A03_1__RPTFRC;
    wire __A03_1__SQ3_n;
    wire __A03_1__SQ4_n;
    wire __A03_1__SQ5_n;
    wire __A03_1__SQ6_n;
    wire __A03_1__SQ7_n;
    wire __A03_1__SQEXT;
    wire __A03_1__SQR11;
    wire __A03_1__SQR12;
    wire __A03_1__SQR13;
    wire __A03_1__SQR14;
    wire __A03_1__SQR16;
    wire __A03_1__WSQG_n;
    wire __A03_1__wsqg;
    wire __A03_2__AUG0;
    wire __A03_2__BMF0;
    wire __A03_2__BMF0_n;
    wire __A03_2__BZF0;
    wire __A03_2__BZF0_n;
    wire __A03_2__DIM0;
    wire __A03_2__IC13_n;
    wire __A03_2__IC3_n;
    wire __A03_2__IC4_n;
    wire __A03_2__IC9_n;
    wire __A03_2__LXCH0;
    wire __A03_2__NDX0;
    wire __A03_2__NDXX1;
    wire __A03_2__NEXST0;
    wire __A03_2__NEXST0_n;
    wire __A03_2__QXCH0;
    wire __A03_2__SQ5QC0_n;
    wire __A03_2__TCSAJ3;
    input wire n5XP4;

    pullup R3001(RPTSET);
    pullup R3002(__A03_2__IC13_n);
    U74HC02 #(1, 0, 0, 0) U3001(NET_166, NISQ, __A03_1__NISQL, NET_167, STRTFC, NET_168, GND, RT_n, NET_163, RBSQ, NET_163, WT_n, __A03_1__wsqg, VCC, SIM_RST);
    U74HC27 U3002(NET_166, __A03_1__INKBT1, T12_n, NET_166, __A03_1__RPTFRC, NET_168, GND, __A03_1__CSQG, T12_n, CT_n, NET_167, __A03_1__NISQL, STRTFC, VCC, SIM_RST);
    U74HC04 #(0, 0, 0, 0, 0, 1) U3003(__A03_1__NISQL, __A03_1__NISQL_n, NET_168, NET_163, __A03_1__wsqg, __A03_1__WSQG_n, GND, STRTFC, NET_161, __A03_1__SQEXT, NET_175, SQEXT_n, NET_174, VCC, SIM_RST);
    wire U3004_11_NC;
    wire U3004_12_NC;
    wire U3004_13_NC;
    U74HC02 U3004(NET_197, WL16_n, __A03_1__WSQG_n, NET_210, WL14_n, __A03_1__WSQG_n, GND, WL13_n, __A03_1__WSQG_n, NET_209, U3004_11_NC, U3004_12_NC, U3004_13_NC, VCC, SIM_RST);
    U74HC02 U3005(NET_161, GOJAM, MTCSAI, NET_165, __A03_1__NISQL_n, T12_n, GND, STRTFC, NET_165, NET_172, NET_172, NET_164, NET_171, VCC, SIM_RST);
    U74HC27 #(1, 0, 1) U3006(EXTPLS, EXT, NET_164, __A03_1__INKBT1, STRTFC, __A03_1__FUTEXT, GND, NET_175, __A03_1__RPTFRC, NET_171, NET_174, NET_164, __A03_1__FUTEXT, VCC, SIM_RST);
    U74HC02 #(0, 0, 1, 1) U3007(NET_170, NET_172, __A03_1__FUTEXT, NET_174, NET_175, NET_170, GND, INHPLS, __A03_1__INHINT, NET_169, KRPT, __A03_1__IIP, __A03_1__IIP_n, VCC, SIM_RST);
    U74HC04 U3008(NET_175, __A03_1__MSQEXT, NET_169, __A03_1__MINHL, __A03_1__IIP_n, __A03_1__MIIP, GND, __A03_1__MSQ16, NET_202, __A03_1__MSQ14, NET_188, __A03_1__MSQ13, NET_190, VCC, SIM_RST);
    U74HC27 U3009(NET_169, RELPLS, __A03_1__IIP_n, GOJAM, n5XP4, __A03_1__IIP, GND, NET_196, __A03_1__FUTEXT, __A03_1__NISQL_n, T12_n, __A03_1__INHINT, GOJAM, VCC, SIM_RST);
    U74HC27 U3010(PHS2_n, RUPTOR_n, OVNHRP, __A03_1__INHINT, __A03_1__IIP, NET_194, GND, NET_192, NET_193, STRTFC, T02, NET_195, MNHRPT, VCC, SIM_RST);
    wire U3011_8_NC;
    wire U3011_9_NC;
    wire U3011_10_NC;
    wire U3011_11_NC;
    wire U3011_12_NC;
    wire U3011_13_NC;
    U74LVC07 U3011(NET_196, RPTSET, NET_195, RPTSET, NET_194, RPTSET, GND, U3011_8_NC, U3011_9_NC, U3011_10_NC, U3011_11_NC, U3011_12_NC, U3011_13_NC, VCC, SIM_RST);
    U74HC02 #(1, 1, 1, 1) U3012(NET_193, RPTSET, NET_192, NET_202, NET_197, __A03_1__SQR16, GND, NET_210, __A03_1__SQR14, NET_188, NET_209, __A03_1__SQR13, NET_190, VCC, SIM_RST);
    U74HC27 U3013(NET_202, __A03_1__RPTFRC, NET_188, __A03_1__RPTFRC, __A03_1__CSQG, __A03_1__SQR14, GND, __A03_1__SQR13, NET_190, __A03_1__RPTFRC, __A03_1__CSQG, __A03_1__SQR16, __A03_1__CSQG, VCC, SIM_RST);
    wire U3014_8_NC;
    wire U3014_9_NC;
    wire U3014_10_NC;
    wire U3014_11_NC;
    wire U3014_12_NC;
    wire U3014_13_NC;
    U74HC02 #(0, 1, 0, 0) U3014(NET_200, NET_202, INKL, NET_199, INKL, __A03_1__SQR16, GND, U3014_8_NC, U3014_9_NC, U3014_10_NC, U3014_11_NC, U3014_12_NC, U3014_13_NC, VCC, SIM_RST);
    U74HC27 #(1, 0, 0) U3015(NET_189, NET_187, NET_190, NET_187, NET_203, NET_201, GND, NET_208, NET_189, NET_188, NET_203, NET_198, NET_203, VCC, SIM_RST);
    U74HC27 U3016(NET_190, NET_188, NET_189, NET_187, NET_186, NET_206, GND, NET_178, NET_190, NET_187, NET_186, NET_207, NET_203, VCC, SIM_RST);
    U74HC27 #(0, 0, 1) U3017(NET_189, NET_186, NET_190, NET_188, NET_186, NET_204, GND, NET_191, __A03_1__RPTFRC, NET_185, __A03_1__SQR12, NET_205, NET_188, VCC, SIM_RST);
    U74HC04 U3018(NET_201, SQ1_n, NET_208, SQ2_n, NET_207, __A03_1__SQ3_n, GND, __A03_1__SQ4_n, NET_206, __A03_1__SQ6_n, NET_205, __A03_1__SQ7_n, NET_204, VCC, SIM_RST);
    U74HC02 U3019(NET_185, WL12_n, __A03_1__WSQG_n, NET_177, WL11_n, __A03_1__WSQG_n, GND, NET_191, __A03_1__CSQG, __A03_1__SQR12, NET_176, __A03_1__CSQG, __A03_1__SQR11, VCC, SIM_RST);
    U74HC27 #(1, 1, 0) U3020(__A03_1__RPTFRC, NET_177, __A03_1__RPTFRC, NET_184, NET_183, NET_182, GND, __A03_1__INKBT1, INKL, T01_n, STD2, NET_176, __A03_1__SQR11, VCC, SIM_RST);
    U74HC04 U3021(NET_191, __A03_1__MSQ12, NET_176, __A03_1__MSQ11, NET_182, __A03_1__MSQ10, GND, SQR12_n, __A03_1__SQR12, __A03_1__RPTFRC, NET_193, __A03_1__SQ5_n, NET_178, VCC, SIM_RST);
    U74HC02 U3022(__A03_1__QC0, __A03_1__SQR11, __A03_1__SQR12, NET_181, NET_176, __A03_1__SQR12, GND, __A03_1__SQR11, NET_191, NET_180, NET_191, NET_176, NET_179, VCC, SIM_RST);
    U74HC04 U3023(__A03_1__QC0, QC0_n, NET_181, QC1_n, NET_180, QC2_n, GND, QC3_n, NET_179, SQR10, NET_182, SQR10_n, NET_183, VCC, SIM_RST);
    wire U3024_8_NC;
    wire U3024_9_NC;
    wire U3024_10_NC;
    wire U3024_11_NC;
    wire U3024_12_NC;
    wire U3024_13_NC;
    U74HC02 U3024(NET_184, WL10_n, __A03_1__WSQG_n, NET_183, NET_182, __A03_1__CSQG, GND, U3024_8_NC, U3024_9_NC, U3024_10_NC, U3024_11_NC, U3024_12_NC, U3024_13_NC, VCC, SIM_RST);
    U74HC04 U3025(NET_200, NET_186, NET_199, NET_203, NET_188, NET_187, GND, NET_189, NET_190, SQ0_n, NET_198, MP3A, MP3_n, VCC, SIM_RST);
    U74HC02 U3026(NET_227, __A03_1__SQ5_n, QC0_n, NET_228, __A03_1__SQ5_n, SQEXT_n, GND, NET_227, NET_228, NET_229, NET_229, ST0_n, IC1, VCC, SIM_RST);
    U74HC04 #(0, 0, 0, 0, 0, 1) U3027(NET_227, __A03_2__SQ5QC0_n, IC2, IC2_n, NET_233, EXST1_n, GND, TC0_n, TC0, IC3, __A03_2__IC3_n, __A03_2__NEXST0_n, __A03_2__NEXST0, VCC, SIM_RST);
    U74HC02 U3028(IC2, NET_229, ST1_n, NET_226, SQEXT_n, __A03_1__QC0, GND, SQEXT_n, ST1_n, NET_233, NET_233, __A03_2__NEXST0, NET_232, VCC, SIM_RST);
    U74HC27 U3029(NET_226, __A03_1__SQ6_n, SQ1_n, __A03_2__NEXST0_n, __A03_1__QC0, TCF0, GND, __A03_2__IC3_n, TC0, STD2, TCF0, IC11, ST0_n, VCC, SIM_RST);
    U74HC02 U3030(IC6, NET_232, __A03_1__SQ3_n, IC7, NET_232, __A03_1__SQ4_n, GND, SQ0_n, __A03_2__NEXST0_n, TC0, __A03_1__SQEXT, ST0_n, __A03_2__NEXST0, VCC, SIM_RST);
    U74HC02 U3031(DCS0, __A03_1__SQ4_n, EXST0_n, DCA0, EXST0_n, __A03_1__SQ3_n, GND, DCS0, DCA0, __A03_2__IC4_n, QC1_n, ST1_n, NET_216, VCC, SIM_RST);
    U74HC27 U3032(IC7, IC6, IC1, DCS0, DCA0, NET_220, GND, IC5, NET_214, __A03_1__SQ5_n, __A03_1__SQEXT, NET_221, IC11, VCC, SIM_RST);
    wire U3033_5_NC;
    wire U3033_6_NC;
    wire U3033_8_NC;
    wire U3033_9_NC;
    wire U3033_10_NC;
    wire U3033_11_NC;
    wire U3033_12_NC;
    wire U3033_13_NC;
    U74LVC07 U3033(NET_221, __A03_2__IC13_n, NET_220, __A03_2__IC13_n, U3033_5_NC, U3033_6_NC, GND, U3033_8_NC, U3033_9_NC, U3033_10_NC, U3033_11_NC, U3033_12_NC, U3033_13_NC, VCC, SIM_RST);
    U74HC04 U3034(__A03_2__IC4_n, IC4, __A03_2__IC13_n, IC13, IC5, IC5_n, GND, IC9, __A03_2__IC9_n, QXCH0_n, __A03_2__QXCH0, EXST0_n, NET_213, VCC, SIM_RST);
    U74HC02 U3035(NET_215, QC3_n, ST0_n, NET_214, NET_216, NET_215, GND, __A03_2__LXCH0, DXCH0, IC8_n, ST0_n, SQEXT_n, NET_213, VCC, SIM_RST);
    U74HC27 U3036(__A03_2__NEXST0_n, QC1_n, SQ2_n, QC1_n, EXST0_n, __A03_2__QXCH0, GND, TS0, __A03_1__SQ5_n, QC2_n, __A03_2__NEXST0_n, __A03_2__LXCH0, SQ2_n, VCC, SIM_RST);
    U74HC4002 U3037(__A03_2__IC9_n, IC5, TS0, __A03_2__QXCH0, __A03_2__LXCH0, NET_223, GND, NET_222, SQ2_n, QC0_n, __A03_1__SQEXT, ST1_n, NET_212, VCC, SIM_RST);
    U74HC04 U3038(TS0, TS0_n, IC10_n, IC10, DAS0, DAS0_n, GND, __A03_2__BZF0_n, __A03_2__BZF0, __A03_2__BMF0_n, __A03_2__BMF0, IC16, IC16_n, VCC, SIM_RST);
    U74HC27 U3039(__A03_1__SQ5_n, __A03_2__NEXST0_n, SQ2_n, __A03_2__NEXST0_n, QC0_n, DAS0, GND, IC10_n, IC4, DXCH0, DAS0, DXCH0, QC1_n, VCC, SIM_RST);
    U74HC27 U3040(SQ1_n, QC0_n, EXST0_n, QC0_n, __A03_1__SQ6_n, __A03_2__BMF0, GND, CCS0, SQ1_n, QC0_n, __A03_2__NEXST0_n, __A03_2__BZF0, EXST0_n, VCC, SIM_RST);
    U74HC02 U3041(IC15_n, __A03_2__BMF0, __A03_2__BZF0, NET_218, __A03_2__BZF0_n, BR2_n, GND, __A03_2__BMF0_n, BR1B2B, NET_217, NET_218, NET_217, IC16_n, VCC, SIM_RST);
    U74HC02 U3042(IC17, IC16, IC15_n, DAS1_n, NET_212, ADS0, GND, CCS0, MSU0, IC12_n, __A03_1__SQ7_n, __A03_2__NEXST0_n, MASK0, VCC, SIM_RST);
    U74HC04 U3043(IC15_n, IC15, CCS0, CCS0_n, DAS1_n, DAS1, GND, IC12, IC12_n, MSU0_n, MSU0, AUG0_n, __A03_2__AUG0, VCC, SIM_RST);
    U74HC27 U3044(SQ2_n, QC3_n, QC2_n, SQ2_n, __A03_2__NEXST0_n, INCR0, GND, MSU0, SQ2_n, EXST0_n, QC0_n, ADS0, __A03_2__NEXST0_n, VCC, SIM_RST);
    U74HC27 U3045(SQ2_n, EXST0_n, SQ2_n, EXST0_n, QC3_n, __A03_2__DIM0, GND, MP3, ST3_n, __A03_1__SQ7_n, SQEXT_n, __A03_2__AUG0, QC2_n, VCC, SIM_RST);
    U74HC04 U3046(__A03_2__DIM0, DIM0_n, MP3, MP3_n, MP1, MP1_n, GND, MP0_n, MP0, TCSAJ3_n, __A03_2__TCSAJ3, RSM3_n, RSM3, VCC, SIM_RST);
    U74HC27 U3047(ST1_n, __A03_1__SQ7_n, ST0_n, __A03_1__SQ7_n, SQEXT_n, MP0, GND, __A03_2__TCSAJ3, SQ0_n, __A03_1__SQEXT, ST3_n, MP1, SQEXT_n, VCC, SIM_RST);
    U74HC27 U3048(ST3_n, __A03_2__SQ5QC0_n, __A03_1__SQ6_n, EXST0_n, QC0_n, SU0, GND, NET_219, MP0, MASK0, RXOR0, RSM3, __A03_1__SQEXT, VCC, SIM_RST);
    U74HC04 #(0, 0, 0, 0, 1, 0) U3049(MASK0, MASK0_n, NET_219, IC14, __A03_2__NDX0, NDX0_n, GND, NDXX1_n, __A03_2__NDXX1, GOJ1_n, GOJ1, IC11_n, IC11, VCC, SIM_RST);
    wire U3050_4_NC;
    wire U3050_5_NC;
    wire U3050_6_NC;
    wire U3050_8_NC;
    wire U3050_9_NC;
    wire U3050_10_NC;
    wire U3050_11_NC;
    wire U3050_12_NC;
    wire U3050_13_NC;
    U74HC02 U3050(AD0, __A03_2__NEXST0_n, __A03_1__SQ6_n, U3050_4_NC, U3050_5_NC, U3050_6_NC, GND, U3050_8_NC, U3050_9_NC, U3050_10_NC, U3050_11_NC, U3050_12_NC, U3050_13_NC, VCC, SIM_RST);
    U74HC27 U3051(__A03_2__NEXST0_n, __A03_1__SQ5_n, SQEXT_n, __A03_1__SQ5_n, ST1_n, __A03_2__NDXX1, GND, GOJ1, __A03_1__SQEXT, ST1_n, SQ0_n, __A03_2__NDX0, QC0_n, VCC, SIM_RST);
endmodule