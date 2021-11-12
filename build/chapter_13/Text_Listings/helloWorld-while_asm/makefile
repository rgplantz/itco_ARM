# Build helloWorld program

objects = helloWorld.o
ASFLAGS = --gstabs
AS = as
CC = gcc

helloWorld: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm helloWorld

