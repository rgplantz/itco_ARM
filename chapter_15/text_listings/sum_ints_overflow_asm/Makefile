# Build sum_ints_overflow program

objects = sum_ints_overflow.o add_two_overflow.o

ASFLAGS = --gstabs
AS = as
CFLAGS = -g -Wall -O0
CC = gcc

sum_ints_overflow: $(objects)
sum_ints_overflow.o: add_two_overflow.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints_overflow
