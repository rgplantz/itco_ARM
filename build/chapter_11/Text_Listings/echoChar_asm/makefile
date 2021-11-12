# Build echoChar program

objects = echoChar.o
ASFLAGS = --gstabs
AS = as
CC = gcc

echoChar: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm echoChar

