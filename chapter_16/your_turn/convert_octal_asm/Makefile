# Build convert_octal program

objects = convert_octal.o octal_to_int.o write_str.o read_str.o

CFLAGS = -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

convert_octal: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_octal

