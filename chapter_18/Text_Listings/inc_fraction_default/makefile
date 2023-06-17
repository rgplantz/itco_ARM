# Build incFractionNC program

objects = incFractionNC.o fractionNC.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

incFractionNC: $(objects)
	$(CXX) $(objects) -o incFractionNC

incFractionNC.o: fractionNC.hpp
fractionNC.o: fractionNC.hpp

incFractionNC.s: incFractionNC.cpp fractionNC.hpp
	g++ $(genasm) -o temp incFractionNC.cpp
	expand -t 8 temp > incFractionNC.s
	rm temp

fractionNC.s: fractionNC.cpp fractionNC.hpp
	$(CXX) $(genasm) -o temp fractionNC.cpp
	expand -t 8 temp > fractionNC.s
	rm temp

.PHONY: clean allclean
clean:
	rm *~ *.o
allclean:
	rm *~ *.o incFractionNC
