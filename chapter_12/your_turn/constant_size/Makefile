# Build constant_size program

objects = constant_size.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

constant_size: $(objects)

constant_size.s: constant_size.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm constant_size 
