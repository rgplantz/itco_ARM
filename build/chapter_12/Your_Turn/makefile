# Create listing files

ASFLAGS = --gstabs -al

constToMemory.lst: constToMemory.s
	as -o /dev/null $< > $@

register_change.lst: register_change.s
	as -o /dev/null $< > $@

regToMemory.lst: regToMemory.s
	as -o /dev/null $< > $@

.PHONY: clean
clean:
	rm *~ *.o

