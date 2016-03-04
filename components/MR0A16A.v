`timescale 1ns/1ps
`default_nettype none

module MR0A16A (A0, A1, A2, A3, A4, E_n, DQL0, DQL1, DQL2, DQL3, VDD1, VSS1, DQL4, DQL5, DQL6, DQL7, W_n, A5, A6, A7, A8, A9, A10, A11, A12, VSS2, VDD2, DC, DQU8, DQU9, DQU10, DQU11, VDD3, VSS3, DQU12, DQU13, DQU14, DQU15, LB_n, UB_n, G_n, A13, A14, A15, SIM_RST, SIM_CLK);

    input wire SIM_RST;
    input wire SIM_CLK;

    input wire VDD1;
    input wire VDD2;
    input wire VDD3;
    input wire VSS1;
    input wire VSS2;
    input wire VSS3;

    input wire E_n;
    input wire G_n;
    input wire W_n;
    input wire LB_n;
    input wire UB_n;

    input wire A0;
    input wire A1;
    input wire A2;
    input wire A3;
    input wire A4;
    input wire A5;
    input wire A6;
    input wire A7;
    input wire A8;
    input wire A9;
    input wire A10;
    input wire A11;
    input wire A12;
    input wire A13;
    input wire A14;
    input wire A15;

    output wire DQL0;
    output wire DQL1;
    output wire DQL2;
    output wire DQL3;
    output wire DQL4;
    output wire DQL5;
    output wire DQL6;
    output wire DQL7;
    output wire DQU8;
    output wire DQU9;
    output wire DQU10;
    output wire DQU11;
    output wire DQU12;
    output wire DQU13;
    output wire DQU14;
    output wire DQU15;

    input wire DC;

    wire [11:0] addr;
    assign addr = {A11, A10, A9, A8, A7, A6, A5, A4, A3, A2, A1, A0};

    reg [15:0] ram[0:2047];
    wire [15:0] sensed_word;
    assign sensed_word =  ram[addr];

    assign DQL0 = (!E_n && !G_n) ? sensed_word[0] : 1'bZ;
    assign DQL1 = (!E_n && !G_n) ? sensed_word[1] : 1'bZ;
    assign DQL2 = (!E_n && !G_n) ? sensed_word[2] : 1'bZ;
    assign DQL3 = (!E_n && !G_n) ? sensed_word[3] : 1'bZ;
    assign DQL4 = (!E_n && !G_n) ? sensed_word[4] : 1'bZ;
    assign DQL5 = (!E_n && !G_n) ? sensed_word[5] : 1'bZ;
    assign DQL6 = (!E_n && !G_n) ? sensed_word[6] : 1'bZ;
    assign DQL7 = (!E_n && !G_n) ? sensed_word[7] : 1'bZ;
    assign DQU8 = (!E_n && !G_n) ? sensed_word[8] : 1'bZ;
    assign DQU9 = (!E_n && !G_n) ? sensed_word[9] : 1'bZ;
    assign DQU10 = (!E_n && !G_n) ? sensed_word[10] : 1'bZ;
    assign DQU11 = (!E_n && !G_n) ? sensed_word[11] : 1'bZ;
    assign DQU12 = (!E_n && !G_n) ? sensed_word[12] : 1'bZ;
    assign DQU13 = (!E_n && !G_n) ? sensed_word[13] : 1'bZ;
    assign DQU14 = (!E_n && !G_n) ? sensed_word[14] : 1'bZ;
    assign DQU15 = (!E_n && !G_n) ? sensed_word[15] : 1'bZ;

    wire [15:0] write_word;
    assign write_word = {DQU15, DQU14, DQU13, DQU12, DQU11, DQU10, DQU9, DQU8, DQL7, DQL6, DQL5, DQL4, DQL3, DQL2, DQL1, DQL0};

    reg [11:0] i;
    initial begin
        for (i = 0; i < 2048; i = i + 1)
        begin
            ram[i] = 16'b0;
        end
    end

    always @(E_n or W_n or G_n) begin
        if (!E_n && G_n && !W_n) begin
            ram[addr] = write_word;
        end else if (!E_n && !G_n && !W_n) begin
            //$display("ERROR: Write and read on MRAM");
            //$finish;
        end
    end
endmodule
