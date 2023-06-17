# Build inc_fraction_dflt program

objects = inc_fraction_dflt.o fraction_asm.o writeStr.o readStr.o getInt.o putInt.o decToInt.o intToDec.o writeChar.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fraction_dflt: $(objects)
	$(CXX) $(objects) -o inc_fraction_dflt

inc_fraction_dflt.o: fractionDef.h
fraction_asm.o: fractionDef.h

inc_fraction_dflt.s: inc_fraction_dflt.cpp fractionDef.h
	g++ $(genasm) -o temp inc_fraction_dflt.cpp
	expand -t 8 temp > inc_fraction_dflt.s
	rm temp

fraction_asm.s: fraction_asm.cpp fractionDef.h
	$(CXX) $(genasm) -o temp fraction_asm.cpp
	expand -t 8 temp > fraction_asm.s
	rm temp

.PHONY: clean
clean:
	rm inc_fraction_dflt *.o *~
