# Build addFloats program

objects = addFloats.o
ASFLAGS = --gstabs
AS = as
CC = gcc

addFloats: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm addFloats
