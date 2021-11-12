# Makefile for sum9Ints asm program

objects = sum9Ints.o addNine.o
asmflags = --gstabs

sum9Ints: $(objects)
	gcc -o sum9Ints $(objects)

sum9Ints.o: sum9Ints.s
	as $(asmflags) -o sum9Ints.o sum9Ints.s

addNine.o: addNine.s
	as $(asmflags) -o addNine.o addNine.s

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sum9Ints
	
