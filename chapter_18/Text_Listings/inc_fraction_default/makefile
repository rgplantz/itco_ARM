# Build incFraction_dflt program

objects = incFraction_dflt.o fraction_dflt.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

incFraction_dflt: $(objects)
	$(CXX) $(objects) -o incFraction_dflt

incFraction_dflt.o: fraction_dflt.hpp
fraction_dflt.o: fraction_dflt.hpp

incFraction_dflt.s: incFraction_dflt.cpp fraction_dflt.hpp
	g++ $(genasm) -o temp incFraction_dflt.cpp
	expand -t 8 temp > incFraction_dflt.s
	rm temp

fraction_dflt.s: fraction_dflt.cpp fraction_dflt.hpp
	$(CXX) $(genasm) -o temp fraction_dflt.cpp
	expand -t 8 temp > fraction_dflt.s
	rm temp

.PHONY: clean
clean:
	rm incFraction_dflt *.o *~
