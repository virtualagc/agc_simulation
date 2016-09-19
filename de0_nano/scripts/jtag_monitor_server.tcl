global usb_blaster
global device

set INDEX 2
set WRITE 0x8000

set REG_CNTRL 002
set REG_BRKBANK 003
set REG_BRKADDR 004
set REG_RWBANK  005
set REG_RWADDR  006
set REG_RWCHAN  007
set REG_RWDATA  010
set REG_A     020
set REG_L     021
set REG_Q     022
set REG_Z     023
set REG_BB    024
set REG_G     025
set REG_SQ    026
set REG_S     027
set REG_B     030
set REG_X     031
set REG_Y     032
set REG_U     033

set CNTRL_STOP 0x0001
set CNTRL_STEP 0x0004
set CNTRL_INST 0x0008
set CNTRL_BRKINST 0x0010
set CNTRL_FETCH 0x0020
set CNTRL_STORE 0x0040

foreach hardware_name [get_hardware_names] {
    if {[string match "USB-Blaster*" $hardware_name]} {
        set usb_blaster $hardware_name
    }
}

foreach device_name [get_device_names -hardware_name $usb_blaster] {
    if {[string match "@1*" $device_name]} {
        set device $device_name
    }
}

puts "Opening $usb_blaster $device"
open_device -hardware_name $usb_blaster -device_name $device

proc exchange_register {reg val} {
    global INDEX
    set cmd_val [format %04X $val]
    device_lock -timeout 10000
    device_virtual_ir_shift -instance_index $INDEX -ir_value $reg -no_captured_ir_value
    set old_val [device_virtual_dr_shift -dr_value $cmd_val -instance_index $INDEX -length 16 -value_in_hex]
    device_virtual_ir_shift -instance_index $INDEX -ir_value 0 -no_captured_ir_value
    device_unlock
    
    set old_val_int [expr 0x$old_val]
    return $old_val_int
}

proc accept {sock addr port} {
    global REG_CNTRL
    global conn
    puts "Received connection from $addr:$port"
    set conn(addr,$sock) [list $addr $port]
    
    exchange_register $REG_CNTRL 0x8100
    
    fconfigure $sock -buffering line
    fileevent $sock readable [list process_command $sock]
}

proc process_addr {sbank saddr} {
    set bank [expr 0$sbank]
    set addr [expr 0$saddr]
    
    set bb 0
    if {$bank > 043} {
        error "Bank too large!"
    } elseif {$bank >= 040} {
        set bb [expr {$bb | 0100}]
        set bank [expr {$bank - 010}]
    }
    set bb [expr {$bb | ($bank << 10)}]
    if {$bank != 0 && ($addr < 02000 || $addr > 03777)} {
        error "Address is fixed-fixed or erasable, but got nonzero bank"
    }
    
    return [list $bb $addr]
}

