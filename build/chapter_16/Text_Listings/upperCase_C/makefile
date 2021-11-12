# Build upperCase program

objects = upperCase.o toUpper.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

upperCase: $(objects)
upperCase.o: toUpper.h writeStr.h readLn.h
toUpper.o: toUpper.h

upperCase.s: upperCase.c toUpper.h writeStr.h readLn.h
	gcc -S $(genasm) -o temp upperCase.c
	expand -t 8 temp > upperCase.s
	rm temp

toUpper.s:  toUpper.c toUpper.h
	gcc -S $(genasm) -o temp toUpper.c
	expand -t 8 temp > toUpper.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm upperCase
	
