# Build sum11ints program

objects = sum11ints.o add_eleven.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

sum11ints: $(objects)
sum11ints.o: add_eleven.h
add_eleven.o: add_eleven.h

sum11ints.s: sum11ints.c add_eleven.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_eleven.s: add_eleven.c add_eleven.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum11ints
