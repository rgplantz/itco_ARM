# Build sum9Ints program

objects = sum9Ints.o addNine.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sum9Ints: $(objects)

.PHONY: clean allclean
clean:
	rm *-f $(objects)
allclean: clean
	rm sum9Ints

