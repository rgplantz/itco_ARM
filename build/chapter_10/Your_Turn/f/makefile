# Build test_f program

objects = test_f.o f.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc
ASFLAGS = --gstabs

test_f: $(objects)
test_f.o: f.h

test_f.s: test_f.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm test_f