proc process_command {sock} {
    global conn
    global WRITE
    global CNTRL_STOP
    global CNTRL_STEP
    global CNTRL_INST
    global CNTRL_BRKINST
    global CNTRL_FETCH
    global CNTRL_STORE
    global REG_CNTRL
    global REG_BRKBANK
    global REG_BRKADDR
    global REG_RWBANK
    global REG_RWADDR
    global REG_RWDATA
    global REG_A
    global REG_L
    global REG_Q
    global REG_Z
    global REG_BB
    global REG_G
    global REG_SQ
    global REG_S
    global REG_B
    global REG_X
    global REG_Y
    global REG_U
    if {[eof $sock] || [catch {gets $sock line}]} {
        close $sock
        puts "Connection closed."
        unset conn(addr,$sock)
    } else {
        if {[string equal $line "stop"]} {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STOP}]
            exchange_register $REG_CNTRL $cntrl_reg
            puts $sock A
        } elseif {[string equal $line "cont"]} {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_STOP & 0x7FFF))}]
            exchange_register $REG_CNTRL $cntrl_reg
            puts $sock A
        } elseif {[string equal $line "step"]} {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STEP}]
            exchange_register $REG_CNTRL $cntrl_reg
            puts $sock A
        } elseif {[string equal $line "inst"]} {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_INST}]
            exchange_register $REG_CNTRL $cntrl_reg
            puts $sock A
        } elseif {[string equal $line "mct"]} {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_INST & 0x7FFF))}]
            exchange_register $REG_CNTRL $cntrl_reg
            puts $sock A
        } elseif {[string equal $line "a"]} {
            set a_val [exchange_register $REG_A 0]
            puts $sock [format %06o $a_val]
        } elseif {[string equal $line "l"]} {
            set l_val [exchange_register $REG_L 0]
            puts $sock [format %06o $l_val]
        } elseif {[string equal $line "q"]} {
            set q_val [exchange_register $REG_Q 0]
            puts $sock [format %06o $q_val]
        } elseif {[string equal $line "z"]} {
            set z_val [exchange_register $REG_Z 0]
            puts $sock [format %06o $z_val]
        } elseif {[string equal $line "bb"]} {
            set bb_val [exchange_register $REG_BB 0]
            puts $sock [format %06o $bb_val]
        } elseif {[string equal $line "g"]} {
            set g_val [exchange_register $REG_G 0]
            puts $sock [format %06o $g_val]
        } elseif {[string equal $line "sq"]} {
            set sq_val [exchange_register $REG_SQ 0]
            puts $sock [format %06o $sq_val]
        } elseif {[string equal $line "s"]} {
            set s_val [exchange_register $REG_S 0]
            puts $sock [format %06o $s_val]
        } elseif {[string equal $line "b"]} {
            set b_val [exchange_register $REG_B 0]
            puts $sock [format %06o $b_val]
        } elseif {[string match "break*" $line]} {
            set words [regexp -inline -all -- {[^ ,]+} $line]
            set num_words [llength $words]
            if {$num_words >= 2 && $num_words <= 3} {
                if {$num_words == 3} {
                    set sbank [lindex $words 1]
                    set saddr [lindex $words 2]
                } else {
                    set sbank "0"
                    set saddr [lindex $words 1]
                }
                if {[catch {process_addr $sbank $saddr} faddr]} {
                    puts $sock N
                } else {
                    # Disable instruction breakpoints while we fiddle...
                    set cntrl_reg [exchange_register $REG_CNTRL 0]
                    set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_BRKINST & 0x7FFF))}]
                    exchange_register $REG_CNTRL $cntrl_reg
                    
                    # Set the break bank and address
                    exchange_register $REG_BRKBANK [expr {$WRITE | [lindex $faddr 0]}]
                    exchange_register $REG_BRKADDR [expr {$WRITE | [lindex $faddr 1]}]
                    
                    # Enable instruction breakpointing
                    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_BRKINST}]
                    exchange_register $REG_CNTRL $cntrl_reg
                    
                    puts $sock A
                }
            } elseif {$num_words == 1} {
                # Disable instruction breakpointing
                set cntrl_reg [exchange_register $REG_CNTRL 0]
                set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_BRKINST & 0x7FFF))}]
                exchange_register $REG_CNTRL $cntrl_reg
                
                puts $sock A
            } else {
                puts $sock N
            }
        } elseif {[string match "fetch*" $line]} {
            set words [regexp -inline -all -- {[^ ,]+} $line]
            set num_words [llength $words]
            if {$num_words >= 2 && $num_words <= 3} {
                if {$num_words == 3} {
                    set sbank [lindex $words 1]
                    set saddr [lindex $words 2]
                } else {
                    set sbank "0"
                    set saddr [lindex $words 1]
                }
                if {[catch {process_addr $sbank $saddr} faddr]} {
                    puts $sock N
                } else {
                    exchange_register $REG_RWBANK [expr {$WRITE | [lindex $faddr 0]}]
                    exchange_register $REG_RWADDR [expr {$WRITE | [lindex $faddr 1]}]
                    
                    # Enable instruction breakpointing
                    set cntrl_reg [exchange_register $REG_CNTRL 0]
                    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_FETCH}]
                    exchange_register $REG_CNTRL $cntrl_reg
                    while {[expr {$cntrl_reg & $CNTRL_FETCH}] != 0} {
                        set cntrl_reg [exchange_register $REG_CNTRL 0]
                    }
                    
                    set data [exchange_register $REG_RWDATA 0]

                    puts $sock [format %06o $data]
                }
            } else {
                puts $sock N
            }
        } elseif {[string match "store*" $line]} {
            set words [regexp -inline -all -- {[^ ,]+} $line]
            set num_words [llength $words]
            if {$num_words >= 3 && $num_words <= 4} {
                if {$num_words == 4} {
                    set sbank [lindex $words 1]
                    set saddr [lindex $words 2]
                    set sdata [lindex $words 3]
                } else {
                    set sbank "0"
                    set saddr [lindex $words 1]
                    set sdata [lindex $words 2]
                }
                set data [expr 0$sdata]
                if {[catch {process_addr $sbank $saddr} faddr]} {
                    puts $sock N
                } else {
                    exchange_register $REG_RWBANK [expr {$WRITE | [lindex $faddr 0]}]
                    exchange_register $REG_RWADDR [expr {$WRITE | [lindex $faddr 1]}]
                    exchange_register $REG_RWDATA $data
                    
                    # Enable instruction breakpointing
                    set cntrl_reg [exchange_register $REG_CNTRL 0]
                    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STORE}]
                    exchange_register $REG_CNTRL $cntrl_reg
                    while {[expr {$cntrl_reg & $CNTRL_STORE}] != 0} {
                        set cntrl_reg [exchange_register $REG_CNTRL 0]
                    }

                    puts $sock A
                }
            } else {
                puts $sock N
            }
        } else {
            puts $sock N
        }
    }
}

set port 63214
puts "Starting server on port $port"
socket -server accept $port

vwait forever

device_unlock
close_device
