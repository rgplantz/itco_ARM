# Blinks LED connected to GPIO pin 17
from gpiozero import LED
from time import sleep

led = LED(17)

for _ in range(5):
  print("led on")
  led.on()
  sleep(3)
  print("led off")
  led.off()
  sleep(3)
