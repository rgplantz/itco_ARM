# Build lowerCase program

objects = lowerCase.o toLower.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

lowerCase: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm lowerCase
