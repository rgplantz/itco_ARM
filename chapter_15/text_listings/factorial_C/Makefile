# Build three_factorial program

objects = three_factorial.o factorial.othree_factorial
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

three_factorial: $(objects)
three_factorial.o: factorial.h
factorial.o: factorial.h

three_factorial.s: three_factorial.c factorial.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

factorial.s: factorial.c factorial.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm three_factorial

