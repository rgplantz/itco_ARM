# Build fill_records program

objects = fill_records.o load_record.o display_record.o put_int.o int_to_dec.o write_str.o write_char.o
ASFLAGS = --gstabs
AS = as
CC = gcc

fill_records: $(objects)
load_record: my_record.s
display_record: my_record.s

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm fill_records
