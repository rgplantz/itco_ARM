# Build fill_2x_index program

objects = fill_2x_index.o display_array.o twice_index.o put_int.o int_to_dec.o write_str.o write_chr.o
ASFLAGS = --gstabs
AS = as
CC = gcc

fill_2x_index: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill_2x_index
