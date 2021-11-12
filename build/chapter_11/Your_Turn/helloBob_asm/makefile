# Build helloBob program

objects = helloBob.o
ASFLAGS = --gstabs
AS = as
CC = gcc

helloBob: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm helloBob

