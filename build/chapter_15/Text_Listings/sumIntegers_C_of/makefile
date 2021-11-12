# Build sumInts program

objects = sumInts.o addTwo.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none -I$(myio)

sumInts: $(objects)
sumInts.o: addTwo.h
addTwo.o: addTwo.h

sumInts.s: sumInts.c displayArray.h twiceIndex.h
	gcc -S $(genasm) -o temp sumInts.c
	expand -t 8 temp > sumInts.s
	rm temp

addTwo.s:  addTwo.c addTwo.h
	gcc -S $(genasm) -o temp addTwo.c
	expand -t 8 temp > addTwo.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sumInts
	
