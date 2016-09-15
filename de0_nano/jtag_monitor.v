`timescale 1ns/1ps
`default_nettype none

module jtag_monitor(MSTRT, MSTP, MDT01, MDT02, MDT03, MDT04, MDT05, MDT06, MDT07, MDT08, MDT09, MDT10, MDT11, MDT12, MDT13, MDT14, MDT15, MDT16, MONPAR, MREAD, MLOAD, MRDCH, MLDCH, MTCSAI, MONWBK, MNHRPT, MNHNC, MNHSBF, MAMU, NHALGA, DBLTST, DOSCAL);
    output reg MSTRT = 0;  // Inject a Fresh Start when pulsed
    output reg MSTP = 0;   // While asserted, the timepulse generator is stuck in timepulse 12. Allows MCT-by-MCT stepping

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
    output reg NHALGA = 0; // Inhibits alarm gate alarms while asserted

    output reg DBLTST = 0; // Tests the scaler double alarm, probably making use of MON800
    output reg DOSCAL = 0; // Tests the scaler fail alarm by inhibiting SCAS17
endmodule
