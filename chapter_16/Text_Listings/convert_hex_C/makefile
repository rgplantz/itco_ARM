# Build convert_hex program

objects = convert_hex.o hex_to_int.o write_str.o read_str.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

convert_hex: $(objects)
convert_hex.o: hex_to_int.h write_str.h read_str.h
hex_to_int.o: hex_to_int.h

convert_hex.s: convert_hex.c hex_to_int.h write_str.h read_str.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

hex_to_int.s: hex_to_int.c hex_to_int.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_hex

