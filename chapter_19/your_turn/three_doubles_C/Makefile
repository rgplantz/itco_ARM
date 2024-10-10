# Build three_doubles program

objects = three_doubles.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -g -Wall
CC = gcc

three_doubles: $(objects)
three_doubles.o:

three_doubles.s: three_doubles.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm three_doubles
