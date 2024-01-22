# Build echo_string program

objects = echo_string.o write_str.o write_char.o read_str.o

ASFLAGS = --gstabs
AS = as
CFLAGS = -g -Wall
CC = gcc

echo_string: $(objects)
echo_string.o: write_str.h write_char.h read_str.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm echo_string
