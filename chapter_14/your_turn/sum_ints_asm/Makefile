# Build sum_ints program

objects = sum_ints.o add_ints.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sum_ints: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum_ints

