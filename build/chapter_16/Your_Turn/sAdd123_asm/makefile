# Build sAdd123 program

objects = sAdd123.o writeStr.o getInt.o putInt.o intToSDec.o readLn.o decToSInt.o intToUDec.o decToUInt.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

sAdd123: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sAdd123

