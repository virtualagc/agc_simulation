`include "components/agc_parts.v"

module timer(VCC, GND, SIM_RST, CLOCK, PHS2, PHS2_n, PHS4, PHS4_n, RT, CT, CT_n, WT, WT_n);
    input wire SIM_RST;
    wire _ncdiv1_a;
    output wire CT_n;
    output wire CT;
    input wire CLOCK;
    output wire PHS4_n;
    input wire VCC;
    output wire PHS4;
    wire NET_2;
    wire NET_20;
    wire NET_5;
    input wire GND;
    output wire PHS2_n;
    output wire PHS2;
    wire TT_n;
    output wire WT;
    wire _ncdiv1_d;
    wire NET_3;
    wire _ncdiv1_b;
    output wire WT_n;
    output wire RT;

    U74HC02 #(0, 1, 0, 0) U1(_ncdiv1_d, NET_5, _ncdiv1_b, NET_5, _ncdiv1_b, NET_20, GND, NET_5, _ncdiv1_a, NET_20, _ncdiv1_a, NET_20, PHS2, VCC, SIM_RST);
    wire U2_8_NC;
    wire U2_9_NC;
    wire U2_10_NC;
    wire U2_11_NC;
    U74HC27 #(0, 1, 0) U2(_ncdiv1_d, CLOCK, _ncdiv1_b, CLOCK, PHS2, _ncdiv1_a, GND, U2_8_NC, U2_9_NC, U2_10_NC, U2_11_NC, _ncdiv1_b, _ncdiv1_a, VCC, SIM_RST);
    wire U5_10_NC;
    wire U5_11_NC;
    wire U5_12_NC;
    wire U5_13_NC;
    U74HC04 U5(NET_5, WT, WT, WT_n, WT, TT_n, GND, RT, _ncdiv1_a, U5_10_NC, U5_11_NC, U5_12_NC, U5_13_NC, VCC, SIM_RST);
    wire U4_4_NC;
    wire U4_5_NC;
    wire U4_6_NC;
    wire U4_8_NC;
    wire U4_9_NC;
    wire U4_10_NC;
    wire U4_11_NC;
    wire U4_12_NC;
    wire U4_13_NC;
    U74HC02 U4(PHS4, NET_2, _ncdiv1_a, U4_4_NC, U4_5_NC, U4_6_NC, GND, U4_8_NC, U4_9_NC, U4_10_NC, U4_11_NC, U4_12_NC, U4_13_NC, VCC, SIM_RST);
    U74HC04 U3(_ncdiv1_d, NET_2, PHS2, PHS2_n, PHS4, PHS4_n, GND, NET_3, _ncdiv1_b, CT, NET_3, CT_n, CT, VCC, SIM_RST);
endmodule