# Build threeFactorial program

objects = threeFactorial.o factorial.o
myio = ../../../common
VPATH = $(myio)
CFLAGS = -O0 -Wall -masm=intel -g -I$(myio)
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

threeFactorial: $(objects)
threeFactorial.o: factorial.h
factorial.o: factorial.h

threeFactorial.s: threeFactorial.c displayArray.h twiceIndex.h
	gcc -S $(genasm) -o temp threeFactorial.c
	expand -t 8 temp > threeFactorial.s
	rm temp

factorial.s:  factorial.c factorial.h
	gcc -S $(genasm) -o temp factorial.c
	expand -t 8 temp > factorial.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm threeFactorial
	
