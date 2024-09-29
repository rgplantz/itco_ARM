# Build fill_array program

objects = fill_array.o display_array.o sixteen_index.o put_int.o int_to_dec.o write_str.o write_char.o
ASFLAGS = --gstabs
AS = as
CC = gcc

fill_array: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill_array
