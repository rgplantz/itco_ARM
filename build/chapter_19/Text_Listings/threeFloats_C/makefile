# Build threeFloats program

objects = threeFloats.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

threeFloats: $(objects)

threeFloats.s: threeFloats.c displayArray.h twiceIndex.h
	gcc -S $(genasm) -o temp threeFloats.c
	expand -t 8 temp > threeFloats.s
	rm temp


.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm threeFloats
	
