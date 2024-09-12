# Build change_case program

objects = change_case.o toggle_case.o write_str.o write_char.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

change_case: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm change_case
