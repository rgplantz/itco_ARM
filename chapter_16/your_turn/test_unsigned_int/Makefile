# Build convert_unsigned_dec program

objects = convert_unsigned_dec.o dec_to_uint.o write_str.o read_str.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

convert_unsigned_dec: $(objects)
convert_unsigned_dec.o: dec_to_uint.h write_str.h read_str.h
dec_to_uint.o: dec_to_uint.h

convert_unsigned_dec.s: convert_unsigned_dec.c dec_to_uint.h write_str.h read_str.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

dec_to_uint.s: dec_to_uint.c dec_to_uint.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_unsigned_dec

