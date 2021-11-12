# Create listing files

ASFLAGS = --gstabs -al

addressing.lst: addressing.s
	as -o /dev/null $< > $@

immediate.lst: immediate.s
	as -o /dev/null $< > $@

jumps.lst: jumps.s
	as -o /dev/null $< > $@

memory.lst: memory.s
	as -o /dev/null $< > $@

register.lst: register.s
	as -o /dev/null $< > $@

.PHONY: clean
clean:
	rm *~ *.o

