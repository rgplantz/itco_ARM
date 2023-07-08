# Build arithmetic program

objects = arithmetic.o getInt.o putInt.o decToInt.o intToDec.o writeStr.o readStr.o
ASFLAGS = --gstabs
AS = as
CC = gcc

arithmetic: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm arithmetic
