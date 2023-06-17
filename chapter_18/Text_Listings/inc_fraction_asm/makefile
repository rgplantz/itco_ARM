# Build inc_fraction program

objects = incFractionDef.o fractionAsm.o writeStr.o readStr.o getInt.o putInt.o decToInt.o intToDec.o writeChar.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

incFractionDef: $(objects)
	$(CXX) $(objects) -o incFractionDef

incFractionDef.o: fractionDef.h
fractionAsm.o: fractionDef.h

incFractionDef.s: incFractionDef.cpp fractionDef.h
	g++ $(genasm) -o temp incFractionDef.cpp
	expand -t 8 temp > incFractionDef.s
	rm temp

fractionAsm.s: fractionAsm.cpp fractionDef.h
	$(CXX) $(genasm) -o temp fractionAsm.cpp
	expand -t 8 temp > fractionAsm.s
	rm temp

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o incFractionDef
