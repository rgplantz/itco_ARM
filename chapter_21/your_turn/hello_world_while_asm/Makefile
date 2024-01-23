# Build hello_world program

objects = hello_world.o
ASFLAGS = --gstabs
AS = as
CC = gcc

hello_world: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm hello_world

