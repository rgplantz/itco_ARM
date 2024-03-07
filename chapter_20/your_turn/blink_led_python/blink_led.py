# Blinks LED connected to GPIO pin 17
import gpiod
import time

LED_PIN = 17
chip = gpiod.Chip('gpiochip0')
led_line = chip.get_line(LED_PIN)
led_line.request(consumer = "LED", type = gpiod.LINE_REQ_DIR_OUT)

for _ in range(5):
    print("led on")
    led_line.set_value(1)
    time.sleep(3)
    print("led off")
    led_line.set_value(0)
    time.sleep(3)
led_line.release()
