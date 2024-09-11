# Build switch_nb program

objects = switch_nb.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

switch_nb: $(objects)

switch_nb.s: switch_nb.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm switch_nb

