# Build do_nothing program

objects = do_nothing.o
genasm = -S -Wall -O0 -fno-asynchronous-unwind-tables \
-fno-unwind-tables

CFLAGS = -g -Wall
CC = gcc

do_nothing: $(objects)

do_nothing.s: do_nothing.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm do_nothing

