# Build test_chars program

objects = test_chars.o exclaim.o upperOh.o tilde.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc
ASFLAGS = --gstabs

test_chars: $(objects)
test_chars.o: exclaim.h upperOh.h tilde.h

test_chars.s: test_chars.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm test_chars

