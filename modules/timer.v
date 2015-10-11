`include "components/agc_parts.v"

module timer(VCC, GND, SIM_RST, CLOCK);
    input wire SIM_RST;
    input wire VCC;
    input wire CLOCK;
    wire NET_7;
    wire NET_1;
    wire NET_6;
    wire NET_5;
    wire NET_9;
    wire NET_8;
    input wire GND;

    wire U2_8_NC;
    wire U2_9_NC;
    wire U2_10_NC;
    wire U2_11_NC;
    U74HC27 #(0, 1, 0) U2(NET_7, CLOCK, NET_9, CLOCK, NET_1, NET_8, GND, U2_8_NC, U2_9_NC, U2_10_NC, U2_11_NC, NET_9, NET_8, VCC, SIM_RST);
    U74HC02 #(0, 1, 0, 0) U1(NET_7, NET_6, NET_9, NET_6, NET_9, NET_5, GND, NET_6, NET_8, NET_5, NET_8, NET_5, NET_1, VCC, SIM_RST);
endmodule