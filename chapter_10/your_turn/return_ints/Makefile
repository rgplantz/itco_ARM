# Build test_ints program

objects = test_ints.o twelve.o thirty_four.o fifty_six.o
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -g -Wall -march=native
CC = gcc
ASFLAGS = --gstabs
AS = as

test_ints: $(objects) twelve.h thirty_four.h fifty_six.h

test_ints.s: test_ints.c f.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm test_ints
