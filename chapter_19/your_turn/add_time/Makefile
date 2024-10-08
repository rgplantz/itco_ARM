# Build add_time program

objects = add_time.o get_time.o display_time.o put_uint.o get_uint.o dec_to_uint.o uint_to_dec.o write_str.o write_char.o read_str.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

add_time: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_time
