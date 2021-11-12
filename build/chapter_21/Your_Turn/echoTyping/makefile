# Build echoTyping program

objects = echoTyping.o
ASFLAGS = --gstabs
AS = as
CC = gcc

echoTyping: $(objects)
	ld -e myStart $(objects) -o $@

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm echoTyping
