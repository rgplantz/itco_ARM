# Build incFraction program

objects = incFraction.o fraction.o writeStr.o readLn.o putInt.o getInt.o intToUDec.o intToSDec.o decToUInt.o decToSInt.o
myio = ../../../common
VPATH = $(myio)
AS = as
CXXFLAGS = -c -g -Wall -masm=intel -I$(myio)
CC = g++
ASMFLAGS = --gstabs
genasm = -S -Wall -masm=intel -fno-exceptions \
 -fno-asynchronous-unwind-tables -fcf-protection=none

incFraction: $(objects) fraction.hpp
fraction.o: fraction.hpp

incFraction.s: incFraction.cpp fraction.hpp
	g++ $(genasm) -o temp incFraction.cpp
	expand -t 8 temp > incFraction.s
	rm temp

fraction.s: fraction.cpp fraction.hpp
	$(CPP) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm incFraction
