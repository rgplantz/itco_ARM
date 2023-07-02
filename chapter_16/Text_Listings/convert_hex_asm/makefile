# Build convert_hex program

objects = convert_hex.o hex_to_int.o write_str.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

convert_hex: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_hex

