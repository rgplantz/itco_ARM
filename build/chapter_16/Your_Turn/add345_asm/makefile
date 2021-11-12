# Build add345 program

objects = add345.o writeStr.o getInt.o putInt.o intToSDec.o readLn.o decToSInt.o intToUDec.o decToUInt.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

add345: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add345

