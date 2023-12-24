# Blinks LED connected to GPIO pin 17
import pigpio
from time import sleep

led = pigpio.pi()
led.set_mode(17, pigpio.OUTPUT)

for _ in range(5):
    print("led on...")
    led.write(17, 1)
    sleep(3)
    print("...led off")
    led.write(17, 0)
    sleep(3)
