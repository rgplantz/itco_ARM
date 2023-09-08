# Build do_nothing program

objects = do_nothing.o
ASFLAGS = --gstabs
AS = as
CC = gcc

do_nothing: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm do_nothing
