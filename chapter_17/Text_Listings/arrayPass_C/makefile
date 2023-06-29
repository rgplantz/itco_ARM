# Build fill2XIndex program

objects = fill2XIndex.o twiceIndex.o displayArray.o intToUDec.o decToUInt.o writeStr.o readLn.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

fill2XIndex: $(objects)
fill2XIndex.o: intToUDec.h decToUInt.h writeStr.h readLn.h
twiceIndex.o: twiceIndex.h
displayArray.o: displayArray.h

fill2XIndex.s: fill2XIndex.c twiceIndex.h displayArray.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

twiceIndex.s: twiceIndex.c twiceIndex.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

displayArray.s: displayArray.c displayArray.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects) *~
allclean: clean
	rm fill2XIndex
