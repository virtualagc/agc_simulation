`timescale 1ns/1ps
`default_nettype none

`define BYPASS  5'o00
`define CONTROL 5'o02
`define BRKBANK 5'o03
`define BRKADDR 5'o04
`define RWBANK  5'o05
`define RWADDR  5'o06
`define RWCHAN  5'o07
`define RWDATA  5'o10
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

module jtag_monitor(SIM_CLK, MSTRT, MSTP, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MONPAR, MREAD, MLOAD, MRDCH, MLDCH, MTCSAI, MONWBK, MNHRPT, MNHNC, MNHSBF, MAMU, NHALGA, DBLTST, DOSCAL, MT01, MT02, MT03, MT04, MT05, MT06, MT07, MT08, MT09, MT10, MT11, MT12, MWL01, MWL02, MWL03, MWL04, MWL05, MWL06, MWL07, MWL08, MWL09, MWL10, MWL11, MWL12, MWL13, MWL14, MWL15, MWL16, MSQ16, MSQ14, MSQ13, MSQ12, MSQ11, MSQ10, MSQEXT, MST1, MST2, MST3, MNISQ, MWAG, MWLG, MWQG, MWZG, MWBBEG, MWEBG, MWFBG, MWG, MWSG, MWBG, MWCH, MRGG, MREQIN);
    input wire SIM_CLK;

    output wire MSTRT;     // Inject a Fresh Start when pulsed
    output wire MSTP;      // While asserted, the timepulse generator is stuck in timepulse 12. Allows MCT-by-MCT stepping

    output wire MDT01;  // Monitor data bus. Directly fed onto the write bus without gating.
    output wire MDT02;
    output wire MDT03;
    output wire MDT04;
    output wire MDT05;
    output wire MDT06;
    output wire MDT07;
    output wire MDT08;
    output wire MDT09;
    output wire MDT10;
    output wire MDT11;
    output wire MDT12;
    output wire MDT13;
    output wire MDT14;
    output wire MDT15;
    output wire MDT16;
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
    input wire MT02;
    input wire MT03;
    input wire MT04;
    input wire MT05;
    input wire MT06;
    input wire MT07;
    input wire MT08;
    input wire MT09;
    input wire MT10;
    input wire MT11;
    input wire MT12;
    
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
    
    input wire MST1;       // Stage registers
    input wire MST2;
    input wire MST3;
    
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
    input wire MRGG;       // Read from G register
    
    input wire MREQIN;     // Monitor sequence request has been latched
    
    wire [15:0] write_bus;
    assign write_bus = {MWL16, MWL15, MWL14, MWL13, MWL12, MWL11, MWL10, MWL09, MWL08, MWL07, MWL06, MWL05, MWL04, MWL03, MWL02, MWL01};
    wire [15:0] direct_sq;
    assign direct_sq = {MSQEXT, MSQ16, MSQ14, MSQ13, MSQ12, MSQ11, MSQ10, 9'b0};
    wire [2:0] stage;
    assign stage = {MST3, MST2, MST1};
    
    reg suppress_mstp = 1'b0;
    
    reg [15:0] monitor_data;
    assign MDT01 = monitor_data[0];
    assign MDT02 = monitor_data[1];
    assign MDT03 = monitor_data[2];
    assign MDT04 = monitor_data[3];
    assign MDT05 = monitor_data[4];
    assign MDT06 = monitor_data[5];
    assign MDT07 = monitor_data[6];
    assign MDT08 = monitor_data[7];
    assign MDT09 = monitor_data[8];
    assign MDT10 = monitor_data[9];
    assign MDT11 = monitor_data[10];
    assign MDT12 = monitor_data[11];
    assign MDT13 = monitor_data[12];
    assign MDT14 = monitor_data[13];
    assign MDT15 = monitor_data[14];
    assign MDT16 = monitor_data[15];
    
    
    // JTAG Registers
    reg bypass_reg = 0;
    reg [15:0] tmp_reg;
    reg [15:0] cntrl_reg = 16'o0;
    reg [15:0] break_bank = 16'o0;
    reg [15:0] break_addr = 16'o0;
    reg [15:0] rw_bank = 16'o0;
    reg [15:0] rw_addr = 16'o0;
    reg [15:0] rw_data = 16'o0;
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
    wire break_inst;
    wire fetch_data;
    wire store_data;
    wire read_chan;
    wire load_chan;
    
    // CONTROL register bits
    assign MSTP   = cntrl_reg[0] && !suppress_mstp; // Bit 0 = MSTP
    assign MSTRT  = cntrl_reg[1]; // Bit 1 = MSTRT
    assign step   = cntrl_reg[2]; // Bit 2 = Single-step
    assign step_type = cntrl_reg[3]; // Bit 3 = Step type
    assign break_inst = cntrl_reg[4]; // Bit 4 = Break on instruction
    assign fetch_data = cntrl_reg[5]; // Bit 5 = Fetch data at specified address
    assign store_data = cntrl_reg[6]; // Bit 6 = Store data to specified address
    assign read_chan  = cntrl_reg[7]; // Bit 7 = Read the specified channel
    assign load_chan  = cntrl_reg[8]; // Bit 8 = Load the specified channel
    assign NHALGA = cntrl_reg[10]; // Bit 10 = NHALGA

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
                              if (tmp_reg[15] == 1'b1) begin
                                  cntrl_reg[14:0] <= tmp_reg[14:0];
                              end
                          end
                `BRKBANK: begin
                              if (tmp_reg[15] == 1'b1) begin
                                  break_bank[14:0] <= tmp_reg[14:0];
                              end
                          end
                `BRKADDR: begin
                              if (tmp_reg[15] == 1'b1) begin
                                  break_addr[14:0] <= tmp_reg[14:0];
                              end
                          end
                `RWBANK: begin
                              if (tmp_reg[15] == 1'b1) begin
                                  rw_bank[14:0] <= tmp_reg[14:0];
                              end
                         end
                `RWADDR: begin
                              if (tmp_reg[15] == 1'b1) begin
                                  rw_addr[14:0] <= tmp_reg[14:0];
                              end
                         end
                `RWDATA: begin
                              // We care about all 16 bits, so RWDATA has no write bit.
                              rw_data[14:0] <= tmp_reg[14:0];
                         end
            endcase
        end else begin
            // Internal state logic
            if (step) begin
                // Instruction steps end on MNISQ. MCT steps end on MT01.
                if ((MT01 && step_type == `STEP_MCT) || (MNISQ && step_type == `STEP_INST)) begin
                    cntrl_reg[2] <= 0;
                    suppress_mstp <= 0;
                end else begin
                    // Suppress MSTP while stepping
                    suppress_mstp <= 1;
                end
            end
        end
        
        // Update registers
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
        if (MWG || MRGG) begin
            g_reg <= write_bus;
        end
        if (MWSG) begin
            s_reg[11:0] <= write_bus[11:0];
        end
        if (MWBG) begin
            b_reg <= write_bus;
        end
        if (MWCH && s_reg[8:0] == 9'o7) begin
            bb_reg[6:4] <= write_bus[6:4];
        end
        
        // Check breakpoints. Breakpoints in switched-erasable not yet supported.
        if (break_inst && MNISQ && s_reg[11:0] == break_addr[11:0] && // S should always completely match what was requested
                                  (s_reg[11:10] != 2'b01 || (s_reg[11:10] == 2'b01 &&  // If S is in the 2000..3777 range, our fixed bank must match
                                    (bb_reg[14:13] == 2'b11 && bb_reg[14:4] == break_bank[14:4]) || // If the fixed bank is in the 30..37 range, the FEB applies
                                    (bb_reg[14:13] != 2'b11 && bb_reg[14:10] == break_bank[14:10]))))  begin // Otherwise only use the FB bits
            // We just loaded the breakpointed instruction. Issue MSTP.
            cntrl_reg[0] <= 1;
        end
        
        // Handle STORE/FETCH sequences
        if (fetch_data || store_data) begin
            if (!MREQIN) begin
                // Allow progression until our request is latched and T01 of the sequence starts
                if (fetch_data) MREAD <= 1'b1;
                else MLOAD <= 1'b1;
                suppress_mstp <= 1'b1;
            end else begin
                if (stage == 3'o0) begin
                    if (MT01) begin
                        MREAD <= 1'b0;
                        MLOAD <= 1'b0;
                    end else if (MT04) begin
                        monitor_data[15] <= rw_bank[14];
                        monitor_data[13:0] <= rw_bank[13:0];
                    end else if (MT05) begin
                        monitor_data <= 16'o0;
                    end else if (MT08) begin
                        monitor_data <= rw_addr;
                    end else if (MT09) begin
                        monitor_data <= 16'o0;
                    end
                end else if (stage == 3'o1) begin
                    if (MT04 && store_data) begin
                        monitor_data <= rw_data;
                    end else if (MT05) begin
                        monitor_data <= 16'b0;
                    end else if (MT07 && fetch_data) begin
                        rw_data <= write_bus;
                    end else if (MT09 && store_data) begin
                        monitor_data <= rw_data;
                    end else if (MT10) begin
                        monitor_data <= 16'b0;
                        bb_reg[14] <= write_bus[15];
                        bb_reg[13:10] <= write_bus[13:10];
                        bb_reg[2:0] <= write_bus[2:0];
                    end else if (MT11) begin
                        if (fetch_data) cntrl_reg[5] <= 1'b0;
                        else cntrl_reg[6] <= 1'b0;
                        suppress_mstp <= 1'b0;
                    end
                end
            end
        end

        // Handle INOTLD/INOTRD sequences
        if (read_chan || load_chan) begin
            if (!MREQIN) begin
                // Allow progression until our request is latched and T01 of the sequence starts
                if (read_chan) MRDCH <= 1'b1;
                else MLDCH <= 1'b1;
                suppress_mstp <= 1'b1;
           end else begin
                if (MT01) begin
                    MRDCH <= 1'b0;
                    MLDCH <= 1'b0;
                    monitor_data <= rw_addr;
                end else if (MT05 && read_chan) begin
                    rw_data <= write_bus;
                end else if (MT07 && load_chan) begin
                    monitor_data <= rw_data;
                end else if (MT11) begin
                    if (read_chan) cntrl_reg[7] <= 1'b0;
                    else cntrl_reg[8] <= 1'b0;
                    suppress_mstp <= 1'b0;
                end else begin
                    monitor_data <= 16'o0;
                end
           end
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
                    `BRKBANK: tmp_reg <= break_bank;
                    `BRKADDR: tmp_reg <= break_addr;
                    `RWBANK:  tmp_reg <= rw_bank;
                    `RWADDR:  tmp_reg <= rw_addr;
                    `RWDATA:  tmp_reg <= rw_data;
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
