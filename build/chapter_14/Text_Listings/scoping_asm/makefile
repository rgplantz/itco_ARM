# Build varLife program

objects = varLife.o addConst.o
ASFLAGS = --gstabs
AS = as
CC = gcc

varLife: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm varLife

