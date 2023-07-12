# Build add_lengths program

objects = add_lengths.o get_length.o display_length.o put_int.o get_int.o dec_to_int.o int_to_dec.o write_str.o write_char.o read_str.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sub_123: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_lengths
