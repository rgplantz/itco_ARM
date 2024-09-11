# Build sum11ints program

objects = sum11ints.o add_eleven.o
ASFLAGS = --gstabs
AS = as
CFLAGS = -g -Wall
CC = gcc

sum11ints: $(objects)
sum11ints.o: add_eleven.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum11ints

