# Build endian_reg program

objects = endian_reg.o
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall -march=native
CC = gcc

endian_reg: $(objects)

endian_reg.s: endian_reg.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm endian_reg
