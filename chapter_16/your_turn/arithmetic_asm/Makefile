# Build arithmetic program

objects = arithmetic.o sum.o difference.o product.o quotient.o remainder.o put_int.o get_int.o dec_to_int.o int_to_dec.o write_str.o write_char.o read_str.o
ASFLAGS = --gstabs
AS = as
CC = gcc

arithmetic: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm arithmetic
