# Build fourFunction program

objects = fourFunction.o writeStr.o getInt.o putInt.o intToSDec.o readLn.o decToSInt.o intToUDec.o decToUInt.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

fourFunction: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fourFunction

