# Build incFraction_dflt program

objects = inc_fraction_dflt.o fraction_dflt.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fraction_dflt: $(objects)
	$(CXX) $(objects) -o inc_fraction_dflt

inc_fraction_dflt.o: fraction_dflt.h
fraction_dflt.o: fraction_dflt.h

inc_fraction_dflt.s: inc_fraction_dflt.cpp fraction_dflt.h
	g++ $(genasm) -o temp inc_fraction_dflt.cpp
	expand -t 8 temp > inc_fraction_dflt.s
	rm temp

fraction_dflt.s: fraction_dflt.cpp fraction_dflt.h
	$(CXX) $(genasm) -o temp fraction_dflt.cpp
	expand -t 8 temp > fraction_dflt.s
	rm temp

.PHONY: clean
clean:
	rm inc_fraction_dflt *.o *~
