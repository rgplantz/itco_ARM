# Build fillrecords program

objects = fillrecords.o fill_record.o display_record.o put_int.o int_to_dec.o write_str.o write_char.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

fillrecords: $(objects)
fillrecords.o: fill_record.h display_record.h
fill_record.o: fill_record.h
display_record.o: display_record.h put_int.h write_str.h write_char.h

fillrecords.s: fillrecords.c display_record.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

fill_record.s: fill_record.c fill_record.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

display_record.s: display_record.c display_record.h put_int.h write_str.h write_char.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fillrecords
