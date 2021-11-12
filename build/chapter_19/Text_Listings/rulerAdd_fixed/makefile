# Build rulerAdd program

objects = rulerAdd.o getLength.o displayLength.o getUInt.o decToUInt.o putUInt.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

rulerAdd: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm rulerAdd
