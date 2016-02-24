`timescale 1ns/1ps
`default_nettype none

module fixed_erasable_memory(VCC, GND, SIM_RST, SIM_CLK, ROPER, ROPES, ROPET, HIMOD, LOMOD, STR14, STR58, STR912, STR19, STR210, STR311, RESETA, RESETB, RESETC, IL07, IL06, IL05, IL04, IL03, IL02, IL01, SBF, SAP, SA01, SA02, SA03, SA04, SA05, SA06, SA07, SA08, SA09, SA10, SA11, SA12, SA13, SA14, SA16);
    input wire VCC;
    input wire GND;
    input wire SIM_RST;
    input wire SIM_CLK;
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
    input wire ROPER;
    input wire ROPES;
    input wire ROPET;
    output wire SA01; //FPGA:wand
    output wire SA02; //FPGA:wand
    output wire SA03; //FPGA:wand
    output wire SA04; //FPGA:wand
    output wire SA05; //FPGA:wand
    output wire SA06; //FPGA:wand
    output wire SA07; //FPGA:wand
    output wire SA08; //FPGA:wand
    output wire SA09; //FPGA:wand
    output wire SA10; //FPGA:wand
    output wire SA11; //FPGA:wand
    output wire SA12; //FPGA:wand
    output wire SA13; //FPGA:wand
    output wire SA14; //FPGA:wand
    output wire SA16; //FPGA:wand
    output wire SAP; //FPGA:wand
    input wire SBF;
    input wire STR14;
    input wire STR19;
    input wire STR210;
    input wire STR311;
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
    wire __B01_NET_42;
    wire __B01_NET_43;
    wire __B01_NET_44;
    wire __B01_NET_45;
    wire __B01_NET_48;
    wire __B01_NET_49;
    wire __B01_NET_52;
    wire __B01_NET_53;
    wire __B01_NET_56;
    wire __B01_NET_57;
    wire __B01_NET_58;
    wire __B01_NET_59;
    wire __B01_NET_60;
    wire __B01_NET_62;
    wire __B01_NET_72;
    wire __B01_NET_73;
    wire __B01_NET_74;
    wire __B01_NET_76;
    wire __B01_NET_77;

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
    SST39VF200A U31001(__B01_1__FADDR16, __B01_1__FADDR15, __B01_1__FADDR14, __B01_1__FADDR13, __B01_1__FADDR12, __B01_1__FADDR11, __B01_1__FADDR10, __B01_1__FADDR9,  ,  , VCC,  ,  ,  ,  ,  ,  , __B01_1__FADDR8, __B01_1__FADDR7, __B01_1__FADDR6, __B01_1__FADDR5, __B01_1__FADDR4, __B01_1__FADDR3, __B01_1__FADDR2, __B01_1__FADDR1, GND, GND, __B01_NET_62, SAP, SA08, SA01, SA09, SA02, SA10, SA03, SA11, VCC, SA04, SA12, SA05, SA13, SA06, SA14, SA07, SA16, GND,  , GND, SIM_RST, SIM_CLK); //OD:29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45
    U74HC04 U31002(ROPER, __B01_NET_72, ROPES, __B01_NET_73, ROPET, __B01_NET_74, GND, __B01_NET_56, STR14, __B01_NET_76, STR58, __B01_NET_77, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31003(__B01_NET_74, LOMOD, ROPER, __B01_NET_53, __B01_NET_52, __B01_1__FADDR15, GND, __B01_NET_53, ROPES, LOMOD, STR14, __B01_1__FADDR16, STR14, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31004(ROPET, HIMOD, ROPER, LOMOD, STR14, __B01_NET_60, GND, __B01_NET_57, ROPET, LOMOD, __B01_NET_56, __B01_NET_52, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31005(__B01_NET_59, __B01_NET_73, __B01_NET_77, __B01_NET_58, __B01_NET_72, HIMOD, GND, HIMOD, STR58, __B01_NET_48, LOMOD, __B01_NET_76, __B01_NET_49, VCC, SIM_RST, SIM_CLK);
    U74HC4002 U31006(__B01_1__FADDR14, __B01_NET_59, __B01_NET_60, __B01_NET_57, __B01_NET_58,  , GND,  , __B01_NET_42, __B01_NET_43, __B01_NET_44, __B01_NET_45, __B01_1__FADDR13, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31007(ROPES, HIMOD, ROPES, LOMOD, STR14, __B01_NET_43, GND, __B01_NET_44, __B01_NET_73, HIMOD, __B01_NET_77, __B01_NET_42, STR912, VCC, SIM_RST, SIM_CLK);
    U74HC27 U31008(__B01_NET_73, LOMOD,  ,  ,  ,  , GND,  ,  ,  ,  , __B01_NET_45, __B01_NET_56, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31009(__B01_1__FADDR12, __B01_NET_48, __B01_NET_49, __B01_1__FADDR11, STR210, STR19, GND, STR19, STR311, __B01_1__FADDR10, RESETB, RESETA, __B01_1__FADDR9, VCC, SIM_RST, SIM_CLK);
    U74HC02 U31010(__B01_1__FADDR8, RESETA, RESETC,  ,  ,  , GND,  ,  ,  ,  ,  ,  , VCC, SIM_RST, SIM_CLK);
    U74HC04 U31011(IL07, __B01_1__FADDR7, IL06, __B01_1__FADDR6, IL05, __B01_1__FADDR5, GND, __B01_1__FADDR4, IL04, __B01_1__FADDR3, IL03, __B01_1__FADDR2, IL02, VCC, SIM_RST, SIM_CLK);
    U74HC04 U31012(IL01, __B01_1__FADDR1, SBF, __B01_NET_62,  ,  , GND,  ,  ,  ,  ,  ,  , VCC, SIM_RST, SIM_CLK);
endmodule