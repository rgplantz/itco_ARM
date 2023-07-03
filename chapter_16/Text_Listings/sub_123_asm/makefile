# Build add123 program

objects = add123.o decToUInt.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

add123: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add123
