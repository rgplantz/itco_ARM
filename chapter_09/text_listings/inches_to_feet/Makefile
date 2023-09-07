# Build inches_to_feet program

objects = inches_to_feet.o
genasm = -S -Wall -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall -march=native
CC = gcc

inches_to_feet: $(objects)

inches_to_feet.s: inches_to_feet.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm inches_to_feet
