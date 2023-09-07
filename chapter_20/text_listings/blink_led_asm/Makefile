# Makefile for blink_led program

OBJECTS = blink_led.o gpio_map_memory.o gpio_pin_function.o gpio_clr_pin.o gpio_set_pin.o gpio_unmap_memory.o write_str.o
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
