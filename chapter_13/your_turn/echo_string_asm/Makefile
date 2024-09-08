# Build echo_string program

objects = echo_string.o
ASFLAGS = --gstabs
AS = as
CC = gcc

echo_string: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm echo_string
