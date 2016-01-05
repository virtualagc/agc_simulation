`timescale 1ns/1ps

module stage_branch(VCC, GND, SIM_RST, GOJAM, PHS2_n, PHS3_n, PHS4, PHS4_n, T01, T03, T01_n, T02_n, T03_n, T04_n, T05_n, T06_n, T07_n, T08_n, T09_n, T10_n, T11_n, T12_n, SQ0_n, SQ1_n, SQ2_n, QC0_n, QC1_n, QC2_n, QC3_n, SQEXT_n, SQR10, SQR10_n, SQR12_n, STRTFC, WL16_n, WL15_n, WL14_n, WL13_n, WL12_n, WL11_n, WL10_n, WL09_n, WL08_n, WL07_n, WL06_n, WL05_n, WL04_n, WL03_n, WL02_n, WL01_n, OVF_n, UNF_n, SUMA16_n, SUMB16_n, EXST0_n, EXST1_n, ST1, ST2, RSTSTG, TMZ_n, TOV_n, TSGN_n, TSGU_n, TPZG_n, DVST, GEQZRO_n, TRSM, NDR100_n, INKL, L15_n, TL15, XT1_n, XB7_n, MTCSAI, MP0_n, MP1, MP3A, MP3_n, IC12, IC13, IC15, IC15_n, TS0_n, RSM3, RSM3_n, STORE1_n, n7XP14, T12USE_n, ST0_n, ST1_n, STD2, ST3_n, ST4_n, BR1, BR1_n, BR2, BR2_n, BRDIF_n, BR12B_n, BR1B2_n, BR1B2B, BR1B2B_n, DIVSTG, KRPT, INOUT, INOUT_n, DIV_n, DV1, DV1_n, DV1376, DV1376_n, DV376_n, DV4, DV4_n, PRINC, RAND0, READ0, ROR0, RUPT0, RUPT1, RXOR0, RXOR0_n, WAND0, WOR0, B15X, CI_n, R15, R1C_n, RA_n, RB_n, RB1_n, RB2, RC_n, RSC_n, RRPA, WCH_n, WG_n, WL_n, WY_n, n8PP4, n1XP10, n2XP3, n2XP5, n3XP2, n3XP7, n4XP5, n4XP11, n5XP4, n5XP11, n5XP28, n6XP5, n7XP19, n8XP6, n9XP1, MP0T10);
    input wire SIM_RST;
    output wire B15X;
    output wire BR1;
    output wire BR12B_n;
    output wire BR1B2B;
    output wire BR1B2B_n;
    output wire BR1B2_n;
    output wire BR1_n;
    output wire BR2;
    output wire BR2_n;
    output wire BRDIF_n;
    inout wire CI_n;
    output wire DIVSTG;
    output wire DIV_n;
    output wire DV1;
    output wire DV1376;
    output wire DV1376_n;
    output wire DV1_n;
    output wire DV376_n;
    output wire DV4;
    output wire DV4_n;
    input wire DVST;
    input wire EXST0_n;
    input wire EXST1_n;
    input wire GEQZRO_n;
    input wire GND;
    input wire GOJAM;
    input wire IC12;
    input wire IC13;
    input wire IC15;
    input wire IC15_n;
    input wire INKL;
    output wire INOUT;
    output wire INOUT_n;
    output wire KRPT;
    input wire L15_n;
    output wire MP0T10;
    input wire MP0_n;
    input wire MP1;
    input wire MP3A;
    input wire MP3_n;
    input wire MTCSAI;
    input wire NDR100_n;
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
    wire NET_210;
    wire NET_211;
    wire NET_212;
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
    wire NET_230;
    wire NET_231;
    wire NET_232;
    wire NET_233;
    wire NET_234;
    wire NET_235;
    wire NET_236;
    wire NET_237;
    wire NET_238;
    wire NET_239;
    wire NET_240;
    wire NET_241;
    wire NET_242;
    wire NET_243;
    wire NET_244;
    wire NET_245;
    wire NET_246;
    wire NET_247;
    wire NET_248;
    wire NET_249;
    wire NET_250;
    wire NET_251;
    wire NET_252;
    wire NET_253;
    wire NET_254;
    wire NET_255;
    wire NET_256;
    wire NET_259;
    wire NET_260;
    wire NET_261;
    wire NET_262;
    wire NET_263;
    wire NET_264;
    wire NET_265;
    wire NET_266;
    wire NET_267;
    wire NET_268;
    wire NET_269;
    wire NET_270;
    wire NET_271;
    wire NET_272;
    wire NET_273;
    wire NET_274;
    wire NET_275;
    wire NET_276;
    wire NET_277;
    wire NET_278;
    wire NET_279;
    wire NET_280;
    wire NET_281;
    wire NET_282;
    wire NET_283;
    wire NET_284;
    wire NET_285;
    wire NET_286;
    wire NET_287;
    wire NET_288;
    wire NET_289;
    wire NET_290;
    wire NET_291;
    wire NET_292;
    wire NET_293;
    wire NET_294;
    wire NET_295;
    wire NET_296;
    wire NET_297;
    wire NET_298;
    wire NET_299;
    wire NET_300;
    wire NET_301;
    wire NET_303;
    wire NET_306;
    wire NET_307;
    wire NET_308;
    wire NET_309;
    wire NET_310;
    wire NET_311;
    wire NET_312;
    wire NET_313;
    wire NET_314;
    wire NET_315;
    wire NET_316;
    wire NET_317;
    wire NET_318;
    wire NET_319;
    wire NET_320;
    wire NET_321;
    wire NET_322;
    wire NET_323;
    wire NET_324;
    wire NET_325;
    wire NET_326;
    wire NET_327;
    wire NET_328;
    wire NET_329;
    wire NET_330;
    wire NET_331;
    wire NET_332;
    wire NET_335;
    wire NET_336;
    wire NET_337;
    input wire OVF_n;
    input wire PHS2_n;
    input wire PHS3_n;
    input wire PHS4;
    input wire PHS4_n;
    output wire PRINC;
    input wire QC0_n;
    input wire QC1_n;
    input wire QC2_n;
    input wire QC3_n;
    output wire R15;
    inout wire R1C_n;
    output wire RAND0;
    inout wire RA_n;
    inout wire RB1_n;
    output wire RB2;
    inout wire RB_n;
    inout wire RC_n;
    output wire READ0;
    output wire ROR0;
    output wire RRPA;
    output wire RSC_n;
    input wire RSM3;
    input wire RSM3_n;
    input wire RSTSTG;
    output wire RUPT0;
    output wire RUPT1;
    output wire RXOR0;
    output wire RXOR0_n;
    input wire SQ0_n;
    input wire SQ1_n;
    input wire SQ2_n;
    input wire SQEXT_n;
    input wire SQR10;
    input wire SQR10_n;
    input wire SQR12_n;
    output wire ST0_n;
    input wire ST1;
    output wire ST1_n;
    input wire ST2;
    output wire ST3_n;
    output wire ST4_n;
    output wire STD2;
    input wire STORE1_n;
    input wire STRTFC;
    input wire SUMA16_n;
    input wire SUMB16_n;
    input wire T01;
    input wire T01_n;
    input wire T02_n;
    input wire T03;
    input wire T03_n;
    input wire T04_n;
    input wire T05_n;
    input wire T06_n;
    input wire T07_n;
    input wire T08_n;
    input wire T09_n;
    input wire T10_n;
    input wire T11_n;
    output wire T12USE_n;
    input wire T12_n;
    output wire TL15;
    inout wire TMZ_n;
    input wire TOV_n;
    input wire TPZG_n;
    input wire TRSM;
    input wire TS0_n;
    inout wire TSGN_n;
    input wire TSGU_n;
    input wire UNF_n;
    input wire VCC;
    output wire WAND0;
    output wire WCH_n;
    inout wire WG_n;
    input wire WL01_n;
    input wire WL02_n;
    input wire WL03_n;
    input wire WL04_n;
    input wire WL05_n;
    input wire WL06_n;
    input wire WL07_n;
    input wire WL08_n;
    input wire WL09_n;
    input wire WL10_n;
    input wire WL11_n;
    input wire WL12_n;
    input wire WL13_n;
    input wire WL14_n;
    input wire WL15_n;
    input wire WL16_n;
    inout wire WL_n;
    output wire WOR0;
    inout wire WY_n;
    input wire XB7_n;
    input wire XT1_n;
    wire __A04_1__DV0;
    wire __A04_1__DV0_n;
    wire __A04_1__DV376;
    wire __A04_1__DV3764;
    wire __A04_1__MBR1;
    wire __A04_1__MBR2;
    wire __A04_1__MST1;
    wire __A04_1__MST2;
    wire __A04_1__MST3;
    wire __A04_1__SGUM;
    wire __A04_1__ST1376_n;
    wire __A04_1__ST376;
    wire __A04_1__ST376_n;
    wire __A04_1__STG1;
    wire __A04_1__STG2;
    wire __A04_1__STG3;
    wire __A04_1__TSGN2;
    wire __A04_2__8XP5;
    wire __A04_2__BR12B;
    wire __A04_2__BR1B2;
    wire __A04_2__BRXP3;
    wire __A04_2__L16_n;
    wire __A04_2__MRSC;
    wire __A04_2__READ0_n;
    wire __A04_2__RUPT0_n;
    wire __A04_2__RUPT1_n;
    wire __A04_2__WOR0_n;
    wire __A04_2__WRITE0;
    wire __A04_2__WRITE0_n;
    output wire n1XP10;
    output wire n2XP3;
    output wire n2XP5;
    output wire n3XP2;
    output wire n3XP7;
    output wire n4XP11;
    output wire n4XP5;
    inout wire n5XP11;
    output wire n5XP28;
    output wire n5XP4;
    output wire n6XP5;
    input wire n7XP14;
    output wire n7XP19;
    inout wire n8PP4;
    output wire n8XP6;
    output wire n9XP1;

    pullup R3004(NET_216);
    pullup R3005(NET_215);
    pullup R4001(NET_250);
    pullup R4002(NET_238);
    pullup R4003(__A04_1__SGUM);
    pullup R4006(NET_221);
    pullup R4007(NET_212);
    pullup R4008(n5XP11);
    pullup R4011(NET_280);
    pullup R4021(n8PP4);
    U74HC02 #(0, 0, 0, 1) U4001(T12USE_n, DVST, NET_243, DIVSTG, T12USE_n, T03, GND, NET_244, NET_242, NET_268, GOJAM, MTCSAI, NET_249, VCC, SIM_RST);
    U74HC27 #(0, 1, 0) U4002(T03, T12USE_n, T12USE_n, RSTSTG, GOJAM, NET_243, GND, NET_242, PHS3_n, NET_243, T12_n, NET_244, PHS3_n, VCC, SIM_RST);
    U74LVC07 U4003(NET_249, NET_250, NET_248, NET_250, NET_229, NET_238, GND, NET_238, NET_232, __A04_1__SGUM, NET_198, __A04_1__SGUM, NET_197, VCC, SIM_RST);
    U74HC27 #(1, 1, 0) U4004(ST1, NET_245, __A04_1__STG1, __A04_1__STG3, __A04_1__STG2, NET_231, GND, NET_254, __A04_1__STG2, __A04_1__STG3, NET_236, NET_248, NET_247, VCC, SIM_RST);
    U74HC02 U4005(NET_247, NET_250, T01, NET_245, NET_234, NET_269, GND, NET_268, NET_250, NET_241, NET_247, NET_268, NET_246, VCC, SIM_RST);
    U74HC02 #(1, 0, 1, 0) U4006(NET_236, NET_241, __A04_1__STG1, __A04_1__STG1, NET_236, NET_246, GND, ST2, NET_230, NET_229, NET_234, NET_236, NET_235, VCC, SIM_RST);
    U74HC04 U4007(NET_236, __A04_1__MST1, NET_259, __A04_1__MST2, NET_269, __A04_1__MST3, GND, __A04_1__MBR1, NET_216, __A04_1__MBR2, NET_212, NET_234, DVST, VCC, SIM_RST);
    U74HC04 #(0, 1, 1, 1, 0, 0) U4008(NET_231, ST0_n, NET_254, ST1_n, NET_264, ST3_n, GND, ST4_n, NET_252, __A04_1__ST376_n, __A04_1__ST376, DV1376_n, DV1376, VCC, SIM_RST);
    U74HC27 #(1, 0, 0) U4009(NET_235, MTCSAI, NET_238, GOJAM, T01, NET_233, GND, NET_264, __A04_1__STG3, NET_259, NET_236, NET_232, NET_233, VCC, SIM_RST);
    U74HC4002 U4010(NET_230, NET_211, XT1_n, XB7_n, NDR100_n, NET_240, GND, NET_239, NET_256, STRTFC, T01, RSTSTG, NET_261, VCC, SIM_RST);
    U74HC02 #(0, 0, 1, 0) U4011(NET_262, NET_268, NET_238, NET_237, NET_233, NET_268, GND, NET_262, __A04_1__STG2, NET_259, NET_259, NET_237, __A04_1__STG2, VCC, SIM_RST);
    U74HC02 #(0, 1, 0, 0) U4012(NET_260, NET_234, NET_259, NET_256, NET_260, NET_261, GND, NET_268, NET_256, NET_265, NET_261, NET_268, NET_266, VCC, SIM_RST);
    U74HC02 #(1, 0, 0, 0) U4013(NET_269, NET_265, __A04_1__STG3, __A04_1__STG3, NET_269, NET_266, GND, __A04_1__STG1, __A04_1__STG3, NET_251, NET_259, NET_251, __A04_1__ST376, VCC, SIM_RST);
    U74HC4002 U4014(STD2, INKL, __A04_1__STG1, __A04_1__STG3, NET_259, NET_267, GND, NET_263, SQ0_n, EXST1_n, QC3_n, SQR10_n, RUPT1, VCC, SIM_RST);
    U74HC27 U4015(NET_269, __A04_1__STG1, QC0_n, SQEXT_n, SQ1_n, NET_253, GND, NET_198, SUMB16_n, SUMA16_n, TSGU_n, NET_252, __A04_1__STG2, VCC, SIM_RST);
    U74HC02 U4016(NET_255, NET_252, __A04_1__ST376, __A04_1__DV3764, DIV_n, NET_255, GND, NET_254, __A04_1__ST376, __A04_1__ST1376_n, DIV_n, __A04_1__ST1376_n, DV1376, VCC, SIM_RST);
    U74HC04 U4017(NET_253, DIV_n, __A04_1__DV0, __A04_1__DV0_n, DV1, DV1_n, GND, DV376_n, __A04_1__DV376, NET_189, TL15, BR1, NET_216, VCC, SIM_RST);
    U74HC02 U4018(__A04_1__DV0, DIV_n, ST0_n, DV1, DIV_n, ST1_n, GND, DIV_n, ST4_n, DV4, DIV_n, __A04_1__ST376_n, __A04_1__DV376, VCC, SIM_RST);
    U74HC02 U4019(NET_183, SUMA16_n, SUMB16_n, NET_197, PHS4, PHS3_n, GND, UNF_n, TOV_n, NET_186, L15_n, NET_189, NET_191, VCC, SIM_RST);
    U74HC27 #(0, 0, 1) U4020(PHS4_n, WL16_n, NET_191, NET_188, NET_215, NET_194, GND, NET_195, NET_216, NET_193, NET_192, NET_188, TSGN_n, VCC, SIM_RST);
    U74HC02 U4021(NET_193, TSGN_n, PHS3_n, NET_192, NET_189, PHS3_n, GND, TOV_n, PHS2_n, NET_205, __A04_1__SGUM, NET_186, NET_187, VCC, SIM_RST);
    U74HC4002 U4022(NET_196, NET_183, PHS3_n, TSGU_n, PHS4, NET_184, GND, NET_185, WL16_n, WL15_n, WL14_n, WL13_n, NET_217, VCC, SIM_RST);
    U74LVC07 U4023(NET_187, NET_216, NET_194, NET_216, NET_195, NET_215, GND, NET_215, NET_190, NET_221, NET_217, NET_221, NET_220, VCC, SIM_RST);
    U74HC02 #(1, 0, 0, 0) U4024(NET_190, NET_205, NET_196, NET_200, TOV_n, OVF_n, GND, NET_210, PHS3_n, NET_207, TMZ_n, PHS4_n, NET_222, VCC, SIM_RST);
    U74HC04 U4025(NET_215, BR1_n, __A04_1__TSGN2, NET_210, NET_212, BR2, GND, BR2_n, NET_204, DV4_n, DV4, NET_332, NET_331, VCC, SIM_RST);
    U74HC27 U4026(GEQZRO_n, PHS4_n, WL16_n, PHS4_n, NET_210, NET_202, GND, NET_203, NET_202, NET_221, NET_204, NET_201, TPZG_n, VCC, SIM_RST);
    U74HC4002 U4027(NET_220, WL12_n, WL11_n, WL10_n, WL09_n, NET_226, GND, NET_223, WL08_n, WL07_n, WL06_n, WL05_n, NET_219, VCC, SIM_RST);
    U74HC4002 #(0, 1) U4028(NET_218, WL04_n, WL03_n, WL02_n, WL01_n, NET_228, GND, NET_227, NET_212, NET_207, NET_206, NET_205, NET_204, VCC, SIM_RST);
    wire U4029_12_NC;
    wire U4029_13_NC;
    U74LVC07 U4029(NET_219, NET_221, NET_218, NET_221, NET_222, NET_221, GND, NET_212, NET_199, NET_212, NET_203, U4029_12_NC, U4029_13_NC, VCC, SIM_RST);
    U74HC02 U4030(NET_206, TMZ_n, PHS3_n, NET_199, NET_201, NET_200, GND, SQ0_n, EXST0_n, NET_331, QC3_n, SQEXT_n, NET_277, VCC, SIM_RST);
    U74HC27 U4031(NET_332, SQR10, QC0_n, NET_332, SQR10_n, __A04_2__WRITE0, GND, RAND0, SQR10, NET_332, QC1_n, READ0, QC0_n, VCC, SIM_RST);
    U74HC04 U4032(READ0, __A04_2__READ0_n, __A04_2__WRITE0, __A04_2__WRITE0_n, WOR0, __A04_2__WOR0_n, GND, RXOR0_n, RXOR0, __A04_2__RUPT0_n, RUPT0, __A04_2__RUPT1_n, RUPT1, VCC, SIM_RST);
    U74HC27 U4033(QC1_n, SQR10_n, SQR10, NET_332, QC2_n, ROR0, GND, WOR0, QC2_n, NET_332, SQR10_n, WAND0, NET_332, VCC, SIM_RST);
    U74HC27 U4034(SQR10, NET_332, QC3_n, NET_332, SQR10_n, RUPT0, GND, NET_275, ST0_n, SQR12_n, SQ2_n, RXOR0, QC3_n, VCC, SIM_RST);
    U74HC04 U4035(NET_275, NET_276, INOUT, INOUT_n, NET_280, NET_317, GND, BR1B2_n, __A04_2__BR1B2, BR12B_n, __A04_2__BR12B, BR1B2B_n, BR1B2B, VCC, SIM_RST);
    U74HC02 U4036(PRINC, NET_277, NET_276, RRPA, T03_n, __A04_2__RUPT1_n, GND, T03_n, RXOR0_n, n3XP7, NET_270, T03_n, NET_273, VCC, SIM_RST);
    U74HC27 U4037(EXST0_n, SQ0_n, INOUT, DV4, PRINC, NET_311, GND, NET_327, NET_273, NET_271, NET_278, INOUT, __A04_2__RUPT0_n, VCC, SIM_RST);
    U74HC02 U4038(NET_270, ROR0, WOR0, NET_272, T03_n, NET_274, GND, RAND0, WAND0, NET_274, DV4_n, T05_n, n5XP28, VCC, SIM_RST);
    U74LVC07 U4039(NET_327, RB_n, NET_326, RC_n, NET_329, n5XP11, GND, n5XP11, NET_328, RA_n, NET_330, WG_n, NET_300, VCC, SIM_RST);
    U74HC27 U4040(NET_272, NET_282, T05_n, INOUT_n, READ0, NET_329, GND, WCH_n, NET_283, n7XP14, NET_284, NET_326, NET_279, VCC, SIM_RST);
    U74HC02 U4041(NET_328, __A04_2__WRITE0, RXOR0, NET_271, __A04_2__READ0_n, T05_n, GND, __A04_2__WRITE0_n, T05_n, NET_283, T05_n, __A04_2__WOR0_n, NET_284, VCC, SIM_RST);
    U74HC02 U4042(NET_282, T05_n, RXOR0_n, NET_285, T02_n, __A04_2__WRITE0_n, GND, T02_n, INOUT_n, n2XP3, T09_n, __A04_2__RUPT0_n, n9XP1, VCC, SIM_RST);
    U74HC27 U4043(NET_283, NET_282, RUPT1, IC13, IC12, NET_286, GND, NET_300, n9XP1, NET_279, NET_278, NET_330, n2XP3, VCC, SIM_RST);
    U74HC02 U4044(NET_279, T09_n, RXOR0_n, NET_278, T09_n, NET_286, GND, NET_282, NET_285, NET_337, T01_n, __A04_2__RUPT1_n, RB2, VCC, SIM_RST);
    U74LVC07 U4045(NET_337, WG_n, NET_335, NET_280, NET_336, NET_280, GND, RA_n, NET_314, WG_n, NET_301, TMZ_n, NET_323, VCC, SIM_RST);
    U74HC27 U4046(RUPT0, RUPT1, INOUT, MP1, MP3A, NET_335, GND, NET_336, __A04_1__DV0, IC15, DV1376, NET_281, RSM3, VCC, SIM_RST);
    U74HC02 U4047(R15, NET_281, T01_n, n1XP10, T01_n, __A04_1__DV0_n, GND, MP0_n, T03_n, NET_288, INOUT_n, T03_n, NET_319, VCC, SIM_RST);
    U74HC27 U4048(T02_n, __A04_1__DV0_n, BRDIF_n, TS0_n, T04_n, NET_299, GND, NET_294, T04_n, BR1, MP0_n, n2XP5, BR1, VCC, SIM_RST);
    U74HC02 U4049(n3XP2, T03_n, TS0_n, __A04_2__BR1B2, BR1, BR2_n, GND, BR1_n, BR2, __A04_2__BR12B, __A04_2__BR1B2, __A04_2__BR12B, BRDIF_n, VCC, SIM_RST);
    U74HC02 U4050(BR1B2B, BR2, BR1, n4XP5, TS0_n, T04_n, GND, T04_n, INOUT_n, n4XP11, T04_n, MP3_n, NET_324, VCC, SIM_RST);
    U74HC27 U4051(MP0_n, BR1_n, DV1_n, T04_n, BR2_n, NET_289, GND, NET_293, TS0_n, T05_n, BR1B2_n, NET_321, T04_n, VCC, SIM_RST);
    U74HC27 U4052(T05_n, TS0_n, T07_n, BR1_n, MP3_n, n7XP19, GND, n8XP6, T08_n, DV1_n, BR2, NET_309, BR12B_n, VCC, SIM_RST);
    U74HC02 U4053(B15X, T05_n, DV1_n, n5XP4, T05_n, RSM3_n, GND, T06_n, DV1_n, n6XP5, T06_n, MP3_n, TL15, VCC, SIM_RST);
    U74HC02 U4054(__A04_1__TSGN2, T07_n, MP0_n, NET_308, T07_n, DV1_n, GND, T08_n, DV1_n, __A04_2__8XP5, T09_n, MP3_n, NET_313, VCC, SIM_RST);
    U74HC27 U4055(T09_n, BR1, T09_n, MP0_n, BR1_n, NET_296, GND, NET_298, MP0_n, T09_n, BRDIF_n, NET_318, MP0_n, VCC, SIM_RST);
    U74HC02 U4056(KRPT, T09_n, __A04_2__RUPT1_n, MP0T10, T10_n, MP0_n, GND, NET_317, T02_n, NET_315, STORE1_n, T09_n, NET_303, VCC, SIM_RST);
    wire U4057_8_NC;
    wire U4057_9_NC;
    wire U4057_10_NC;
    wire U4057_11_NC;
    U74HC27 U4057(MP3_n, MP0_n, n1XP10, __A04_2__8XP5, NET_313, NET_314, GND, U4057_8_NC, U4057_9_NC, U4057_10_NC, U4057_11_NC, NET_316, T11_n, VCC, SIM_RST);
    wire U4058_8_NC;
    wire U4058_9_NC;
    wire U4058_10_NC;
    wire U4058_11_NC;
    wire U4058_12_NC;
    wire U4058_13_NC;
    U74HC04 U4058(RSC_n, __A04_2__MRSC, NET_316, NET_312, TRSM, NET_211, GND, U4058_8_NC, U4058_9_NC, U4058_10_NC, U4058_11_NC, U4058_12_NC, U4058_13_NC, VCC, SIM_RST);
    wire U4059_1_NC;
    wire U4059_2_NC;
    wire U4059_12_NC;
    wire U4059_13_NC;
    U74HC27 #(0, 1, 1) U4059(U4059_1_NC, U4059_2_NC, NET_319, B15X, n7XP19, NET_325, GND, NET_320, __A04_2__8XP5, NET_318, NET_296, U4059_12_NC, U4059_13_NC, VCC, SIM_RST);
    U74HC02 U4060(NET_323, n2XP5, n1XP10, NET_291, NET_299, NET_298, GND, n1XP10, MP0T10, NET_290, NET_293, NET_316, NET_292, VCC, SIM_RST);
    U74LVC07 U4061(NET_325, WY_n, NET_320, WY_n, NET_322, WL_n, GND, RC_n, NET_297, RB_n, NET_295, CI_n, NET_291, VCC, SIM_RST);
    U74HC27 #(1, 0, 0) U4062(NET_294, NET_321, NET_321, n2XP5, NET_296, NET_297, GND, NET_295, NET_294, n7XP19, NET_318, NET_322, n6XP5, VCC, SIM_RST);
    U74LVC07 U4063(NET_290, TSGN_n, NET_287, TSGN_n, NET_292, RB1_n, GND, __A04_2__L16_n, NET_312, R1C_n, NET_310, n8PP4, NET_311, VCC, SIM_RST);
    wire U4064_3_NC;
    wire U4064_4_NC;
    wire U4064_5_NC;
    wire U4064_6_NC;
    wire U4064_8_NC;
    wire U4064_9_NC;
    wire U4064_10_NC;
    wire U4064_11_NC;
    U74HC27 U4064(NET_289, NET_288, U4064_3_NC, U4064_4_NC, U4064_5_NC, U4064_6_NC, GND, U4064_8_NC, U4064_9_NC, U4064_10_NC, U4064_11_NC, NET_287, NET_308, VCC, SIM_RST);
    wire U4065_8_NC;
    wire U4065_9_NC;
    wire U4065_10_NC;
    wire U4065_11_NC;
    wire U4065_12_NC;
    wire U4065_13_NC;
    U74HC02 U4065(NET_310, NET_316, NET_309, __A04_2__BRXP3, T03_n, IC15_n, GND, U4065_8_NC, U4065_9_NC, U4065_10_NC, U4065_11_NC, U4065_12_NC, U4065_13_NC, VCC, SIM_RST);
    U74HC4002 U4066(RSC_n, NET_315, NET_324, NET_308, __A04_2__BRXP3, NET_307, GND, NET_306, NET_315, NET_303, NET_324, __A04_2__BRXP3, NET_301, VCC, SIM_RST);
endmodule