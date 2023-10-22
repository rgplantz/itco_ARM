# Build sum_ints_overflow program

objects = sum_ints_overflow.o add_two_overflow.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

sum_ints_overflow: $(objects)
sum_ints_overflow.o: add_two_overflow.h
add_two_overflow.o: add_two_overflow.h

sum_ints_overflow.s: sum_ints_overflow.c add_two_overflow.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_two_overflow.s: add_two_overflow.c add_two_overflow.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints_overflow

