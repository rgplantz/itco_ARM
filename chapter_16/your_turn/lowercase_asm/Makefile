# Build lowercase program

objects = lowercase.o to_lower.o write_str.o write_char.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

lowercase: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm lowercase
