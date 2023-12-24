# Blinks LED connected to GPIO pin 17
import pigpio
from time import sleep
PIN = 17
BLINKS = 5
SECONDS = 3

led = pigpio.pi()
led.set_mode(PIN, pigpio.OUTPUT)

for _ in range(BLINKS):
    print("led on...")
    led.write(PIN, TRUE)
    sleep(SECONDS)
    print("...led off")
    led.write(PIN, FALSE)
    sleep(SECONDS)
