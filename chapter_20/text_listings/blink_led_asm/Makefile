# Makefile for blink_led program

OBJECTS = blink_led.o gpio_line_to_output.o gpio_line_set.o gpio_line_clr.o write_str.o
CFLAGS = -g -Wall
AS = as
ASFLAGS = --gstabs
CC = gcc

blink_led: $(OBJECTS)

.PHONY: clean allclean
clean:
	rm -f $(OBJECTS)
allclean: clean
	rm blink_led
