`timescale 1ns/1ps
`default_nettype none

module crosspoint_nqi(VCC, GND, SIM_RST, SIM_CLK, GOJAM, T01, T01_n, T02_n, T03_n, T04_n, T05_n, T06_n, T07_n, T08_n, T09_n, T10_n, T11_n, T12, T12_n, T12USE_n, STD2, BR1, BR1_n, BR2, BR2_n, BR12B_n, BR1B2_n, BRDIF_n, S11, S12, INCSET_n, INKL_n, MONPCH, MONWBK, ADS0, CCS0, CCS0_n, CHINC_n, DAS0, DAS0_n, DAS1, DAS1_n, DV1, DV1_n, DV4, DV4_n, DIV_n, DXCH0, FETCH0, FETCH0_n, GOJ1, GOJ1_n, INOUT, INOUT_n, MASK0, MASK0_n, MP0, MP3, MP3_n, MSU0, MSU0_n, NDX0_n, PRINC, QXCH0_n, RAND0, READ0, ROR0, RSM3, RSM3_n, RUPT0, RXOR0, RXOR0_n, SHANC_n, SHIFT, SHIFT_n, STFET1_n, TC0, TC0_n, TCF0, TCSAJ3_n, TS0, TS0_n, WAND0, WOR0, IC1, IC2, IC2_n, IC3, IC4, IC5, IC5_n, IC8_n, IC9, IC10, IC10_n, IC11_n, IC12, IC12_n, IC13, IC14, IC15_n, IC16, IC16_n, C24A, C25A, C26A, C27A, C30A, C37P, C40P, C41P, C42P, C43P, C44P, XT0_n, XT2_n, XT3_n, XT4_n, XT5_n, XT6_n, YB0_n, YT0_n, n4XP5, n5XP11, A2X_n, CI_n, PINC, DVST, MONEX_n, NDR100_n, NISQ, PTWOX, R6, RA_n, RAD, RB_n, RC_n, RG_n, RL_n, RL10BB, RQ_n, RSTRT, RSTSTG, RU_n, RZ_n, SCAD, SCAD_n, ST2_n, TMZ_n, TOV_n, TPZG_n, TSGN_n, TSUDO_n, U2BBK, WA_n, WB_n, WG_n, WL_n, WS_n, WY_n, WY12_n, WYD_n, WZ_n, Z15_n, Z16_n, DV4B1B, TRSM, OCTAD2, n2XP7, n2XP8, n3XP6, n5XP12, n5XP15, n5XP21, n6XP8, n7XP4, n7XP9, n9XP5, n10XP1, n10XP8, n11XP2);
    input wire VCC;
    input wire GND;
    input wire SIM_RST;
    input wire SIM_CLK;
    output wire A2X_n; //FPGA#wand
    input wire ADS0;
    input wire BR1;
    input wire BR12B_n;
    input wire BR1B2_n;
    input wire BR1_n;
    input wire BR2;
    input wire BR2_n;
    input wire BRDIF_n;
    input wire C24A;
    input wire C25A;
    input wire C26A;
    input wire C27A;
    input wire C30A;
    input wire C37P;
    input wire C40P;
    input wire C41P;
    input wire C42P;
    input wire C43P;
    input wire C44P;
    input wire CCS0;
    input wire CCS0_n;
    input wire CHINC_n;
    output wire CI_n; //FPGA#wand
    input wire DAS0;
    input wire DAS0_n;
    input wire DAS1;
    input wire DAS1_n;
    input wire DIV_n;
    input wire DV1;
    input wire DV1_n;
    input wire DV4;
    output wire DV4B1B;
    input wire DV4_n;
    output wire DVST;
    input wire DXCH0;
    input wire FETCH0;
    input wire FETCH0_n;
    input wire GOJ1;
    input wire GOJ1_n;
    input wire GOJAM;
    input wire IC1;
    input wire IC10;
    input wire IC10_n;
    input wire IC11_n;
    input wire IC12;
    input wire IC12_n;
    input wire IC13;
    input wire IC14;
    input wire IC15_n;
    input wire IC16;
    input wire IC16_n;
    input wire IC2;
    input wire IC2_n;
    input wire IC3;
    input wire IC4;
    input wire IC5;
    input wire IC5_n;
    input wire IC8_n;
    input wire IC9;
    input wire INCSET_n;
    input wire INKL_n;
    input wire INOUT;
    input wire INOUT_n;
    input wire MASK0;
    input wire MASK0_n;
    output wire MONEX_n; //FPGA#wand
    input wire MONPCH;
    input wire MONWBK;
    input wire MP0;
    input wire MP3;
    input wire MP3_n;
    input wire MSU0;
    input wire MSU0_n;
    output wire NDR100_n;
    input wire NDX0_n;
    output wire NISQ;
    output wire OCTAD2;
    output wire PINC;
    input wire PRINC;
    output wire PTWOX;
    input wire QXCH0_n;
    output wire R6;
    output wire RAD;
    input wire RAND0;
    output wire RA_n; //FPGA#wand
    output wire RB_n; //FPGA#wand
    output wire RC_n; //FPGA#wand
    input wire READ0;
    output wire RG_n; //FPGA#wand
    output wire RL10BB;
    output wire RL_n; //FPGA#wand
    input wire ROR0;
    output wire RQ_n;
    input wire RSM3;
    input wire RSM3_n;
    output wire RSTRT;
    output wire RSTSTG;
    input wire RUPT0;
    output wire RU_n; //FPGA#wand
    input wire RXOR0;
    input wire RXOR0_n;
    output wire RZ_n; //FPGA#wand
    input wire S11;
    input wire S12;
    inout wire SCAD; //FPGA#wand
    output wire SCAD_n;
    input wire SHANC_n;
    input wire SHIFT;
    input wire SHIFT_n;
    output wire ST2_n; //FPGA#wand
    input wire STD2;
    input wire STFET1_n;
    input wire T01;
    input wire T01_n;
    input wire T02_n;
    input wire T03_n;
    input wire T04_n;
    input wire T05_n;
    input wire T06_n;
    input wire T07_n;
    input wire T08_n;
    input wire T09_n;
    input wire T10_n;
    input wire T11_n;
    input wire T12;
    input wire T12USE_n;
    input wire T12_n;
    input wire TC0;
    input wire TC0_n;
    input wire TCF0;
    input wire TCSAJ3_n;
    output wire TMZ_n; //FPGA#wand
    output wire TOV_n; //FPGA#wand
    output wire TPZG_n;
    output wire TRSM;
    input wire TS0;
    input wire TS0_n;
    output wire TSGN_n; //FPGA#wand
    output wire TSUDO_n;
    output wire U2BBK;
    input wire WAND0;
    output wire WA_n; //FPGA#wand
    output wire WB_n; //FPGA#wand
    output wire WG_n; //FPGA#wand
    output wire WL_n; //FPGA#wand
    input wire WOR0;
    output wire WS_n; //FPGA#wand
    output wire WY12_n; //FPGA#wand
    output wire WYD_n; //FPGA#wand
    output wire WY_n; //FPGA#wand
    output wire WZ_n; //FPGA#wand
    input wire XT0_n;
    input wire XT2_n;
    input wire XT3_n;
    input wire XT4_n;
    input wire XT5_n;
    input wire XT6_n;
    input wire YB0_n;
    input wire YT0_n;
    output wire Z15_n; //FPGA#wand
    output wire Z16_n; //FPGA#wand
    wire __A05_1__10XP6;
    wire __A05_1__10XP7;
    wire __A05_1__3XP5;
    wire __A05_1__8XP12;
    wire __A05_1__8XP15;
    wire __A05_1__8XP3;
    wire __A05_1__DV1B1B;
    wire __A05_1__GHNHC;
    wire __A05_1__MNISQ;
    wire __A05_1__NISQ_n;
    wire __A05_1__PARTC;
    wire __A05_1__PINC_n;
    wire __A05_2__10XP10;
    wire __A05_2__11XP6;
    wire __A05_2__5XP13;
    wire __A05_2__5XP19;
    wire __A05_2__5XP9;
    wire __A05_2__6XP2;
    wire __A05_2__6XP7;
    wire __A05_2__OCTAD3;
    wire __A05_2__OCTAD4;
    wire __A05_2__OCTAD5;
    wire __A05_2__OCTAD6;
    wire __A05_2__RSCT;
    wire __A05_NET_192;
    wire __A05_NET_194;
    wire __A05_NET_195;
    wire __A05_NET_196;
    wire __A05_NET_197;
    wire __A05_NET_198;
    wire __A05_NET_199;
    wire __A05_NET_200;
    wire __A05_NET_202;
    wire __A05_NET_203;
    wire __A05_NET_205;
    wire __A05_NET_206;
    wire __A05_NET_207;
    wire __A05_NET_208;
    wire __A05_NET_209;
    wire __A05_NET_210;
    wire __A05_NET_212;
    wire __A05_NET_213;
    wire __A05_NET_215;
    wire __A05_NET_216; //FPGA#wand
    wire __A05_NET_217;
    wire __A05_NET_218;
    wire __A05_NET_221;
    wire __A05_NET_222;
    wire __A05_NET_226;
    wire __A05_NET_227;
    wire __A05_NET_228;
    wire __A05_NET_229;
    wire __A05_NET_230;
    wire __A05_NET_231;
    wire __A05_NET_232;
    wire __A05_NET_233;
    wire __A05_NET_234;
    wire __A05_NET_235;
    wire __A05_NET_236;
    wire __A05_NET_237;
    wire __A05_NET_238;
    wire __A05_NET_239;
    wire __A05_NET_240;
    wire __A05_NET_241;
    wire __A05_NET_242;
    wire __A05_NET_243;
    wire __A05_NET_244;
    wire __A05_NET_245;
    wire __A05_NET_246;
    wire __A05_NET_247;
    wire __A05_NET_248;
    wire __A05_NET_249;
    wire __A05_NET_250;
    wire __A05_NET_251;
    wire __A05_NET_252;
    wire __A05_NET_253;
    wire __A05_NET_254;
    wire __A05_NET_255;
    wire __A05_NET_256;
    wire __A05_NET_258;
    wire __A05_NET_259;
    wire __A05_NET_260;
    wire __A05_NET_261;
    wire __A05_NET_262;
    wire __A05_NET_263;
    wire __A05_NET_264;
    wire __A05_NET_265;
    wire __A05_NET_266;
    wire __A05_NET_269;
    wire __A05_NET_270;
    wire __A05_NET_271;
    wire __A05_NET_272;
    wire __A05_NET_273;
    wire __A05_NET_274;
    wire __A05_NET_275;
    wire __A05_NET_276;
    wire __A05_NET_277;
    wire __A05_NET_278;
    wire __A05_NET_279;
    wire __A05_NET_280;
    wire __A05_NET_281;
    wire __A05_NET_282;
    wire __A05_NET_283;
    wire __A05_NET_284;
    wire __A05_NET_285;
    wire __A05_NET_286;
    wire __A05_NET_287;
    wire __A05_NET_288;
    wire __A05_NET_289;
    wire __A05_NET_290;
    wire __A05_NET_291;
    wire __A05_NET_292;
    wire __A05_NET_294;
    wire __A05_NET_295;
    wire __A05_NET_296;
    wire __A05_NET_297;
    wire __A05_NET_298;
    wire __A05_NET_299;
    wire __A05_NET_300;
    wire __A05_NET_302;
    wire __A05_NET_303;
    wire __A05_NET_304;
    wire __A05_NET_305;
    wire __A05_NET_306;
    wire __A05_NET_308;
    wire __A05_NET_309;
    wire __A05_NET_310;
    wire __A05_NET_311; //FPGA#wand
    wire __A05_NET_312;
    wire __A05_NET_313; //FPGA#wand
    wire __A05_NET_314;
    wire __A05_NET_315;
    wire __A05_NET_316;
    wire __A05_NET_317;
    wire __A05_NET_318;
    wire __A05_NET_320;
    wire __A05_NET_321;
    wire __A05_NET_322;
    wire __A05_NET_323;
    wire __A05_NET_324;
    wire __A05_NET_326;
    wire __A05_NET_328;
    wire __A05_NET_329;
    wire __A05_NET_330; //FPGA#wand
    wire __A05_NET_331;
    wire __A05_NET_332; //FPGA#wand
    wire __A05_NET_333;
    wire __A05_NET_334;
    wire __A05_NET_335;
    wire __A05_NET_336;
    wire __A05_NET_338;
    wire __A05_NET_340;
    wire __A05_NET_342;
    wire __A05_NET_343;
    wire __A05_NET_344;
    wire __A05_NET_345;
    wire __A05_NET_346;
    wire __A05_NET_347;
    wire __A05_NET_348;
    wire __A05_NET_349;
    wire __A05_NET_350;
    wire __A05_NET_351;
    wire __A05_NET_354;
    wire __A05_NET_355;
    wire __A05_NET_356;
    wire __A05_NET_357;
    wire __A05_NET_358;
    wire __A05_NET_359;
    wire __A05_NET_360;
    wire __A05_NET_361;
    wire __A05_NET_363;
    wire __A05_NET_365;
    wire __A05_NET_366;
    wire __A05_NET_367;
    wire __A05_NET_368;
    wire __A05_NET_369;
    wire __A05_NET_370;
    wire __A05_NET_371;
    wire __A05_NET_372;
    wire __A05_NET_373;
    wire __A05_NET_374;
    output wire n10XP1;
    output wire n10XP8;
    output wire n11XP2;
    output wire n2XP7;
    output wire n2XP8;
    output wire n3XP6;
    input wire n4XP5;
    input wire n5XP11;
    output wire n5XP12;
    output wire n5XP15;
    output wire n5XP21;
    output wire n6XP8;
    output wire n7XP4;
    output wire n7XP9;
    output wire n9XP5;

    pullup R5001(__A05_NET_216);
    pullup R5002(__A05_NET_311);
    pullup R5003(__A05_NET_313);
    pullup R5004(RL_n);
    pullup R5005(RA_n);
    pullup R5006(WY_n);
    pullup R5007(WY12_n);
    pullup R5008(SCAD);
    pullup R5009(__A05_NET_330);
    pullup R5010(__A05_NET_332);
    pullup R5011(TMZ_n);
    pullup R5012(TSGN_n);
    U74HC27 U5001(IC10, IC3, TC0, TCF0, IC4, __A05_NET_249, GND, __A05_NET_248, IC2, IC3, RSM3, __A05_NET_251, IC2, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5002(__A05_NET_250, STD2, IC2, __A05_NET_270, T01_n, __A05_NET_251, GND, T01_n, __A05_NET_250, __A05_NET_253, IC10_n, T01_n, __A05_NET_247, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5003(__A05_NET_266, T01_n, __A05_NET_249, __A05_NET_252, T02_n, __A05_NET_248, GND, T08_n, CCS0_n, __A05_NET_206, T02_n, MP3_n, n2XP7, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b1, 1'b0) U5004(T02_n, STD2, __A05_1__10XP6, __A05_1__10XP7, __A05_NET_247, __A05_NET_256, GND, __A05_NET_259, __A05_NET_253, n3XP6, __A05_NET_243, DVST, DIV_n, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5005(__A05_NET_256, MONEX_n, __A05_NET_259, RZ_n, __A05_NET_260, RB_n, GND, RA_n, __A05_NET_258, WA_n, __A05_NET_246, RL_n, __A05_NET_240, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC27 U5006(__A05_NET_252, __A05_1__8XP15, __A05_NET_242, __A05_NET_241, __A05_1__8XP12, __A05_NET_240, GND, __A05_1__PARTC, INKL_n, SHIFT, MONPCH, __A05_1__NISQ_n, n2XP7, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5007(__A05_1__3XP5, T03_n, IC2_n, __A05_NET_274, T01_n, IC15_n, GND, __A05_NET_274, __A05_NET_276, __A05_NET_258, T03_n, TC0_n, n3XP6, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5008(__A05_NET_276, T04_n, IC2_n, __A05_NET_244, T02_n, IC15_n, GND, __A05_NET_244, __A05_NET_275, TPZG_n, T04_n, DAS0_n, __A05_NET_242, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b1, 1'b0, 1'b0, 1'b0) U5009(__A05_NET_246, __A05_NET_242, __A05_NET_245, __A05_NET_245, T04_n, MASK0_n, GND, MP3_n, T10_n, __A05_NET_241, T05_n, IC2_n, __A05_NET_243, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5010(__A05_NET_275, T05_n, __A05_NET_255, __A05_NET_254, __A05_NET_274, __A05_NET_275, GND, T05_n, DAS0_n, n5XP12, T06_n, RSM3_n, __A05_NET_279, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5011(__A05_1__PARTC, PRINC, __A05_NET_275, __A05_NET_274, n7XP9, __A05_NET_226, GND, __A05_NET_278, n9XP5, __A05_NET_274, __A05_NET_279, __A05_NET_255, CCS0, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5012(__A05_NET_254, TMZ_n, __A05_NET_278, WG_n, __A05_NET_281, RG_n, GND, RC_n, __A05_NET_277, A2X_n, __A05_NET_262, WY_n, __A05_NET_264, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U5013(__A05_NET_280, T06_n, DAS0_n, __A05_NET_263, T06_n, MSU0_n, GND, __A05_NET_245, __A05_NET_263, __A05_NET_277, T07_n, DAS0_n, __A05_NET_265, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b1, 1'b1) U5014(__A05_NET_275, __A05_NET_261, __A05_NET_261, __A05_NET_280, __A05_NET_263, __A05_NET_262, GND, __A05_NET_264, __A05_NET_261, __A05_NET_263, __A05_NET_280, __A05_NET_281, __A05_NET_280, VCC, SIM_RST, SIM_CLK);
    U74HC4002 U5015(__A05_NET_260, __A05_NET_266, __A05_1__3XP5, __A05_NET_265, __A05_NET_279,  , GND,  , IC3, RSM3, MP3, IC16, TSUDO_n, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5016(n7XP9, T07_n, MSU0_n, __A05_NET_261, T07_n, IC2_n, GND, T07_n, CCS0_n, __A05_NET_271, __A05_NET_203, __A05_NET_195, __A05_NET_202, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b0, 1'b1) U5017(__A05_NET_263, __A05_NET_270, __A05_1__8XP3, __A05_NET_271, n4XP5, __A05_NET_273, GND, __A05_NET_269, n4XP5, __A05_NET_271, __A05_NET_270, __A05_NET_272, __A05_1__10XP6, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5018(__A05_NET_272, CI_n, __A05_NET_273, RZ_n, __A05_NET_269, WY12_n, GND, WZ_n, __A05_NET_205, RB_n, __A05_NET_202, WB_n, __A05_NET_213, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC27 #(1'b0, 1'b0, 1'b1) U5019(CCS0_n, T07_n, BR1_n, CCS0_n, T07_n, PTWOX, GND, __A05_NET_205, __A05_1__3XP5, __A05_NET_192, __A05_NET_206, n7XP4, BR2_n, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5020(INKL_n, FETCH0, __A05_NET_206, __A05_NET_208, n9XP5, __A05_NET_210, GND, __A05_NET_207, IC2, IC4, DXCH0, __A05_NET_203, T08_n, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b1, 1'b0, 1'b0) U5021(RAD, TSUDO_n, T08_n, __A05_NET_213, RAD, __A05_NET_197, GND, T08_n, __A05_NET_212, __A05_1__8XP15, T08_n, __A05_NET_209, __A05_1__8XP3, VCC, SIM_RST, SIM_CLK);
    U74HC04 U5022(IC16, __A05_NET_212, __A05_NET_289, RQ_n, MP3, __A05_NET_299, GND, SCAD_n, SCAD, NDR100_n, __A05_NET_292, __A05_NET_336, __A05_NET_329, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5023(__A05_NET_209, MP0, IC1, __A05_NET_208, T08_n, __A05_NET_207, GND, T08_n, __A05_NET_196, __A05_NET_197, T08_n, GOJ1_n, RSTRT, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5024(__A05_NET_210, RU_n, __A05_NET_200, RA_n, __A05_NET_198, ST2_n, GND, WY_n, __A05_NET_236, RC_n, __A05_NET_237, WA_n, __A05_NET_222, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC27 U5025(DXCH0, GOJ1, CCS0_n, BR2, T10_n, __A05_1__10XP6, GND, __A05_NET_199, IC1, IC10, RUPT0, __A05_NET_196, DAS0, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5026(__A05_1__8XP12, T08_n, DAS0_n, __A05_NET_192, T08_n, TCSAJ3_n, GND, T09_n, __A05_NET_194, __A05_NET_195, IC2, __A05_1__DV1B1B, __A05_NET_194, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5027(n9XP5, T09_n, DAS0_n, __A05_NET_233, T09_n, MASK0_n, GND, __A05_NET_233, __A05_NET_235, __A05_NET_200, T10_n, CCS0_n, __A05_NET_234, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5028(__A05_NET_198, __A05_NET_192, __A05_NET_234, n10XP1, __A05_NET_199, T10_n, GND, T10_n, __A05_NET_229, __A05_NET_235, DAS0, __A05_NET_230, __A05_NET_229, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b1, 1'b0, 1'b1) U5029(__A05_NET_234, __A05_NET_233, T10_n, DAS0_n, BR1B2_n, n10XP8, GND, __A05_NET_222, __A05_NET_195, __A05_NET_228, n5XP11, __A05_NET_236, __A05_NET_235, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5030(__A05_NET_230, MSU0_n, BR1_n, __A05_1__10XP7, T10_n, __A05_NET_231, GND, __A05_NET_230, __A05_NET_232, __A05_NET_231, BR12B_n, DAS0_n, __A05_NET_232, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5031(n11XP2, T11_n, MSU0_n, __A05_NET_239, T11_n, MASK0_n, GND, __A05_NET_233, __A05_NET_239, __A05_NET_237, T11_n, __A05_NET_238, __A05_NET_228, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5032(__A05_NET_238, MSU0, IC14, __A05_NET_218, INCSET_n, __A05_NET_216, GND, GOJAM, __A05_1__GHNHC, __A05_NET_227, __A05_NET_227, T01, __A05_1__GHNHC, VCC, SIM_RST, SIM_CLK);
    U74HC4002 U5033(__A05_NET_221, C24A, C25A, C26A, C27A,  , GND,  , C30A, C37P, C40P, C41P, __A05_NET_217, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b0, 1'b1) U5034(C42P, C43P, IC12, DAS0, DAS1, __A05_NET_355, GND, __A05_NET_351, RL10BB, __A05_NET_310, __A05_2__RSCT, __A05_NET_215, C44P, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5035(__A05_NET_221, __A05_NET_216, __A05_NET_217, __A05_NET_216, __A05_NET_215, __A05_NET_216, GND, __A05_NET_311, __A05_NET_355, __A05_NET_311, __A05_NET_354, WS_n, __A05_NET_351, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U5036(__A05_1__PINC_n, __A05_NET_218, PINC, PINC, __A05_1__PINC_n, T12, GND, T01_n, __A05_NET_311, RL10BB, T01_n, FETCH0_n, R6, VCC, SIM_RST, SIM_CLK);
    U74HC4002 U5037(__A05_NET_354, IC9, DXCH0, PRINC, INOUT,  , GND,  , YB0_n, YT0_n, S12, S11, __A05_NET_292, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5038(__A05_NET_310, T01_n, CHINC_n, __A05_NET_286, T03_n, __A05_NET_313, GND, IC5, MP0, __A05_NET_356, T03_n, IC8_n, __A05_NET_312, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b0, 1'b1) U5039(T01_n, MONPCH, TS0, DAS0, MASK0, __A05_NET_359, GND, __A05_NET_357, __A05_NET_286, __A05_NET_312, __A05_NET_289, __A05_2__RSCT, INKL_n, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b1, 1'b0, 1'b0) U5040(__A05_NET_287, __A05_NET_290,  ,  ,  ,  , GND,  ,  ,  ,  , __A05_NET_358, __A05_2__6XP2, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5041(__A05_NET_357, WB_n, __A05_NET_358, WB_n, __A05_NET_359, __A05_NET_313, GND, __A05_NET_313, __A05_NET_356, RL_n, __A05_NET_346, RA_n, __A05_NET_347, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U5042(n2XP8, T02_n, FETCH0_n, __A05_NET_289, T03_n, QXCH0_n, GND, T04_n, DV1_n, __A05_NET_288, T04_n, __A05_NET_291, __A05_NET_287, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5043(__A05_NET_312, __A05_NET_288, DV1, INOUT, IC2, __A05_NET_291, GND, __A05_NET_345, __A05_NET_290, __A05_NET_285, __A05_2__5XP9, __A05_NET_346, __A05_2__11XP6, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5044(__A05_NET_347, __A05_NET_286, __A05_2__6XP2, TRSM, T05_n, NDX0_n, GND, IC12_n, T05_n, __A05_NET_290, DAS1_n, T05_n, __A05_NET_285, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b0, 1'b1) U5045(__A05_2__5XP13, n5XP15, DAS1, PRINC, __A05_1__PARTC, __A05_NET_282, GND, __A05_NET_350, __A05_NET_283, n2XP8, __A05_2__10XP10, __A05_NET_344, __A05_NET_297, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5046(__A05_NET_345, RG_n, __A05_NET_344, RG_n, __A05_NET_350, WY_n, GND, A2X_n, __A05_NET_348, CI_n, __A05_NET_349, WY12_n, __A05_NET_372, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 #(1'b0, 1'b1, 1'b0, 1'b0) U5047(__A05_NET_283, __A05_NET_282, T05_n, __A05_NET_348, __A05_NET_285, __A05_2__10XP10, GND, SHIFT_n, T05_n, __A05_2__5XP9, SHANC_n, T05_n, __A05_NET_284, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5048(__A05_NET_284, __A05_NET_298, YT0_n, YB0_n, XT0_n, __A05_NET_373, GND, __A05_NET_296, RAND0, WAND0, __A05_NET_329, __A05_NET_349, __A05_NET_300, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5049(__A05_2__5XP13, IC8_n, T05_n, n5XP15, QXCH0_n, T05_n, GND, CHINC_n, T05_n, n5XP21, IC5_n, T05_n, __A05_NET_297, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b0, 1'b1, 1'b0) U5050(__A05_NET_298, IC16_n, T05_n, __A05_NET_300, __A05_NET_299, T05_n, GND, __A05_NET_298, __A05_NET_300, __A05_NET_372, S11, S12, __A05_NET_374, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5051(__A05_NET_371, RB_n, __A05_NET_370, RZ_n, __A05_NET_374, SCAD, GND, SCAD, __A05_NET_373, RC_n, __A05_NET_363, __A05_NET_330, __A05_NET_361, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U5052(__A05_NET_371, __A05_2__5XP19, __A05_NET_298, __A05_NET_370, __A05_2__6XP7, __A05_NET_300, GND, XT2_n, NDR100_n, OCTAD2, NDR100_n, XT3_n, __A05_2__OCTAD3, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5053(__A05_2__OCTAD4, NDR100_n, XT4_n, __A05_2__OCTAD5, NDR100_n, XT5_n, GND, NDR100_n, XT6_n, __A05_2__OCTAD6, BR1_n, DV1_n, __A05_NET_329, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5054(__A05_NET_295, __A05_NET_296, T05_n, __A05_2__5XP19, T05_n, __A05_NET_294, GND, DV1_n, BR1, __A05_1__DV1B1B, TS0_n, BRDIF_n, __A05_NET_331, VCC, SIM_RST, SIM_CLK);
    U74HC4002 #(1'b0, 1'b1) U5055(__A05_NET_363, __A05_NET_295, __A05_NET_333, __A05_NET_324, __A05_NET_323,  , GND,  , __A05_2__5XP13, __A05_NET_308, __A05_NET_340, __A05_NET_317, __A05_NET_338, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5056(ROR0, __A05_1__DV1B1B, IC2, IC5, READ0, __A05_NET_361, GND, __A05_NET_365, IC2, IC3, TS0, __A05_NET_294, WOR0, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b0, 1'b0, 1'b1) U5057(__A05_NET_360, __A05_NET_331, DV4, __A05_NET_334, __A05_NET_330, T05_n, GND, __A05_NET_336, T05_n, __A05_NET_335, __A05_NET_334, __A05_NET_333, __A05_NET_368, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5058(__A05_NET_360, __A05_NET_330, __A05_NET_369, Z16_n, __A05_NET_368, WA_n, GND, __A05_NET_332, __A05_NET_365, __A05_NET_332, __A05_NET_366, WZ_n, __A05_NET_367, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC04 #(1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0) U5059(__A05_NET_335, __A05_NET_369, __A05_NET_328, __A05_NET_367, __A05_NET_333, __A05_NET_343, GND, __A05_NET_322, __A05_NET_324, NISQ, __A05_1__NISQ_n, __A05_1__MNISQ, __A05_1__NISQ_n, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b0, 1'b0, 1'b1) U5060(__A05_NET_366, IC16, MP3, __A05_NET_328, T06_n, __A05_NET_332, GND, T06_n, DAS1_n, n6XP8, n6XP8, __A05_2__6XP7, __A05_NET_306, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5061(__A05_NET_306, TOV_n, __A05_NET_303, RU_n, __A05_NET_302, RU_n, GND, WB_n, __A05_NET_304, RG_n, __A05_NET_314, TSGN_n, __A05_NET_342, VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U5062(__A05_2__6XP7, DV4_n, T06_n, __A05_NET_316, T07_n, __A05_NET_305, GND, T07_n, STFET1_n, __A05_NET_315, T08_n, DV4_n, RSTSTG, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5063(__A05_NET_328, n6XP8, __A05_NET_309, __A05_NET_340, __A05_NET_308, __A05_NET_302, GND, __A05_2__6XP2, T06_n, RXOR0, INOUT_n, __A05_NET_303, n5XP11, VCC, SIM_RST, SIM_CLK);
    U74HC27 #(1'b0, 1'b1, 1'b0) U5064(IC13, IC14, __A05_NET_316, __A05_NET_340, __A05_NET_309, __A05_NET_304, GND, __A05_NET_314, __A05_NET_316, __A05_NET_315, __A05_NET_323, __A05_NET_305, DV1, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5065(T08_n, MONWBK, IC2, IC14, DV1, __A05_NET_321, GND, __A05_NET_318, DV4B1B, IC4, __A05_NET_320, U2BBK, STFET1_n, VCC, SIM_RST, SIM_CLK);
    U74HC02 U5066(__A05_NET_342, RSTSTG, __A05_2__5XP9, __A05_NET_333, T09_n, __A05_NET_336, GND, T09_n, DV4_n, __A05_NET_340, T09_n, DAS1_n, __A05_NET_324, VCC, SIM_RST, SIM_CLK);
    U74LVC07 U5067(__A05_NET_343, Z15_n, __A05_NET_338, WL_n, __A05_NET_322, TMZ_n, GND, WYD_n, __A05_NET_326, TSGN_n, __A05_NET_226,  ,  , VCC, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10
    U74HC02 U5068(__A05_NET_309, T10_n, __A05_NET_321,  ,  ,  , GND, T10_n, IC11_n, __A05_2__10XP10, T10_n, __A05_NET_318, __A05_NET_317, VCC, SIM_RST, SIM_CLK);
    U74HC27 U5069(DAS1_n, ADS0, T12_n, T12USE_n, DV1_n, __A05_NET_308, GND,  ,  ,  ,  , __A05_NET_320, BR2, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b0, 1'b1, 1'b0) U5070(DV4B1B, DV4_n, BR1, __A05_2__11XP6, T11_n, DV1_n, GND, __A05_2__5XP9, __A05_2__11XP6, __A05_NET_326, T11_n, RXOR0_n, __A05_NET_323, VCC, SIM_RST, SIM_CLK);
endmodule