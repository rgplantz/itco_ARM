# Build unsigned_int program

objects = unsigned_int.o get_uint.o put_uint.o dec_to_uint.o uint_to_dec.o write_str.o write_char.o read_str.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

unsigned_int: $(objects)
unsigned_int.o: get_uint.h put_uint.h write_str.h write_char.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm unsigned_int
