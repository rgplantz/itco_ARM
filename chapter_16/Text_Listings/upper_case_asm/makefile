# Build upper_case program

objects = upper_case.o to_upper.o write_str.o write_char.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

upper_case: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm upper_case

