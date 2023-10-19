# Build three_factorial program

objects = three_factorial.o factorial.o

ASFLAGS = --gstabs
AS = as
CFLAGS = -g -Wall
CC = gcc

three_factorial: $(objects)
three_factorial.o: factorial.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm three_factorial

