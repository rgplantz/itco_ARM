# Build arithmetic program

objects = arithmetic.o sum.o difference.o product.o quotient.o put_int.o get_int.o write_str.o write_char.o read_str.o
ASFLAGS = --gstabs
AS = as
CC = gcc

arithmetic: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm arithmetic
