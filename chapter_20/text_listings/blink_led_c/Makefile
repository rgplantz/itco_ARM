# Build blink_led program
# -lpigpio needs to be at end of command line

blink_led: blink_led.c
	gcc -g -Wall -o blink_led blink_led.c -lgpiod

.PHONY: allclean
allclean:
	rm blink_led
