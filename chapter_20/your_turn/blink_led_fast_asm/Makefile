# Makefile for blink_led_fast program

OBJECTS = blink_led_fast.o gpio_map_memory.o gpio_pin_function.o gpio_pin_set.o gpio_pin_clr.o gpio_unmap_memory.o write_str.o
CFLAGS = -g -Wall
AS = as
ASFLAGS = --gstabs
CC = gcc

blink_led_fast: $(OBJECTS)

.PHONY: clean allclean
clean:
	rm -f $(OBJECTS)
allclean: clean
	rm blink_led_fast
