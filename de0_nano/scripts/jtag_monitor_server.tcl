global usb_blaster
global device

set INDEX 2
set WRITE 0x8000

set REG_CNTRL 002
set REG_BRKBANK 003
set REG_BRKADDR 004
set REG_RWBANK  005
set REG_RWADDR  006
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
set CNTRL_RDCH  0x0080
set CNTRL_LDCH  0x0100

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

proc process_addr {sbank saddr} {
    set addr [expr 0$saddr]
    set fbank 0
    set ebank 0
    set feb 0
    
    if {[string index $sbank 0] == "E"} {
        set ebank [expr 0[string range $sbank 1 end]]
        if {$ebank > 07} {
            error "Erasable bank too large!"
        }
        
        if {$ebank != 0 && ($addr < 01400 || $addr > 01777)} {
            error "Address is unswitched-erasable or fixed, but got nonzero bank"
        }
    } else {
        set fbank [expr 0$sbank]
        if {$fbank > 043} {
            error "Bank too large!"
        } elseif {$fbank >= 040} {
            set feb 0100
            set fbank [expr {$fbank - 010}]
        }
        
        if {$fbank != 0 && ($addr < 02000 || $addr > 03777)} {
            error "Address is fixed-fixed or erasable, but got nonzero bank"
        }
    }
  
    set bb [expr {($fbank << 10) | $feb | $ebank}]
    
    return [list $bb $addr]
}

proc process_chan {schan} {
    set chan [expr 0$schan]
    if {$chan > 0777} {
        error "Channel is larger than 777"
    }
    return $chan
}

proc breakpoint {sargs} {
    global WRITE
    global REG_CNTRL
    global REG_BRKBANK
    global REG_BRKADDR
    global CNTRL_BRKINST
    
    set nargs [llength $sargs]

    if {$nargs == 2} {
        set sbank [lindex $sargs 0]
        set saddr [lindex $sargs 1]
    } elseif {$nargs == 1} {
        set sbank "0"
        set saddr [lindex $sargs 0]
    } elseif {$nargs == 0} {
        # Disable instruction breakpointing
        set cntrl_reg [exchange_register $REG_CNTRL 0]
        set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_BRKINST & 0x7FFF))}]
        exchange_register $REG_CNTRL $cntrl_reg
        
        return A
    } else {
        return N
    }

    if {[catch {process_addr $sbank $saddr} faddr]} {
        return N
    } 
    
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
    
    return A
}

proc fetch {sargs} {
    global WRITE
    global REG_CNTRL
    global REG_RWBANK
    global REG_RWADDR
    global REG_RWDATA
    global CNTRL_FETCH
    
    set nargs [llength $sargs]
    if {$nargs == 2} {
        set sbank [lindex $sargs 0]
        set saddr [lindex $sargs 1]
    } elseif {$nargs == 1} {
        set sbank "0"
        set saddr [lindex $sargs 0]
    } else {
        return N
    }
    if {[catch {process_addr $sbank $saddr} faddr]} {
        return N
    }
    
    set bb [lindex $faddr 0]
    set addr [lindex $faddr 1]
    if {[expr $bb & 060000] == 060000} {
        set old_fext [readch [list "7"]]
        loadch [list "7" [format %03o [expr $bb & 0100]]]
    }
    exchange_register $REG_RWBANK [expr {$WRITE | $bb}]
    exchange_register $REG_RWADDR [expr {$WRITE | $addr}]
    
    set cntrl_reg [exchange_register $REG_CNTRL 0]
    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_FETCH}]
    exchange_register $REG_CNTRL $cntrl_reg
    while {[expr {$cntrl_reg & $CNTRL_FETCH}] != 0} {
        set cntrl_reg [exchange_register $REG_CNTRL 0]
    }
    
    set data [exchange_register $REG_RWDATA 0]
    
    if {[expr $bb & 060000] == 060000} {
        loadch [list "7" $old_fext]
    }

    return [format %06o $data]
}

proc store {sargs} {
    global WRITE
    global REG_CNTRL
    global REG_RWBANK
    global REG_RWADDR
    global REG_RWDATA
    global CNTRL_STORE
    
    set nargs [llength $sargs]
    if {$nargs == 3} {
        set sbank [lindex $sargs 0]
        set saddr [lindex $sargs 1]
        set sdata [lindex $sargs 2]
    } elseif {$nargs == 2} {
        set sbank "0"
        set saddr [lindex $sargs 0]
        set sdata [lindex $sargs 1]
    }
    
    set data [expr 0$sdata]
    if {[catch {process_addr $sbank $saddr} faddr]} {
        return N
    }
    
    exchange_register $REG_RWBANK [expr {$WRITE | [lindex $faddr 0]}]
    exchange_register $REG_RWADDR [expr {$WRITE | [lindex $faddr 1]}]
    exchange_register $REG_RWDATA $data
    
    set cntrl_reg [exchange_register $REG_CNTRL 0]
    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STORE}]
    exchange_register $REG_CNTRL $cntrl_reg
    while {[expr {$cntrl_reg & $CNTRL_STORE}] != 0} {
        set cntrl_reg [exchange_register $REG_CNTRL 0]
    }

    return A
}

