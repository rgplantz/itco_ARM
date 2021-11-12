# Build add123 program

objects = add123.o intToUDec.o decToUInt.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

add123: $(objects)
add123.o: intToUDec.h decToUInt.o writeStr.h readLn.h
intToUDec.o: intToUDec.h

add123.s: add123.c intToUDec.h decToUInt.h writeStr.h readLn.h
	gcc -S $(genasm) -o temp add123.c
	expand -t 8 temp > add123.s
	rm temp

intToUDec.s:  intToUDec.c intToUDec.h
	gcc -S $(genasm) -o temp intToUDec.c
	expand -t 8 temp > intToUDec.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add123
	
