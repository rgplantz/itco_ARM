# Build upperCase program

objects = upperCase.o toUpper.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

upperCase: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm upperCase
