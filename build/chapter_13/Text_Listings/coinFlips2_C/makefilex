# Build coinFlips2 program

objects = coinFlips2.o
cflags = -O0 -Wall -masm=intel -g
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

coinFlips2: $(objects)
	gcc -o coinFlips2 $(objects)

coinFlips2.o: coinFlips2.c
	gcc -c $(cflags) coinFlips2.c

coinFlips2.s: coinFlips2.c
	gcc -S $(genasm) -o temp coinFlips2.c
	expand -t 8 temp > coinFlips2.s
	rm temp

.PHONY: clean allclean
clean:
	rm *~ *.o

allclean:
	rm *~ *.o coinFlips2
