# Build hello_world_do program

objects = hello_world_do.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

hello_world_do: $(objects)

hello_world_do.s: hello_world_do.c
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm hello_world_do

