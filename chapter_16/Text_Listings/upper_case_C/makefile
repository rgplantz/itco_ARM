# Build upper_case program

objects = upper_case.o to_upper.o write_str.o write_char.o read_str.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

upper_case: $(objects)
upper_case.o: to_upper.h write_str.h write_char.h readLn.h
to_upper.o: to_upper.h

upper_case.s: upper_case.c to_upper.h write_str.h write_char.h read_str.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

to_upper.s: to_upper.c to_upper.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm upper_case

