# Makefile for blink_led program on Raspberry Pi 5

OBJECTS = blink_5_led.o gpio_5_line_to_output.o gpio_5_line_set.o gpio_5_line_clr.o write_str.o
CFLAGS = -g -Wall
AS = as
ASFLAGS = --gstabs
CC = gcc

blink_5_led: $(OBJECTS)

.PHONY: clean allclean
clean:
	rm -f $(OBJECTS)
allclean: clean
	rm blink_5_led
