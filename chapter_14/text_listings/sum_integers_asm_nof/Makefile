# Build sum_ints program

objects = sum_ints.o add_const.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
AS = as
ASFLAGS = --gstabs
CC = gcc
CFLAGS = -g -Wall

sum_ints: $(objects)
sum_ints.o: add_const.h
add_const.o: add_const.h

sum_ints.s: sum_ints.c add_const.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_const.s: add_const.c add_const.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints

