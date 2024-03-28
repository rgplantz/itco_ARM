# Build stand alone hello_world program

objects = hello_world.o

ASFLAGS = --gstabs
AS = as

hello_world: $(objects)
	ld -e my_hello -o hello_world $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm hello_world
