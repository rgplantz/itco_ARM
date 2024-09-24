# Build unsigned_int program

objects = signed_int.o get_int.o put_int.o dec_to_int.o int_to_dec.o write_str.o write_char.o read_str.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -g -I$(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

signed_int: $(objects)
signed_int.o: get_int.h put_int.h write_str.h write_char.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm signed_int