proc readch {sargs} {
    global WRITE
    global REG_CNTRL
    global REG_RWADDR
    global REG_RWDATA
    global CNTRL_RDCH

    set nargs [llength $sargs]
    if {$nargs != 1} {
        return N
    }
    
    set schan [lindex $sargs 0]
    if {[catch {process_chan $schan} chan]} {
        return N
    }
    
    exchange_register $REG_RWADDR [expr {$WRITE | $chan}]
    
    set cntrl_reg [exchange_register $REG_CNTRL 0]
    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_RDCH}]
    exchange_register $REG_CNTRL $cntrl_reg
    while {[expr {$cntrl_reg & $CNTRL_RDCH}] != 0} {
        set cntrl_reg [exchange_register $REG_CNTRL 0]
    }
    
    set data [exchange_register $REG_RWDATA 0]

    return [format %06o $data]
}

proc loadch {sargs} {
    global WRITE
    global REG_CNTRL
    global REG_RWADDR
    global REG_RWDATA
    global CNTRL_LDCH

    set nargs [llength $sargs]
    if {$nargs != 2} {
        return N
    }
    
    set schan [lindex $sargs 0]
    set sdata [lindex $sargs 1]
    set data [expr 0$sdata]
    if {[catch {process_chan $schan} chan]} {
        return N
    }
    
    exchange_register $REG_RWADDR [expr {$WRITE | $chan}]
    exchange_register $REG_RWDATA [expr {$WRITE | $data}]
    
    set cntrl_reg [exchange_register $REG_CNTRL 0]
    set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_LDCH}]
    exchange_register $REG_CNTRL $cntrl_reg
    while {[expr {$cntrl_reg & $CNTRL_LDCH}] != 0} {
        set cntrl_reg [exchange_register $REG_CNTRL 0]
    }

    return A
}


proc accept {sock addr port} {
    global REG_CNTRL
    global conn
    puts "Received connection from $addr:$port"
    set conn(addr,$sock) [list $addr $port]
    
    exchange_register $REG_CNTRL 0x8400
    
    fconfigure $sock -buffering line
    fileevent $sock readable [list handle_packet $sock]
}

proc handle_packet {sock} {
    if {[eof $sock] || [catch {gets $sock line}]} {
        close $sock
        puts "Connection closed."
        unset conn(addr,$sock)
    } else {
        set words [regexp -inline -all -- {[^ ,]+} $line]
        set num_words [llength $words]
        if {$num_words < 1} {
            puts $sock N
        } else {
            set cmd [lindex $words 0]
            set sargs [lrange $words 1 end]

            set return_val [process_command $cmd $sargs]
            puts $sock $return_val
        }
    }
}
proc process_command {cmd sargs} {
    global conn
    global WRITE
    global CNTRL_STOP
    global CNTRL_STEP
    global CNTRL_INST
    global REG_CNTRL
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

    switch $cmd {
        stop {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STOP}]
            exchange_register $REG_CNTRL $cntrl_reg
            return A
        }
        cont {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_STOP & 0x7FFF))}]
            exchange_register $REG_CNTRL $cntrl_reg
            return A
        }
        step {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_STEP}]
            exchange_register $REG_CNTRL $cntrl_reg
            return A
        }
        inst {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | $cntrl_reg | $CNTRL_INST}]
            exchange_register $REG_CNTRL $cntrl_reg
            return A
        }
        mct {
            set cntrl_reg [exchange_register $REG_CNTRL 0]
            set cntrl_reg [expr {$WRITE | ($cntrl_reg & (~$CNTRL_INST & 0x7FFF))}]
            exchange_register $REG_CNTRL $cntrl_reg
            return A
        }
        a {
            set a_val [exchange_register $REG_A 0]
            return [format %06o $a_val]
        }
        l {
            set l_val [exchange_register $REG_L 0]
            return [format %06o $l_val]
        }
        q {
            set q_val [exchange_register $REG_Q 0]
            return [format %06o $q_val]
        }
        z {
            set z_val [exchange_register $REG_Z 0]
            return [format %06o $z_val]
        }
        bb {
            set bb_val [exchange_register $REG_BB 0]
            return [format %06o $bb_val]
        }
        g {
            set g_val [exchange_register $REG_G 0]
            return [format %06o $g_val]
        }
        sq {
            set sq_val [exchange_register $REG_SQ 0]
            return [format %06o $sq_val]
        }
        s {
            set s_val [exchange_register $REG_S 0]
            return [format %06o $s_val]
        }
        b {
            set b_val [exchange_register $REG_B 0]
            return [format %06o $b_val]
        }
        "break" {
            return [breakpoint $sargs]
        }
        fetch {
            return [fetch $sargs]
        }
        store {
            return [store $sargs]
        }
        readch {
            return [readch $sargs]
        }
        loadch {
            return [loadch $sargs]
        } 
        default {
           return N
        }
    }
}

set port 63214
puts "Starting server on port $port"
socket -server accept $port

vwait forever

device_unlock
close_device
