# Build add_floats program

objects = add_floats.o
ASFLAGS = --gstabs
AS = as
CC = gcc

add_floats: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_floats
