# Build convertHex program

objects = convertHex.o hexToInt.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

convertHex: $(objects)
convertHex.o: hexToInt.h writeStr.h readLn.h
hexToInt.o: hexToInt.h

convertHex.s: convertHex.c hexToInt.h writeStr.h readLn.h
	gcc -S $(genasm) -o temp convertHex.c
	expand -t 8 temp > convertHex.s
	rm temp

hexToInt.s:  hexToInt.c hexToInt.h
	gcc -S $(genasm) -o temp hexToInt.c
	expand -t 8 temp > hexToInt.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convertHex
	
