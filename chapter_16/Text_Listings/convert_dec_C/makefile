# Build convert_dec program

objects = convert_dec.o dec_to_int.o write_str.o read_str.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

convert_dec: $(objects)
convert_dec.o: dec_to_int.h write_str.h read_str.h
dec_to_int.o: dec_to_int.h

convert_dec.s: convert_dec.c dec_to_int.h write_str.h read_str.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

dec_to_int.s: dec_to_int.c dec_to_int.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_dec

