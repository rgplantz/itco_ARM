# Build build_fraction program

objects = build_fraction.o fraction.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

build_fraction: $(objects)
	$(CXX) $(objects) -o build_fraction

build_fraction.o: fraction.h
fraction.o: fraction.h

build_fraction.s: build_fraction.cpp fraction.h
	g++ $(genasm) -o temp build_fraction.cpp
	expand -t 8 temp > build_fraction.s
	rm temp

fraction.s: fraction.cpp fraction.h
	$(CXX) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean
clean:
	rm build_fraction *.o *~
