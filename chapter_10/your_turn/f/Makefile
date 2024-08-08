# Build test_f program

objects = test_f.o f.0
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -g -Wall -march=native
CC = gcc
ASFLAGS = --gstabs
AS = as

test_f: $(objects)

test_f.s: test_f.c f.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm do_nothing
