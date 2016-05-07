import socket
import Adafruit_BBIO.GPIO as GPIO
import binascii
import errno
import time
import argparse

DEFAULT_TCP_IP = '127.0.0.1'
DEFAULT_TCP_PORT = 6547

keydown_time = 0
pressed_key = False
relayword_time = 0
relays_latching = False

def configure_gpio():
    # Configure key lines
    for pin in ['P8_%u' % n for n in range(7,13)]:
        GPIO.setup(pin, GPIO.OUT)
        GPIO.output(pin, GPIO.LOW)

    # Assert MAINRS
    GPIO.output('P8_7', GPIO.HIGH)

    # Configure relay word
    for pin in ['P8_%u' % n for n in range(31, 46)]:
        GPIO.setup(pin, GPIO.IN)
        GPIO.add_event_detect(pin, GPIO.BOTH)

    # Configure PROCEED
    GPIO.setup('P9_21', GPIO.OUT)
    GPIO.output('P9_21', GPIO.LOW)

    # Configure CAUTION RESET
    GPIO.setup('P9_22', GPIO.OUT)
    GPIO.output('P9_22', GPIO.LOW)

    # Configure other lights and inputs
    for pin in ['P9_%u' % n for n in range(23, 31)]:
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
    GPIO.output('P8_7', GPIO.LOW)

    for i in xrange(5):
        if k & (1<<i):
            GPIO.output("P8_%u" % (8+i), GPIO.HIGH)
        else:
            GPIO.output("P8_%u" % (8+i), GPIO.LOW)

    # Handle RSET's associated discrete
    if k == 0b11001:
        GPIO.output("P9_22", GPIO.HIGH)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="A simple server to interface GPIO to yaDSKY2")
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
                    if ch == 13:
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
                        if val:
                            GPIO.output('P9_21', GPIO.HIGH)
                        else:
                            GPIO.output('P9_21', GPIO.LOW)


            # Handle timeout for button presses
            if pressed_key and time.time() >= (keydown_time + 0.1):
                # Deassert all of the key lines
                for i in xrange(5):
                    GPIO.output('P8_%u' % (8+i), GPIO.LOW)

                GPIO.output("P9_22", GPIO.LOW)

                # Assert MAINRS
                GPIO.output('P8_7', GPIO.HIGH)
                pressed_key = False

            # Handle relay words
            relayword_changed = False
            for pin in ['P8_%u' % n for n in range(31, 46)]:
                if GPIO.event_detected(pin):
                    relayword_changed = True

            if relayword_changed:
                relayword_time = time.time()
                relays_latching = True

            if relays_latching and time.time() >= (relayword_time + 0.005):
                relays_latching = False
                relayword = 0
                for i in xrange(15):
                    if GPIO.input('P8_%u' % (i+31)):
                        relayword |= (1 << i)


                send_io_packet(conn, 0o10, relayword)

                rywd = relayword >> 11
                seg1 = relayword & 0x1f
                seg2 = (relayword >> 5) & 0x1f
                print rywd, bin(seg1), bin(seg2)

            # Handle V/N flash and hardware warning lights
            ch42_changed = False
            for pin in ['P9_%u' % n for n in [23, 29, 30]]:
                if GPIO.event_detected(pin):
                    ch42_changed = True

            if ch42_changed:
                val = 0
                pins = [23, 29, 30]
                for i,pin in enumerate(pins):
                    if GPIO.input('P9_%u' % pin):
                        val |= (1 << i)

                send_io_packet(conn, 0o42, val)

            # Handle channel 11 warning lights
            ch11_changed = False
            for pin in ['P9_%u' % n for n in range(24, 29)]:
                if GPIO.event_detected(pin):
                    ch11_changed = True

            if ch11_changed:
                val = 0
                for i in xrange(4):
                    if GPIO.input('P9_%u' % (i+24)):
                        val |= (1 << (i+1))
                if GPIO.input('P9_%u' % 28):
                    val |= (1 << 6)

                send_io_packet(conn, 0o11, val)
                print 'Status light bits:', bin(val)

            time.sleep(0.0005)
