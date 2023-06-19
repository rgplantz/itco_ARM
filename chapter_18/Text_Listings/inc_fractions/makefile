# Build inc_fractions program

objects = inc_fractions.o fraction.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fractions: $(objects)
	$(CXX) $(objects) -o f

inc_fractions.o: fraction.h
fraction.o: fraction.h

inc_fractions.s: inc_fractions.cpp fraction.h
	g++ $(genasm) -o temp inc_fractions.cpp
	expand -t 8 temp > inc_fractions.s
	rm temp

fraction.s: fraction.cpp fraction.h
	$(CXX) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o inc_fractions
