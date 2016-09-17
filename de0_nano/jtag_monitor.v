`timescale 1ns/1ps
`default_nettype none

`define BYPASS  5'o0
`define CONTROL 5'o2
`define REG_A   5'o20
`define REG_L   5'o21
`define REG_Q   5'o22
`define REG_Z   5'o23
`define REG_BB  5'o24
`define REG_G   5'o25
`define REG_SQ  5'o26
`define REG_S   5'o27
`define REG_B   5'o30
`define REG_X   5'o31
`define REG_Y   5'o32
`define REG_U   5'o33

`define STEP_INST 1'b1
`define STEP_MCT  1'b0

module jtag_monitor(SIM_CLK, MSTRT, MSTP, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MONPAR, MREAD, MLOAD, MRDCH, MLDCH, MTCSAI, MONWBK, MNHRPT, MNHNC, MNHSBF, MAMU, NHALGA, DBLTST, DOSCAL, MT01, MWL01, MWL02, MWL03, MWL04, MWL05, MWL06, MWL07, MWL08, MWL09, MWL10, MWL11, MWL12, MWL13, MWL14, MWL15, MWL16, MSQ16, MSQ14, MSQ13, MSQ12, MSQ11, MSQ10, MSQEXT, MNISQ, MWAG, MWLG, MWQG, MWZG, MWBBEG, MWEBG, MWFBG, MWG, MWSG, MWBG, MWCH);
    input wire SIM_CLK;
    output wire MSTRT;     // Inject a Fresh Start when pulsed
    output wire MSTP;      // While asserted, the timepulse generator is stuck in timepulse 12. Allows MCT-by-MCT stepping

    output reg MDT01 = 0;  // Monitor data bus. Directly fed onto the write bus without gating.
    output reg MDT02 = 0;
    output reg MDT03 = 0;
    output reg MDT04 = 0;
    output reg MDT05 = 0;
    output reg MDT06 = 0;
    output reg MDT07 = 0;
    output reg MDT08 = 0;
    output reg MDT09 = 0;
    output reg MDT10 = 0;
    output reg MDT11 = 0;
    output reg MDT12 = 0;
    output reg MDT13 = 0;
    output reg MDT14 = 0;
    output reg MDT15 = 0;
    output reg MDT16 = 0;
    output reg MONPAR = 0; // Monitor parity input. Handled indentically to SAP (Sense Amplifier Parity)

    output reg MREAD = 0;  // Reads the value of a memory location by starting the FETCH unprogrammed sequence
    output reg MLOAD = 0;  // Writes to a memory location by starting the STORE unprogrammed sequence
    output reg MRDCH = 0;  // Reads the value of a channel by starting the INOTRD (In/Out Read) unprogrammed sequence
    output reg MLDCH = 0;  // Writes to a channel by starting the INOTLD (In/Out Load) unprogrammed sequence
    output reg MTCSAI = 0; // Transfers control to the address specified by starting the TCSAJ unprogrammed sequence

    output reg MONWBK = 0; // Inhibits U2BBK during STORE and FETCH sequences
    output reg MNHRPT = 0; // Inhibits interrupts while asserted
    output reg MNHNC = 0;  // Inhibits counter interrupts while asserted
    output reg MNHSBF = 0; // Inhibits fixed memory reads while asserted
    output reg MAMU = 0;   // Inhibits erasable memory access
    output wire NHALGA;    // Inhibits alarm gate alarms while asserted

    output reg DBLTST = 0; // Tests the scaler double alarm, probably making use of MON800
    output reg DOSCAL = 0; // Tests the scaler fail alarm by inhibiting SCAS17
    
    input wire MT01;       // Timepulses
    
    input wire MWL01;      // Write bus
    input wire MWL02;
    input wire MWL03;
    input wire MWL04;
    input wire MWL05;
    input wire MWL06;
    input wire MWL07;
    input wire MWL08;
    input wire MWL09;
    input wire MWL10;
    input wire MWL11;
    input wire MWL12;
    input wire MWL13;
    input wire MWL14;
    input wire MWL15;
    input wire MWL16;
    
    input wire MSQ16;      // SQ register bits
    input wire MSQ14;
    input wire MSQ13;
    input wire MSQ12;
    input wire MSQ11;
    input wire MSQ10;
    input wire MSQEXT;
    
    input wire MNISQ;      // New instruction loaded into the SQ register
    input wire MWAG;       // Write into the A register
    input wire MWLG;       // Write into the L register
    input wire MWQG;       // Write into the Q register
    input wire MWZG;       // Write into the Z register
    input wire MWBBEG;     // Write into the BB register
    input wire MWEBG;      // Write into the EB register
    input wire MWFBG;      // Write into the FB register
    input wire MWG;        // Write into the G register
    input wire MWSG;       // Write into the S register
    input wire MWBG;       // Write into the B register
    input wire MWCH;       // Write to a channel
    
    wire [15:0] write_bus;
    assign write_bus = {MWL16, MWL15, MWL14, MWL13, MWL12, MWL11, MWL10, MWL09, MWL08, MWL07, MWL06, MWL05, MWL04, MWL03, MWL02, MWL01};
    wire [15:0] direct_sq;
    assign direct_sq = {MSQ16, MSQ14, MSQ13, MSQ12, MSQ11, MSQ10, 9'b0, MSQEXT};
    
    // JTAG Registers
    reg bypass_reg = 0;
    reg [15:0] tmp_reg;
    reg [15:0] cntrl_reg = 16'o0;
    reg [15:0] a_reg = 16'o0;
    reg [15:0] l_reg = 16'o0;
    reg [15:0] q_reg = 16'o0;
    reg [15:0] z_reg = 16'o0;
    reg [15:0] bb_reg = 16'o0;
    reg [15:0] g_reg = 16'o0;
    reg [15:0] s_reg = 16'o0;
    reg [15:0] b_reg = 16'o0;
    reg [15:0] x_reg = 16'o0;
    reg [15:0] y_reg = 16'o0;
    reg [15:0] u_reg = 16'o0;
    
    // JTAG control wires
    wire step;
    wire step_type;
    
    // CONTROL register bits
    assign MSTP   = cntrl_reg[0]; // Bit 0 = MSTP
    assign MSTRT  = cntrl_reg[1]; // Bit 1 = MSTRT
    assign step   = cntrl_reg[2]; // Bit 2 = Single-step
    assign step_type = cntrl_reg[3]; // Bit 3 = Step type
    assign NHALGA = cntrl_reg[8]; // Bit 8 = NHALGA
    

    // Virtual JTAG implementation
    wire tck, tdi;
    reg tdo = 0;
    wire [4:0] ir_in;
    wire cdr, sdr, e1dr;
    vjtag VJTAG ( 
        .tdi                (tdi),
        .tdo                (tdo),
        .ir_in              (ir_in),
        .virtual_state_cdr  (cdr),
        .virtual_state_sdr  (sdr),
        .virtual_state_e1dr (e1dr),
        .tck                (tck)
    );
    
    always @(posedge SIM_CLK) begin
        // Latch completed words into their target registers
        if (e1dr) begin
            case (ir_in)
                `CONTROL: begin
                              cntrl_reg <= tmp_reg;
                          end
            endcase
        end else begin
            // Internal state logic
            if (step) begin
                // Instruction steps end on MNISQ. MCT steps end on MT01.
                if ((MT01 && step_type == `STEP_MCT) || (MNISQ && step_type == `STEP_INST)) begin
                    cntrl_reg[2] <= 0;
                    cntrl_reg[0] <= 1;
                end else begin
                    // Suppress MSTP while stepping
                    cntrl_reg[0] <= 0;
                end
            end
        end
        
        if (MWAG) begin
            a_reg <= write_bus;
        end
        if (MWLG) begin
            l_reg <= write_bus;
        end
        if (MWQG) begin
            q_reg <= write_bus;
        end
        if (MWZG) begin
            z_reg <= write_bus;
        end
        if (MWBBEG) begin
            bb_reg[14] <= write_bus[15];
            bb_reg[13:10] <= write_bus[13:10];
            bb_reg[2:0] <= write_bus[2:0];
        end
        if (MWEBG) begin
            bb_reg[2:0] <= write_bus[10:8];
        end
        if (MWFBG) begin
            bb_reg[14] <= write_bus[15];
            bb_reg[13:10] <= write_bus[13:10];
        end
        if (MWG) begin
            g_reg <= write_bus;
        end
        if (MWSG) begin
            s_reg[11:0] <= write_bus[11:0];
        end
        if (MWBG) begin
            b_reg <= write_bus;
        end
        if (MWCH && s_reg == 16'o7) begin
            bb_reg[6:4] = write_bus[6:4];
        end
    end
    
    // During SDR, shift into either the temporary shift register or the bypass register, depending on whether
    // or not a real instruction has been selected. During CDR, copy the current register value into the
    // temporary register to prepare for shifting it out.
    always @(posedge tck) begin
        if (ir_in == `BYPASS) begin
            bypass_reg <= tdi;
        end else begin
            if (cdr) begin
                case (ir_in)
                    `CONTROL: tmp_reg <= cntrl_reg;
                    `REG_A:   tmp_reg <= a_reg;
                    `REG_L:   tmp_reg <= l_reg;
                    `REG_Q:   tmp_reg <= q_reg;
                    `REG_Z:   tmp_reg <= z_reg;
                    `REG_BB:  tmp_reg <= bb_reg;
                    `REG_G:   tmp_reg <= g_reg;
                    `REG_SQ:  tmp_reg <= direct_sq;
                    `REG_S:   tmp_reg <= s_reg;
                    `REG_B:   tmp_reg <= b_reg;
                endcase
            end else if (sdr) begin
                tmp_reg <= {tdi, tmp_reg[15:1]};
            end
        end
    end
    
    // Shift out previously prepared data, or the bypass reg if not hitting a real register
    always @(tmp_reg[0] or bypass_reg) begin
        if (ir_in == `BYPASS) begin
            tdo <= bypass_reg;
        end else begin
            tdo <= tmp_reg[0];
        end
    end
    
endmodule