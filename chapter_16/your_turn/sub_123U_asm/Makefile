# Build sub_123 program

objects = sub_123.o dec_to_int.o int_to_dec.o write_str.o write_char.o read_str.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sub_123: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sub_123
