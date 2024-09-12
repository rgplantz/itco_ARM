# Build uppercase program

objects = uppercase.o to_upper.o write_str.o write_char.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

uppercase: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm uppercase

