# Build bothCases program

objects = bothCases.o writeStr.o toLower.o toUpper.o readLn.o 
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

bothCases: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm bothCases

