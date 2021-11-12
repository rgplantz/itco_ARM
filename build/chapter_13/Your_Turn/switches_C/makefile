# Build switch_15 program

objects = switch_15.o
ASFLAGS = --gstabs
AS = as
CC = gcc

switch_15: $(objects)

switch: switch.o

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm switch_15 switch

