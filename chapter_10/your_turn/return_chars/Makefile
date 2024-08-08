# Build test_chars program

objects = test_chars.o exclaim.o tilde.o upper_oh.o
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -g -Wall -march=native
CC = gcc
ASFLAGS = --gstabs
AS = as

test_chars: $(objects) exclaim.h tilde.h upper_oh.h

test_chars.s: test_chars.c f.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm test_chars
