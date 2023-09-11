# Build add_consts program

objects = add_consts.o
ASFLAGS = --gstabs
AS = as
CC = gcc

add_consts: $(objects)

add_consts.lst: add_consts.s
	$(AS) $(ASFLAGS) -al $< > $@

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm add_consts
