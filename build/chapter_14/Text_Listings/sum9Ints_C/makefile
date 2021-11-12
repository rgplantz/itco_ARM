# Build sum9Ints program

objects = sum9Ints.o addNine.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc

sum9Ints: $(objects) addNine.h
sum9Ints.o: addNine.h
addNine.o: addNine.h

sum9Ints.s: sum9Ints.c addNine.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

addNine.s: addNine.c addNine.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum9Ints

