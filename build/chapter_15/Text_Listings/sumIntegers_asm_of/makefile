# Build sumInts program

objects = sumInts.o addTwo.o
ASFLAGS = --gstabs
AS = as
CC = gcc

sumInts: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sumInts

