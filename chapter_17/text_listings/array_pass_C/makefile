# Build fill_2x_index program

objects = fill_2x_index.o twice_index.o display_array.o put_int.o int_to_dec.o write_str.o write_char.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

fill_2x_index: $(objects)
fill_2x_index.o: twice_index.h display_array.h
twice_index.o: twice_index.h
display_array.o: display_array.h put_int.h write_str.h write_char.h

fill_2x_index.s: fill_2x_index.c display_array.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

twice_index.s: twice_index.c twice_index.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

display_array.s: display_array.c display_array.h put_int.h write_str.h write_char.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill_2x_index
