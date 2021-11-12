# Build sumUInts program

objects = sumUInts.o addTwoCF.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
AS = as
ASFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

sumUInts: $(objects)
sumUInts.o: addTwoCF.h
addTwoCF.o: addTwoCF.h

sumUInts.s: sumUInts.c displayArray.h twiceIndex.h
	gcc -S $(genasm) -o temp sumUInts.c
	expand -t 8 temp > sumUInts.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sumUInts
	
