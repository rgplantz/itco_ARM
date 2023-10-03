# Build switch program

objects = switch.o
ASFLAGS = --gstabs
AS = as
CC = gcc

switch: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm switch

