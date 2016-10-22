import socket
import Adafruit_BBIO.GPIO as GPIO
import binascii
import errno
import time
import argparse

DEFAULT_TCP_IP = '192.168.7.2'
DEFAULT_TCP_PORT = 19697

OUTPUTS = {
    # Net        Pin    DE-0 Nano Pin
    'MAINRS' : 'P8_7',  # GPIO_02 
    'MKEY1'  : 'P8_8',  # GPIO_03 
    'MKEY2'  : 'P8_9',  # GPIO_04
    'MKEY3'  : 'P8_10', # GPIO_05 
    'MKEY4'  : 'P8_11', # GPIO_06 
    'MKEY5'  : 'P8_12', # GPIO_07 
    'SBYBUT' : 'P9_21', # GPIO_123
    'CAURST' : 'P9_22', # GPIO_122
}

INPUTS = {
    # Net        Pin    DE-0 Nano Pin
    'RLYB01' : 'P8_31', # GPIO_08
    'RLYB02' : 'P8_32', # GPIO_09 
    'RLYB03' : 'P8_33', # GPIO_010 
    'RLYB04' : 'P8_34', # GPIO_011 
    'RLYB05' : 'P8_35', # GPIO_012 
    'RLYB06' : 'P8_36', # GPIO_013 
    'RLYB07' : 'P8_37', # GPIO_014 
    'RLYB08' : 'P8_38', # GPIO_015 
    'RLYB09' : 'P8_39', # GPIO_016 
    'RLYB10' : 'P8_40', # GPIO_017 
    'RLYB11' : 'P8_41', # GPIO_018 
    'RYWD12' : 'P8_42', # GPIO_019
    'RYWD13' : 'P8_43', # GPIO_020
    'RYWD14' : 'P8_44', # GPIO_021
    'RYWD16' : 'P8_45', # GPIO_022
    'VNFLSH' : 'P9_23', # GPIO_121
    'COMACT' : 'P9_24', # GPIO_120
    'UPLACT' : 'P9_25', # GPIO_119
    'TMPCAU' : 'P9_26', # GPIO_118
    'KYRLS'  : 'P9_27', # GPIO_117
    'OPEROR' : 'P9_28', # GPIO_116
    'RESTRT' : 'P9_29', # GPIO_115
    'SBYLIT' : 'P9_30', # GPIO_114
}

RELAYWORD_NETS = ['RLYB%02u' % (i+1) for i in range(11)] + ['RYWD%u' % i for i in [12, 13, 14, 16]]

CH163_BITS = {
    'KYRLS'  : 0o00020,
    'VNFLSH' : 0o00040,
    'OPEROR' : 0o00100,
    'RESTRT' : 0o00200,
    'SBYLIT' : 0o00400,
}

CH11_BITS = {
    'COMACT' : 0o00002,
    'UPLACT' : 0o00004,
    'TMPCAU' : 0o00010,
}

keydown_time = 0
pressed_key = False
relayword_time = 0
relays_latching = False

def configure_gpio():
    # Configure outputs
    for _, pin in OUTPUTS.items():
        GPIO.setup(pin, GPIO.OUT)
        GPIO.output(pin, GPIO.LOW)

    # Assert MAINRS by default
    GPIO.output(OUTPUTS['MAINRS'], GPIO.HIGH)

    # Configure inputs
    for _,pin in INPUTS.items():
        GPIO.setup(pin, GPIO.IN)
        GPIO.add_event_detect(pin, GPIO.BOTH)

def parse_io_packet(p):
    p0 = ord(p[0])
    p1 = ord(p[1])
    p2 = ord(p[2])
    p3 = ord(p[3])

    if (0x00 != (0xc0 & p0)) or (0x40 != (0xc0 & p1)) or (0x80 != (0xc0 & p2)) or (0xc0 != (0xc0 & p3)):
        raise RuntimeError('Got malformed packet ' + binascii.hexlify(p))

    channel = ((p0 & 0x1F) << 3) | ((p1 >> 3) & 7);
    value = ((p1 << 12) & 0x7000) | ((p2 << 6) & 0x0FC0) | (p3 & 0x003F);
    ubit = (0x20 & p0);
    return (channel, value, ubit)

