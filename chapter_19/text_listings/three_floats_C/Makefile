# Build three_floats program

objects = three_floats.o
CFLAGS = -g -Wall
CC = gcc

three_floats: $(objects)
three_floats.o:

three_floats.s: three_floats.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm three_floats

