# Build sum11ints program

objects = sum11ints.o add_eleven.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sum11ints: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum11ints

