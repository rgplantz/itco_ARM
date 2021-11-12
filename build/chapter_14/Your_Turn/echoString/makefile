# Build echo program

objects = echo.o writeStr.o readLn.o
myio = ../../../common# i/o function header files
VPATH = $(myio)
cflags = -c -g -Wall -masm=intel -I$(myio)
asflags = --gstabs
genasm = -S -Wall -masm=intel -I$(myio) \
 -fno-asynchronous-unwind-tables -fcf-protection=none

echo: $(objects)
	gcc -o echo $(objects)

echo.o: echo.c writeStr.h readLn.h
	gcc $(cflags) echo.c

writeStr.o: writeStr.s
	as $(asflags) -o writeStr.o $(myio)/writeStr.s

readLn.o: readLn.s
	as $(asflags) -o readLn.o $(myio)/readLn.s

echo.s: echo.c writeStr.h readLn.h
	$(CC) $(genasm) -o temp echo.c
	expand -t 8 temp > echo.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm echo

