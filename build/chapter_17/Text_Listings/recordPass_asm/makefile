# Build records program

objects = records.o displayRecord.o loadRecord.o putInt.o intToSDec.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

records: $(objects)
records.o: aRecord
displayReocord.o: aRecord
loadRecord.o: aRecord

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm records
