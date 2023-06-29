# Build inc_fraction program

objects = inc_fraction.o fraction.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fraction: $(objects)
	$(CXX) $(objects) -o inc_fraction

inc_fraction.o: fraction.h
fraction.o: fraction.h

inc_fraction.s: inc_fraction.cpp fraction.h
	g++ $(genasm) -o temp inc_fraction.cpp
	expand -t 8 temp > inc_fraction.s
	rm temp

fraction.s: fraction.cpp fraction.h
	$(CXX) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects) *~
allclean: clean
	rm inc_fraction
