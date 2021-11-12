# Build intAndString program

intAndString: intAndString.o
	gcc -o intAndString intAndString.o

intAndString.o: intAndString.c
	gcc -c -g -Wall -masm=intel intAndString.c

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o intAndString

