global usb_blaster
global device
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

proc accept {sock addr port} {
    global conn
    puts "Received connection from $addr:$port"
    set conn(addr,$sock) [list $addr $port]
    
    fconfigure $sock -buffering line
    fileevent $sock readable [list process_command $sock]
}

set last_val 0

proc process_command {sock} {
    global conn
    global last_val
    if {[eof $sock] || [catch {gets $sock line}]} {
        close $sock
        puts "Connection closed."
        unset conn(addr,$sock)
    } else {
        set data_len [string length $line]
        if {$data_len != 0} {
            set last_val [expr {!$last_val}]
            set cmd_val [format %04X $last_val]
            puts "Writing CNTRL = $cmd_val"
            device_lock -timeout 10000
            device_virtual_ir_shift -instance_index 2 -ir_value 2 -no_captured_ir_value
            set read_val [device_virtual_dr_shift -dr_value $cmd_val -instance_index 2  -length 16 -value_in_hex]
            device_virtual_ir_shift -instance_index 2 -ir_value 0 -no_captured_ir_value
            device_unlock
            puts $read_val
        }
    }
}

set port 63214
puts "Starting server on port $port"
socket -server accept $port

vwait forever

device_unlock
close_device
