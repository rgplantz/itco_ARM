# Build sum_ints program

objects = sum_ints.o add_ints.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
CC = gcc
CFLAGS = -g -Wall

sum_ints: $(objects)
sum_ints.o: add_ints.h
add_ints.o: add_ints.h

sum_ints.s: sum_ints.c add_ints.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_ints.s: add_ints.c add_ints.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints

