# Build convert_hex_count program

objects = convert_hex_count.o hex_to_int.o write_str.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

convert_hex_count: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_hex_count
