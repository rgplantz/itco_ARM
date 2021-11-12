# Build hex2Dec program

objects = hex2Dec.o
CFLAGS = -g -Wall -masm=intel
CC = gcc

hex2Dec: $(objects)

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o hex2Dec

