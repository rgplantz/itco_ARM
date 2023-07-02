# Build convertDec program

objects = convert_dec.o dec_to_int.o write_str.o read_str.o
ASFLAGS = --gstabs
AS = as
CC = gcc

convert_dec: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm convert_dec
