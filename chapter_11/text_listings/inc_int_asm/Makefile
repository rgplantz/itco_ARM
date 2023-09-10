# Build inc_int program

objects = inc_int.o
ASFLAGS = --gstabs
AS = as
CC = gcc

inc_int: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm inc_int
