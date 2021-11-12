# Build inc2Fractions program

objects = inc2Fractions.o fraction.o writeStr.o readLn.o putInt.o getInt.o intToUDec.o intToSDec.o decToUInt.o decToSInt.o
myio = ../../../common
VPATH = $(myio)
AS = as
CXXFLAGS = -c -g -Wall -masm=intel -I$(myio)
CC = g++
ASMFLAGS = --gstabs
genasm = -S -Wall -masm=intel -fno-exceptions \
 -fno-asynchronous-unwind-tables -fcf-protection=none

inc2Fractions: $(objects) fraction.hpp
fraction.o: fraction.hpp

inc2Fractions.s: inc2Fractions.cpp fraction.hpp
	g++ $(genasm) -o temp inc2Fractions.cpp
	expand -t 8 temp > inc2Fractions.s
	rm temp

fraction.s: fraction.cpp fraction.hpp
	$(CPP) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm inc2Fractions
