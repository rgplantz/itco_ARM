# Build doNothingProg program

objects = doNothingProg.o
ASFLAGS = --gstabs
AS = as
CC = gcc

doNothingProg: $(objects)

doNothingATT: doNothingProg_att.s
	as --gstabs -o doNothingProg_att.o doNothingProg_att.s
	gcc -o doNothingProg_att doNothingProg_att.o

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm doNothingProg

