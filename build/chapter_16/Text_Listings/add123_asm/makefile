# Build add123 program

objects = add123.o intToUDec.o
ASFLAGS = --gstabs
AS = as
CC = gcc

add123: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add123

