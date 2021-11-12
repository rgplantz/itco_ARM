# Build fill2XIndex program

objects = fill2XIndex.o displayArray.o twiceIndex.o putInt.o intToSDec.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

fill2XIndex: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill2XIndex
