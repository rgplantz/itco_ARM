# Build recordField program

objects = recordField.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

recordField: $(objects)

recordField.s: recordField.c
	gcc -S $(genasm) -o temp recordField.c
	expand -t 8 temp > recordField.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm recordField
	