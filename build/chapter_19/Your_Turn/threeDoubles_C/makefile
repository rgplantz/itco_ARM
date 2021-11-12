# Build threeDoubles program

objects = threeDoubles.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

threeDoubles: $(objects)

threeDoubles.s: threeDoubles.c
	gcc -S $(genasm) -o temp threeDoubles.c
	expand -t 8 temp > threeDoubles.s
	rm temp


.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm threeDoubles
	
