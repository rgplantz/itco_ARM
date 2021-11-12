# Build changeCase program

objects = changeCase.o writeStr.o change.o readLn.o 
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

changeCase: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm changeCase

