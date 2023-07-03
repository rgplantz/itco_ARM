# Build sub_123 program

objects = sub_123.o int_to_dec.o dec_to_int.o write_str.o write_char.o read_str.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

sub_123: $(objects)
sub_123.o: int_to_dec.h dec_to_int.h write_str.h write_char.h read_str.h
int_to_dec.o: int_to_dec.h
dec_to_int.o: dec_to_int.h

sub_123.s: sub_123.c int_to_dec.h write_str.h write_char.h read_str.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

int_to_dec.s: int_to_dec.c int_to_dec.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sub_123
