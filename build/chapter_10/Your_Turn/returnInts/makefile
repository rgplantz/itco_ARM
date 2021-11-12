# Build test_ints program

objects = test_ints.o twelve.o thirtyFour.o fiftySix.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc
ASFLAGS = --gstabs

test_ints: $(objects)
test_ints.o: twelve.h thirtyFour.h fiftySix.h

test_ints.s: test_ints.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm test_ints

