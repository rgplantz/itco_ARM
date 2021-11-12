# Build fill2XIndex program

objects = fill2XIndex.o displayArray.o twiceIndex.o putInt.o intToSDec.o intToUDec.o writeStr.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

fill2XIndex: $(objects)
fill2XIndex.o: displayArray.h twiceIndex.h
displayArray.o: displayArray.h writeStr.h putInt.h
twiceIndex.o: twiceIndex.h

fill2XIndex.s: fill2XIndex.c displayArray.h twiceIndex.h
	gcc -S $(genasm) -o temp fill2XIndex.c
	expand -t 8 temp > fill2XIndex.s
	rm temp

displayArray.s: displayArray.c displayArray.h writeStr.h putInt.h
	gcc -S $(genasm) -o temp displayArray.c
	expand -t 8 temp > displayArray.s
	rm temp

twiceIndex.s: twiceIndex.c twiceIndex.h
	gcc -S $(genasm) -o temp twiceIndex.c
	expand -t 8 temp > twiceIndex.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill2XIndex
	