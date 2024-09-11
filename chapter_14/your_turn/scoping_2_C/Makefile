# Build var_life program

objects = var_life.o add_const.o add_const2.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

var_life: $(objects)
var_life.o: add_const.h add_const2.h
add_const.o: add_const.h
add_const2.o: add_const2.h

var_life.s: var_life.c add_const.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_const.s: add_const.c add_const.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

add_const2.s: add_const2.c add_const2.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm var_life

