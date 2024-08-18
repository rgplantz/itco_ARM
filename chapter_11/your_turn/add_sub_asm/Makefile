# Build add_sub program

objects = add_sub.o
ASFLAGS = --gstabs
AS = as
CC = gcc

add_sub: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_sub
