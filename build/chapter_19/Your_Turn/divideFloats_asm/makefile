# Build divideFloats program

objects = divideFloats.o
ASFLAGS = --gstabs
AS = as
CC = gcc

divideFloats: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm divideFloats
