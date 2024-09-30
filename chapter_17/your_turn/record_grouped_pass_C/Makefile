# Build fill_records program

objects = fill_records.o load_record.o display_record.o put_int.o int_to_dec.o write_str.o write_char.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables

CFLAGS = -g -Wall
CC = gcc

fill_records: $(objects)
fill_records.o: load_record.h display_record.h my_grouped_record.h
load_record.o: load_record.h my_grouped_record.h
display_record.o: display_record.h my_grouped_record.h put_int.h write_str.h write_char.h

fill_records.s: fill_records.c load_record.h display_record.h my_grouped_record.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

load_record.s: load_record.c load_record.h my_grouped_record.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

display_record.s: display_record.c display_record.h my_grouped_record.h put_int.h write_str.h write_char.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill_records
