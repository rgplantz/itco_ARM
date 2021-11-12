# Build addDoubles program

objects = addDoubles.o
ASFLAGS = --gstabs
AS = as
CC = gcc

addDoubles: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm addDoubles
