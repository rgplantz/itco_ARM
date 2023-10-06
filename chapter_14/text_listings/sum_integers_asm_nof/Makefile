# Build sum_ints program

objects = sum_ints.o add_two.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
AS = as
ASFLAGS = --gstabs
CC = gcc
CFLAGS = -g -Wall

sum_ints: $(objects)
sum_ints.o: add_two.h

sum_ints.s: sum_ints.c add_two.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints

