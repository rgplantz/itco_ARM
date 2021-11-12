# Build convertDec program

objects = convertDec.o decToUInt.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

convertDec: $(objects)
convertDec.o: decToUInt.h writeStr.h readLn.h
decToUInt.o: decToUInt.h

convertDec.s: convertDec.c decToUInt.h writeStr.h readLn.h
	gcc -S $(genasm) -o temp convertDec.c
	expand -t 8 temp > convertDec.s
	rm temp

decToUInt.s:  decToUInt.c decToUInt.h
	gcc -S $(genasm) -o temp decToUInt.c
	expand -t 8 temp > decToUInt.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convertDec
	
