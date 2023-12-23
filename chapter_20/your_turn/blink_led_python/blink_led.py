# Blinks LED connected to GPIO pin 17
import pigpio
from time import sleep
PIN = 17
ON = 1
OFF = 0
BLINKS = 5
SECONDS = 3

led = pigpio.pi()
led.set_mode(PIN, pigpio.OUTPUT)

for _ in range(BLINKS):
    print("led on...")
    led.write(PIN, ON)
    sleep(SECONDS)
    print("...led off")
    led.write(PIN, OFF)
    sleep(SECONDS)
