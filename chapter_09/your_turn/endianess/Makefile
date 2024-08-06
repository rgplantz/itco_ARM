# Build endianness program

objects = endianness.o
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall -march=native
CC = gcc

endianness: $(objects)

endianness.s: endianness.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm endianness
