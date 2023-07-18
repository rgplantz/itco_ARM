# Build add_money program

objects = add_money.o get_money.o display_money.o put_int.o put_uint.o get_int.o get_uint.o dec_to_int.o int_to_dec.o dec_to_uint.o uint_to_dec.o write_str.o write_char.o read_str.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

add_money: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_money
