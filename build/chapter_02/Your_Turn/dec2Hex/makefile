# Build dec2Hex program

objects = dec2Hex.o
CFLAGS = -g -Wall -masm=intel
CC = gcc

dec2Hex: $(objects)

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o dec2Hex

