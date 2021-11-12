# Build recordField program

objects = recordField.o
ASFLAGS = --gstabs
AS = as
CC = gcc

recordField: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm recordField
