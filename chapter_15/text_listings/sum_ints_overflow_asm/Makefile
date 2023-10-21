# Build sum_ints program

objects = sum_ints.o add_two_overflow.o

ASFLAGS = --gstabs
AS = as
CFLAGS = -g -Wall -O0
CC = gcc

sum_ints: $(objects)
sum_ints.o: add_two_overflow.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints
