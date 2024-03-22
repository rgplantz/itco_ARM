# Makefile for blink_led program

OBJECTS = blink_led.o gpio_map.o gpio_pin_function.o gpio_pin_set.o gpio_pin_clr.o gpio_unmap.o write_str.o
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
