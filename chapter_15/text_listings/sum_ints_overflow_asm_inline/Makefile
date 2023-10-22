# Build sum_ints_inline program

objects = sum_ints_inline.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

sum_ints_inline: $(objects)

sum_ints_inline.s: sum_ints_inline.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints_inline
