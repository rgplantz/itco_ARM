# Build incFraction program

objects = incFraction.o fraction.o getInt.o decToSInt.o decToUInt.o putInt.o \
intToSDec.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
CXXFLAGS = -Wall -I$(myio)
ASFLAGS = --gstabs
AS = as
CXX = g++

incFraction: $(objects)
fraction.o: fraction.hpp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm incFraction
