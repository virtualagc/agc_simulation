`timescale 1ns/1ps

module service_gates(VCC, GND, SIM_RST, T10_n, P04_n, CT_n, RT_n, TT_n, WT_n, MP3A, STFET1_n, A2X_n, CGMC, CI_n, L2GD_n, NEAC, PIFL_n, RA_n, RB_n, RC_n, RCH_n, RG_n, RL_n, RL10BB, RQ_n, RSC_n, RU_n, RUS_n, RZ_n, U2BBK, WA_n, WB_n, WCH_n, WG_n, WL_n, WQ_n, WS_n, WSC_n, WY_n, WY12_n, WYD_n, WZ_n, ZAP_n, CYL_n, CYR_n, EDOP_n, SR_n, EAC_n, GINH, L15_n, PIPPLS_n, SB2_n, SCAD_n, SHIFT, SUMA15_n, SUMB15_n, XB0_n, XB1_n, XB2_n, XB3_n, XB4_n, XB5_n, XB6_n, XT0_n, A2XG_n, CAG, CBG, CGG, CLG1G, CLG2G, CQG, CSG, CUG, CZG, CI01_n, G2LSG_n, L2GDG_n, RAG_n, RBHG_n, RBLG_n, RCG_n, RGG_n, RLG_n, RQG_n, RUG_n, RULOG_n, RZG_n, US2SG, WAG_n, WALSG_n, WBG_n, WEDOPG_n, WG1G_n, WG2G_n, WG3G_n, WG4G_n, WG5G_n, WLG_n, WQG_n, WSG_n, WYDG_n, WYDLOG_n, WYHIG_n, WYLOG_n, WZG_n);
    input wire SIM_RST;
    output wire A2XG_n;
    input wire A2X_n;
    output wire CAG;
    output wire CBG;
    output wire CGG;
    input wire CGMC;
    output wire CI01_n;
    input wire CI_n;
    output wire CLG1G;
    output wire CLG2G;
    output wire CQG;
    output wire CSG;
    input wire CT_n;
    output wire CUG;
    input wire CYL_n;
    input wire CYR_n;
    output wire CZG;
    input wire EAC_n;
    input wire EDOP_n;
    output wire G2LSG_n;
    input wire GINH;
    input wire GND;
    input wire L15_n;
    output wire L2GDG_n;
    input wire L2GD_n;
    input wire MP3A;
    input wire NEAC;
    wire NET_137;
    wire NET_138;
    wire NET_139;
    wire NET_140;
    wire NET_141;
    wire NET_142;
    wire NET_143;
    wire NET_144;
    wire NET_145;
    wire NET_148;
    wire NET_149;
    wire NET_151;
    wire NET_152;
    wire NET_153;
    wire NET_154;
    wire NET_155;
    wire NET_156;
    wire NET_157;
    wire NET_158;
    wire NET_159;
    wire NET_160;
    wire NET_161;
    wire NET_162;
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
    wire NET_173;
    wire NET_174;
    wire NET_175;
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
    wire NET_211;
    wire NET_213;
    wire NET_214;
    input wire P04_n;
    input wire PIFL_n;
    input wire PIPPLS_n;
    output wire RAG_n;
    input wire RA_n;
    output wire RBHG_n;
    output wire RBLG_n;
    input wire RB_n;
    output wire RCG_n;
    input wire RCH_n;
    input wire RC_n;
    output wire RGG_n;
    input wire RG_n;
    input wire RL10BB;
    output wire RLG_n;
    input wire RL_n;
    output wire RQG_n;
    input wire RQ_n;
    input wire RSC_n;
    input wire RT_n;
    output wire RUG_n;
    output wire RULOG_n;
    input wire RUS_n;
    input wire RU_n;
    output wire RZG_n;
    input wire RZ_n;
    input wire SB2_n;
    input wire SCAD_n;
    input wire SHIFT;
    input wire SR_n;
    input wire STFET1_n;
    input wire SUMA15_n;
    input wire SUMB15_n;
    input wire T10_n;
    input wire TT_n;
    input wire U2BBK;
    output wire US2SG;
    input wire VCC;
    output wire WAG_n;
    output wire WALSG_n;
    input wire WA_n;
    output wire WBG_n;
    input wire WB_n;
    input wire WCH_n;
    output wire WEDOPG_n;
    output wire WG1G_n;
    output wire WG2G_n;
    output wire WG3G_n;
    output wire WG4G_n;
    output wire WG5G_n;
    input wire WG_n;
    output wire WLG_n;
    input wire WL_n;
    output wire WQG_n;
    input wire WQ_n;
    input wire WSC_n;
    output wire WSG_n;
    input wire WS_n;
    input wire WT_n;
    input wire WY12_n;
    output wire WYDG_n;
    output wire WYDLOG_n;
    input wire WYD_n;
    output wire WYHIG_n;
    output wire WYLOG_n;
    input wire WY_n;
    output wire WZG_n;
    input wire WZ_n;
    input wire XB0_n;
    input wire XB1_n;
    input wire XB2_n;
    input wire XB3_n;
    input wire XB4_n;
    input wire XB5_n;
    input wire XB6_n;
    input wire XT0_n;
    input wire ZAP_n;
    wire __A07_1__CCHG_n;
    wire __A07_1__MWAG;
    wire __A07_1__MWBG;
    wire __A07_1__MWG;
    wire __A07_1__MWLG;
    wire __A07_1__MWQG;
    wire __A07_1__MWSG;
    wire __A07_1__MWYG;
    wire __A07_1__MWZG;
    wire __A07_1__P04A;
    wire __A07_1__PIPSAM_n;
    wire __A07_1__WALSG;
    wire __A07_1__WCHG_n;
    wire __A07_1__WGA_n;
    wire __A07_1__WGNORM;
    wire __A07_1__WSCG_n;
    wire __A07_2__CEBG;
    wire __A07_2__CFBG;
    wire __A07_2__CIFF;
    wire __A07_2__CINORM;
    wire __A07_2__G2LSG;
    wire __A07_2__MRAG;
    wire __A07_2__MRGG;
    wire __A07_2__MRLG;
    wire __A07_2__MRULOG;
    wire __A07_2__MWBBEG;
    wire __A07_2__MWEBG;
    wire __A07_2__MWFBG;
    wire __A07_2__RBBEG_n;
    wire __A07_2__RBBK;
    wire __A07_2__RCHG_n;
    wire __A07_2__REBG_n;
    wire __A07_2__RFBG_n;
    wire __A07_2__RSCG_n;
    wire __A07_2__RUSG_n;
    wire __A07_2__U2BBKG_n;
    wire __A07_2__WBBEG_n;
    wire __A07_2__WEBG_n;
    wire __A07_2__WFBG_n;

    pullup R7001(NET_162);
    U74HC02 #(0, 1, 0, 0) U7001(__A07_1__WALSG, ZAP_n, WT_n, NET_166, NET_165, NET_167, GND, NET_166, WT_n, NET_169, WY_n, WT_n, NET_168, VCC, SIM_RST);
    U74HC04 #(1, 0, 0, 1, 1, 0) U7002(__A07_1__WALSG, WALSG_n, WY12_n, NET_165, WY_n, NET_167, GND, WYLOG_n, NET_169, WYHIG_n, NET_168, __A07_1__MWYG, NET_160, VCC, SIM_RST);
    U74HC02 #(0, 0, 0, 1) U7003(NET_160, NET_169, NET_158, NET_158, WYD_n, WT_n, GND, NET_160, CT_n, CUG, L15_n, PIFL_n, NET_164, VCC, SIM_RST);
    U74HC04 #(1, 1, 1, 0, 0, 1) U7004(NET_158, WYDG_n, NET_162, WYDLOG_n, NET_163, WBG_n, GND, __A07_1__MWBG, WBG_n, __A07_1__MWG, __A07_1__WGA_n, WG1G_n, __A07_1__WGNORM, VCC, SIM_RST);
    U74HC02 #(0, 0, 0, 1) U7005(NET_159, WYD_n, WT_n, NET_163, WB_n, WT_n, GND, WBG_n, CT_n, CBG, __A07_1__WGNORM, NET_175, WG2G_n, VCC, SIM_RST);
    U74HC27 U7006(SHIFT, NEAC, __A07_1__WGA_n, WT_n, GINH, __A07_1__WGNORM, GND, NET_175, __A07_1__WGA_n, WT_n, SR_n, NET_161, NET_164, VCC, SIM_RST);
    wire U7007_5_NC;
    wire U7007_6_NC;
    wire U7007_8_NC;
    wire U7007_9_NC;
    wire U7007_10_NC;
    wire U7007_11_NC;
    wire U7007_12_NC;
    wire U7007_13_NC;
    U74LVC07 U7007(NET_159, NET_162, NET_161, NET_162, U7007_5_NC, U7007_6_NC, GND, U7007_8_NC, U7007_9_NC, U7007_10_NC, U7007_11_NC, U7007_12_NC, U7007_13_NC, VCC, SIM_RST);
    U74HC27 U7008(__A07_1__WGA_n, WT_n, __A07_1__WGA_n, WT_n, CYL_n, NET_170, GND, NET_174, __A07_1__WGA_n, WT_n, EDOP_n, NET_171, CYR_n, VCC, SIM_RST);
    U74HC04 U7009(NET_171, WG5G_n, NET_170, WG3G_n, NET_174, WEDOPG_n, GND, __A07_1__MWZG, WZG_n, __A07_1__MWLG, WLG_n, __A07_1__MWAG, WAG_n, VCC, SIM_RST);
    U74HC02 #(0, 0, 0, 1) U7010(WG4G_n, NET_175, NET_171, NET_172, WT_n, WZ_n, GND, __A07_1__WSCG_n, XB5_n, NET_173, NET_172, NET_173, WZG_n, VCC, SIM_RST);
    U74HC02 U7011(CZG, WZG_n, CT_n, NET_142, WL_n, WT_n, GND, __A07_1__WSCG_n, XB1_n, NET_145, NET_138, CT_n, CLG1G, VCC, SIM_RST);
    U74HC27 #(0, 1, 0) U7012(XB1_n, XT0_n, NET_142, NET_148, NET_145, WLG_n, GND, NET_139, NET_140, NET_141, __A07_1__WALSG, NET_148, __A07_1__WCHG_n, VCC, SIM_RST);
    U74HC4002 U7013(NET_137, NET_142, NET_148, NET_145, __A07_1__WALSG, NET_143, GND, NET_144, NET_145, NET_148, NET_142, __A07_2__G2LSG, NET_138, VCC, SIM_RST);
    U74HC02 #(0, 0, 0, 1) U7014(CLG2G, NET_137, CT_n, NET_140, WT_n, WA_n, GND, __A07_1__WSCG_n, XB0_n, NET_141, NET_140, NET_141, WAG_n, VCC, SIM_RST);
    U74HC02 U7015(CAG, NET_139, CT_n, NET_155, WT_n, WS_n, GND, WSG_n, CT_n, CSG, WT_n, WQ_n, NET_154, VCC, SIM_RST);
    U74HC04 #(1, 0, 0, 0, 0, 1) U7016(NET_155, WSG_n, WSG_n, __A07_1__MWSG, WQG_n, __A07_1__MWQG, GND, __A07_1__P04A, P04_n, RCG_n, NET_209, G2LSG_n, __A07_2__G2LSG, VCC, SIM_RST);
    U74HC27 #(1, 0, 0) U7017(NET_154, NET_157, XB2_n, XT0_n, __A07_1__WCHG_n, NET_156, GND, __A07_1__PIPSAM_n, PIPPLS_n, SB2_n, __A07_1__P04A, WQG_n, NET_156, VCC, SIM_RST);
    U74HC02 U7018(NET_157, __A07_1__WSCG_n, XB2_n, CQG, WQG_n, CT_n, GND, RT_n, RC_n, NET_209, RT_n, RQ_n, NET_210, VCC, SIM_RST);
    U74HC27 U7019(NET_210, NET_207, XB2_n, XT0_n, __A07_2__RCHG_n, NET_208, GND, __A07_2__RFBG_n, NET_213, NET_214, __A07_2__RBBK, RQG_n, NET_208, VCC, SIM_RST);
    U74HC02 U7020(NET_207, __A07_2__RSCG_n, XB2_n, NET_213, __A07_2__RSCG_n, XB4_n, GND, __A07_2__RSCG_n, XB6_n, NET_214, NET_214, __A07_2__RBBK, __A07_2__RBBEG_n, VCC, SIM_RST);
    U74HC02 U7021(__A07_2__G2LSG, TT_n, ZAP_n, NET_211, TT_n, L2GD_n, GND, TT_n, A2X_n, NET_205, T10_n, STFET1_n, __A07_2__RBBK, VCC, SIM_RST);
    U74HC04 #(1, 1, 0, 0, 0, 0) U7022(NET_211, L2GDG_n, NET_205, A2XG_n, NET_183, CGG, GND, __A07_2__MWEBG, __A07_2__WEBG_n, __A07_2__MWFBG, __A07_2__WFBG_n, __A07_2__WBBEG_n, NET_189, VCC, SIM_RST);
    U74HC02 U7023(NET_204, L2GD_n, CT_n, NET_206, CT_n, WG_n, GND, __A07_1__WSCG_n, XB3_n, __A07_2__WEBG_n, NET_184, CT_n, __A07_2__CEBG, VCC, SIM_RST);
    U74HC27 U7024(NET_204, NET_206, __A07_2__WEBG_n, U2BBK, NET_189, NET_184, GND, NET_185, NET_189, U2BBK, NET_182, NET_183, CGMC, VCC, SIM_RST);
    U74HC02 U7025(__A07_2__CFBG, NET_185, CT_n, NET_182, __A07_1__WSCG_n, T10_n, GND, NET_182, NET_189, __A07_2__WFBG_n, __A07_1__WSCG_n, XB6_n, NET_189, VCC, SIM_RST);
    U74HC04 U7026(__A07_2__WBBEG_n, __A07_2__MWBBEG, NET_190, RGG_n, RGG_n, __A07_2__MRGG, GND, __A07_2__MRAG, RAG_n, __A07_2__MRLG, RLG_n, __A07_2__REBG_n, NET_181, VCC, SIM_RST);
    U74HC02 U7027(NET_190, RT_n, RG_n, NET_191, RT_n, RA_n, GND, NET_191, NET_186, RAG_n, XB0_n, __A07_2__RSCG_n, NET_186, VCC, SIM_RST);
    U74HC02 U7028(NET_187, RT_n, RL_n, NET_188, __A07_2__RSCG_n, XB1_n, GND, RT_n, RZ_n, NET_178, NET_178, NET_177, RZG_n, VCC, SIM_RST);
    U74HC27 U7029(NET_187, NET_188, XB1_n, XT0_n, __A07_2__RCHG_n, NET_179, GND, US2SG, __A07_2__RUSG_n, SUMA15_n, SUMB15_n, RLG_n, NET_179, VCC, SIM_RST);
    U74HC02 U7030(NET_177, XB5_n, __A07_2__RSCG_n, NET_181, __A07_2__RSCG_n, XB3_n, GND, RT_n, RU_n, NET_198, RT_n, RUS_n, NET_180, VCC, SIM_RST);
    wire U7031_12_NC;
    wire U7031_13_NC;
    U74HC04 U7031(NET_198, RUG_n, NET_180, __A07_2__RUSG_n, RULOG_n, __A07_2__MRULOG, GND, RBHG_n, NET_203, NET_201, RL10BB, U7031_12_NC, U7031_13_NC, VCC, SIM_RST);
    U74HC02 U7032(RULOG_n, NET_198, NET_180, NET_203, RT_n, RB_n, GND, RT_n, NET_201, NET_202, NET_203, NET_202, RBLG_n, VCC, SIM_RST);
    wire U7037_1_NC;
    wire U7037_2_NC;
    wire U7037_3_NC;
    wire U7037_4_NC;
    wire U7037_5_NC;
    wire U7037_6_NC;
    U74HC04 U7037(U7037_1_NC, U7037_2_NC, U7037_3_NC, U7037_4_NC, U7037_5_NC, U7037_6_NC, GND, NET_200, CI_n, __A07_1__WSCG_n, NET_149, __A07_2__RSCG_n, NET_196, VCC, SIM_RST);
    wire U7038_1_NC;
    wire U7038_2_NC;
    wire U7038_12_NC;
    wire U7038_13_NC;
    U74HC27 U7038(U7038_1_NC, U7038_2_NC, NEAC, EAC_n, MP3A, __A07_2__CINORM, GND, NET_196, RT_n, RSC_n, SCAD_n, U7038_12_NC, U7038_13_NC, VCC, SIM_RST);
    U74HC02 U7039(NET_199, NET_200, __A07_2__CIFF, __A07_2__CIFF, NET_199, CUG, GND, __A07_2__CIFF, __A07_2__CINORM, CI01_n, WSC_n, SCAD_n, NET_149, VCC, SIM_RST);
    wire U7040_11_NC;
    wire U7040_12_NC;
    wire U7040_13_NC;
    U74HC02 U7040(NET_197, RT_n, RCH_n, NET_153, WT_n, WCH_n, GND, WCH_n, CT_n, NET_151, U7040_11_NC, U7040_12_NC, U7040_13_NC, VCC, SIM_RST);
    U74HC04 #(0, 0, 0, 0, 1, 0) U7041(NET_197, __A07_2__RCHG_n, NET_153, __A07_1__WCHG_n, NET_151, __A07_1__CCHG_n, GND, NET_152, WG_n, __A07_1__WGA_n, NET_152, __A07_2__U2BBKG_n, U2BBK, VCC, SIM_RST);
endmodule