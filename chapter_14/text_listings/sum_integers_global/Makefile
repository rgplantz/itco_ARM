# Build sum_ints_global program

objects = sum_ints_global.o add_two_global.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
CC = gcc
CFLAGS = -g -Wall

sum_ints_global: $(objects)
sum_ints_global.o: add_two_global.h
add_two_global.o: add_two_global.h

sum_ints_global.s: sum_ints_global.c add_two_global.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_two_global.s: add_two_global.c add_two_global.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints_global

