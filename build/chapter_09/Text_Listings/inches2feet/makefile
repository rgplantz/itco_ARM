# Build inches2feet program

objects = inches2feet.o
genasm = -S -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

CFLAGS = -g -Wall -masm=intel
CC = gcc

inches2feet: $(objects)

inches2feet.s: inches2feet.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o inches2feet

