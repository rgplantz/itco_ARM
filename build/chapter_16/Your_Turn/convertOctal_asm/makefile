# Build convertOctal program

objects = convertOctal.o octalToInt.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

convertOctal: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convertOctal
	
