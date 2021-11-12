# Build convertHex program

objects = convertHex.o hexToInt.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

convertHex: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convertHex
