# Makefile for sumRange asm program

objects = sumRange.o addRange.o
asmflags = --gstabs

sumRange: $(objects)
	gcc -o sumRange $(objects)

sumRange.o: sumRange.s
	as $(asmflags) -o sumRange.o sumRange.s

addRange.o: addRange.s
	as $(asmflags) -o addRange.o addRange.s

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm sumRange
	
