# Build doNothingProg program

objects = doNothingProg.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc

doNothingProg: $(objects)

doNothingProg.s: doNothingProg.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm doNothingProg

