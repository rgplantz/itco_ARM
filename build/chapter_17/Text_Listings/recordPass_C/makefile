# Build records program

objects = records.o displayRecord.o loadRecord.o
CFLAGS = -O0 -Wall -masm=intel -g
CC = gcc
AS = as
ASMFLAGS = --gstabs
genasm = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

records: $(objects)
records.o: displayRecord.h loadRecord.h
displayRecord.o: displayRecord.h
loadRecord.o: loadRecord.h

records.s: records.c displayRecord.h loadRecord.h
	gcc -S $(genasm) -o temp records.c
	expand -t 8 temp > records.s
	rm temp

displayRecord.s: displayRecord.c displayRecord.h
	gcc -S $(genasm) -o temp displayRecord.c
	expand -t 8 temp > displayRecord.s
	rm temp

loadRecord.s: loadRecord.c loadRecord.h
	gcc -S $(genasm) -o temp loadRecord.c
	expand -t 8 temp > loadRecord.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm records
	