def send_io_packet(conn, ch, val):
    p = chr(ch >> 3) + chr(0x40 | ((ch << 3) & 0x38) | ((val >> 12) & 0x07)) + \
        chr(0x80 | ((val >> 6) & 0x3F)) + chr(0xc0 | (val & 0x3F))
    conn.send(p)

def assert_dsky_key(k):
    # Deassert MAINRS
    GPIO.output(OUTPUTS['MAINRS'], GPIO.LOW)

    for i in xrange(5):
        GPIO.output(OUTPUTS['MKEY%u' % (i+1)], GPIO.HIGH if k & (1<<i) else GPIO.LOW)

    # Handle RSET's associated discrete
    if k == 0b10010:
        GPIO.output(OUTPUTS['CAURST'], GPIO.HIGH)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='A simple server to interface GPIO to yaDSKY2')
    parser.add_argument('-i', dest='ip', default=DEFAULT_TCP_IP, help='DSKY Server IP')
    parser.add_argument('-p', dest='port', default=DEFAULT_TCP_PORT, help='DSKY Server Port')
    args = parser.parse_args()

    configure_gpio()

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((args.ip, args.port))
    s.listen(1)

    while True:
        conn, addr = s.accept()
        conn.setblocking(0)
        print 'Received yaDSKY connection from :', addr

        while True:
            # Service the network socket and apply any button presses
            try:
                msg = conn.recv(4)
            except socket.error, e:
                err = e.args[0]
                if err != errno.EAGAIN and err != errno.EWOULDBLOCK:
                    print e
                    break
            else:
                if not msg:
                    # Connection's been closed, wait for another
                    print 'yaDSKY disconnected'
                    break

                ch, val, ubit = parse_io_packet(msg)

                if not ubit:
                    if ch == 0o15:
                        # Handle button presses
                        if not pressed_key:
                            pressed_key = True
                            keydown_time = time.time()

                            assert_dsky_key(val)
                            print 'pressed %u' % val
                        else:
                            print 'ERROR: key already down'
                    elif ch == 0o32:
                        # Handle PROCEED presses and releases
                        GPIO.output(OUTPUTS['SBYBUT'], GPIO.LOW if val else GPIO.HIGH)

            # Handle timeout for button presses
            if pressed_key and time.time() >= (keydown_time + 0.1):
                # Deassert all of the key lines
                for i in xrange(5):
                    GPIO.output(OUTPUTS['MKEY%u' % (i+1)], GPIO.LOW)

                # Deassert RSET's line
                GPIO.output(OUTPUTS['CAURST'], GPIO.LOW)

                # Assert MAINRS
                GPIO.output(OUTPUTS['MAINRS'], GPIO.HIGH)
                pressed_key = False

            # Handle relay words
            relayword_changed = False
            for net in RELAYWORD_NETS:
                if GPIO.event_detected(INPUTS[net]):
                    relayword_changed = True

            if relayword_changed:
                relayword_time = time.time()
                relays_latching = True

            if relays_latching and time.time() >= (relayword_time + 0.005):
                relays_latching = False
                relayword = 0
                for i,net in enumerate(RELAYWORD_NETS):
                    if GPIO.input(INPUTS[net]):
                        relayword |= (1 << i)

                send_io_packet(conn, 0o10, relayword)

                rywd = relayword >> 11
                seg1 = relayword & 0x1f
                seg2 = (relayword >> 5) & 0x1f
                print rywd, bin(seg1), bin(seg2)

            # Handle false channel 163 (V/N Flash, Restart, Standby, Key Rel, Oper Err)
            ch163_changed = False
            for net in CH163_BITS:
                if GPIO.event_detected(INPUTS[net]):
                    ch163_changed = True

            if ch163_changed:
                val = 0
                for net in CH163_BITS:
                    if GPIO.input(INPUTS[net]):
                        val |= CH163_BITS[net]

                send_io_packet(conn, 0o163, val)

            # Handle channel 11 warning lights not covered in channel 163
            ch11_changed = False
            for net in CH11_BITS:
                if GPIO.event_detected(INPUTS[net]):
                    ch11_changed = True

            if ch11_changed:
                val = 0
                for net in CH11_BITS:
                    if GPIO.input(INPUTS[net]):
                        val |= CH11_BITS[net]

                send_io_packet(conn, 0o11, val)

            time.sleep(0.0005)
