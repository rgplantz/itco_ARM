# Build var_life program

objects = var_life.o add_const.o
ASFLAGS = --gstabs
AS = as
CC = gcc

var_life: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm var_life

