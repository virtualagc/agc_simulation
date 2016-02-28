`timescale 1ns/1ps
`default_nettype none

module fixed_erasable_memory(VCC, GND, SIM_RST, SIM_CLK, ROPER, ROPES, ROPET, HIMOD, LOMOD, STR14, STR58, STR912, STR19, STR210, STR311, STR412, SETAB, SETCD, RESETA, RESETB, RESETC, RESETD, CLROPE, IL07, IL06, IL05, IL04, IL03, IL02, IL01, SBF, SAP, SA01, SA02, SA03, SA04, SA05, SA06, SA07, SA08, SA09, SA10, SA11, SA12, SA13, SA14, SA16);
    input wire VCC;
    input wire GND;
    input wire SIM_RST;
    input wire SIM_CLK;
    input wire CLROPE;
    input wire HIMOD;
    input wire IL01;
    input wire IL02;
    input wire IL03;
    input wire IL04;
    input wire IL05;
    input wire IL06;
    input wire IL07;
    input wire LOMOD;
    input wire RESETA;
    input wire RESETB;
    input wire RESETC;
    input wire RESETD;
    input wire ROPER;
    input wire ROPES;
    input wire ROPET;
    output wire SA01; //FPGA#wor
    output wire SA02; //FPGA#wor
    output wire SA03; //FPGA#wor
    output wire SA04; //FPGA#wor
    output wire SA05; //FPGA#wor
    output wire SA06; //FPGA#wor
    output wire SA07; //FPGA#wor
    output wire SA08; //FPGA#wor
    output wire SA09; //FPGA#wor
    output wire SA10; //FPGA#wor
    output wire SA11; //FPGA#wor
    output wire SA12; //FPGA#wor
    output wire SA13; //FPGA#wor
    output wire SA14; //FPGA#wor
    output wire SA16; //FPGA#wor
    output wire SAP; //FPGA#wor
    input wire SBF;
    input wire SETAB;
    input wire SETCD;
    input wire STR14;
    input wire STR19;
    input wire STR210;
    input wire STR311;
    input wire STR412;
    input wire STR58;
    input wire STR912;
    wire __B01_1__FADDR1;
    wire __B01_1__FADDR10;
    wire __B01_1__FADDR11;
    wire __B01_1__FADDR12;
    wire __B01_1__FADDR13;
    wire __B01_1__FADDR14;
    wire __B01_1__FADDR15;
    wire __B01_1__FADDR16;
    wire __B01_1__FADDR2;
    wire __B01_1__FADDR3;
    wire __B01_1__FADDR4;
    wire __B01_1__FADDR5;
    wire __B01_1__FADDR6;
    wire __B01_1__FADDR7;
    wire __B01_1__FADDR8;
    wire __B01_1__FADDR9;
    wire __B01_1__QRESET;
    wire __B01_1__QUARTERA;
    wire __B01_1__QUARTERB;
    wire __B01_1__QUARTERC;
    wire __B01_1__SBFDONE;
    wire __B01_NET_100;
    wire __B01_NET_111;
    wire __B01_NET_112;
    wire __B01_NET_113;
    wire __B01_NET_114;
    wire __B01_NET_115;
    wire __B01_NET_116;
    wire __B01_NET_117;
    wire __B01_NET_118;
    wire __B01_NET_121;
    wire __B01_NET_122;
    wire __B01_NET_123;
    wire __B01_NET_46;
    wire __B01_NET_48;
    wire __B01_NET_49;
    wire __B01_NET_64;
    wire __B01_NET_65;
    wire __B01_NET_66;
    wire __B01_NET_67;
    wire __B01_NET_69;
    wire __B01_NET_70;
    wire __B01_NET_72;
    wire __B01_NET_73;
    wire __B01_NET_75;
    wire __B01_NET_76;
    wire __B01_NET_77;
    wire __B01_NET_78;
    wire __B01_NET_79;
    wire __B01_NET_80;
    wire __B01_NET_81;
    wire __B01_NET_82;
    wire __B01_NET_83;
    wire __B01_NET_84;
    wire __B01_NET_85;
    wire __B01_NET_86;
    wire __B01_NET_88;
    wire __B01_NET_89;
    wire __B01_NET_90;
    wire __B01_NET_91;
    wire __B01_NET_94;
    wire __B01_NET_95;
    wire __B01_NET_96;

    pulldown R31001(SAP);
    pulldown R31002(SA01);
    pulldown R31003(SA02);
    pulldown R31004(SA03);
    pulldown R31005(SA04);
    pulldown R31006(SA05);
    pulldown R31007(SA06);
    pulldown R31008(SA07);
    pulldown R31009(SA08);
    pulldown R31010(SA09);
    pulldown R31011(SA10);
    pulldown R31012(SA11);
    pulldown R31013(SA12);
    pulldown R31014(SA13);
    pulldown R31015(SA14);
    pulldown R31016(SA16);
    SST39VF200A U31001(__B01_1__FADDR16, __B01_1__FADDR15, __B01_1__FADDR14, __B01_1__FADDR13, __B01_1__FADDR12, __B01_1__FADDR11, __B01_1__FADDR10, __B01_1__FADDR9,  ,  , VCC,  ,  ,  ,  ,  ,  , __B01_1__FADDR8, __B01_1__FADDR7, __B01_1__FADDR6, __B01_1__FADDR5, __B01_1__FADDR4, __B01_1__FADDR3, __B01_1__FADDR2, __B01_1__FADDR1, __B01_NET_100, GND, __B01_NET_46, SAP, SA08, SA01, SA09, SA02, SA10, SA03, SA11, VCC, SA04, SA12, SA05, SA13, SA06, SA14, SA07, SA16, GND,  , GND, SIM_RST, SIM_CLK); //FPGA#inputs:EPCS_DATA;FPGA#outputs:EPCS_CSN,EPCS_DCLK,EPCS_ASDI;FPGA#OD:29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45
    U74HC04 U31002(ROPER, __B01_NET_113, ROPES, __B01_NET_111, ROPET, __B01_NET_88, GND, __B01_NET_90, STR14, __B01_NET_115, STR58, __B01_NET_112, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31003(__B01_NET_88, LOMOD, ROPER, __B01_NET_114, __B01_NET_94, __B01_1__FADDR15, GND, __B01_NET_114, ROPES, LOMOD, STR14, __B01_1__FADDR16, STR14, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31004(ROPET, HIMOD, ROPER, LOMOD, STR14, __B01_NET_96, GND, __B01_NET_89, ROPET, LOMOD, __B01_NET_90, __B01_NET_94, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31005(__B01_NET_95, __B01_NET_111, __B01_NET_112, __B01_NET_91, __B01_NET_113, HIMOD, GND, HIMOD, STR58, __B01_NET_116, LOMOD, __B01_NET_115, __B01_NET_117, VCC, SIM_RST, SIM_CLK);
    U74HC4002 U31006(__B01_1__FADDR14, __B01_NET_95, __B01_NET_96, __B01_NET_89, __B01_NET_91,  , GND,  , __B01_NET_121, __B01_NET_122, __B01_NET_123, __B01_NET_118, __B01_1__FADDR13, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31007(ROPES, HIMOD, ROPES, LOMOD, STR14, __B01_NET_122, GND, __B01_NET_123, __B01_NET_111, HIMOD, __B01_NET_112, __B01_NET_121, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31008(__B01_NET_111, LOMOD,  ,  ,  ,  , GND,  ,  ,  ,  , __B01_NET_118, __B01_NET_90, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31009(__B01_1__FADDR12, __B01_NET_116, __B01_NET_117, __B01_1__FADDR11, STR210, STR19, GND, STR19, STR311, __B01_1__FADDR10, __B01_1__QUARTERB, __B01_1__QUARTERA, __B01_1__FADDR9, VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b1, 1'b0, 1'b0) U31010(__B01_1__FADDR8, __B01_1__QUARTERA, __B01_1__QUARTERC, __B01_NET_48, __B01_NET_49, __B01_1__QUARTERA, GND, __B01_NET_48, __B01_1__QRESET, __B01_1__QUARTERA, __B01_NET_76, __B01_NET_77, __B01_NET_49, VCC, SIM_RST, SIM_CLK);
    U74HC04 U31011(IL07, __B01_1__FADDR7, IL06, __B01_1__FADDR6, IL05, __B01_1__FADDR5, GND, __B01_1__FADDR4, IL04, __B01_1__FADDR3, IL03, __B01_1__FADDR2, IL02, VCC, SIM_RST, SIM_CLK);
    U74HC04 #(1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1) U31012(IL01, __B01_1__FADDR1, SBF, __B01_NET_46, SETAB, __B01_NET_76, GND, __B01_NET_77, RESETB,  ,  , __B01_NET_78, __B01_NET_84, VCC, SIM_RST, SIM_CLK);
    U74HC4002 #(1'b1, 1'b0) U31013(__B01_NET_100, STR19, STR210, STR311, STR412,  , GND,  ,  ,  ,  ,  ,  , VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b1, 1'b0, 1'b0) U31014(__B01_1__SBFDONE, SBF, __B01_NET_83, __B01_NET_75, __B01_1__SBFDONE, __B01_NET_84, GND, __B01_NET_75, SBF, __B01_NET_84, __B01_NET_76, __B01_NET_65, __B01_NET_64, VCC, SIM_RST, SIM_CLK);
    U74HC04 #(1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1) U31015(__B01_NET_78, __B01_NET_85, __B01_NET_85, __B01_NET_86, __B01_NET_86, __B01_NET_79, GND, __B01_NET_81, __B01_NET_79, __B01_NET_80, __B01_NET_81, __B01_NET_82, __B01_NET_80, VCC, SIM_RST, SIM_CLK);
    U74HC04 #(1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0) U31016(__B01_NET_82, __B01_NET_83, RESETA, __B01_NET_65, SETCD, __B01_NET_70, GND, __B01_NET_69, RESETD, __B01_1__QRESET, __B01_NET_72,  ,  , VCC, SIM_RST, SIM_CLK);
    U74HC02 #(1'b1, 1'b0, 1'b1, 1'b0) U31017(__B01_NET_67, __B01_NET_64, __B01_1__QUARTERB, __B01_1__QUARTERB, __B01_NET_67, __B01_1__QRESET, GND, __B01_NET_73, __B01_1__QUARTERC, __B01_NET_66, __B01_NET_66, __B01_1__QRESET, __B01_1__QUARTERC, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31018(__B01_NET_73, __B01_NET_70, __B01_NET_69, __B01_NET_72, CLROPE, __B01_1__SBFDONE, GND,  ,  ,  ,  ,  ,  , VCC, SIM_RST, SIM_CLK);
endmodule