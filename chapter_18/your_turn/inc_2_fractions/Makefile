# Build inc_2_fractions program

objects = inc_2_fractions.o fraction.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_2_fractions: $(objects)
	$(CXX) $(objects) -o inc_2_fractions

inc_2_fractions.o: fraction.h
fraction.o: fraction.h

inc_2_fractions.s: inc_2_fractions.cpp fraction.h
	g++ $(genasm) -o temp inc_2_fractions.cpp
	expand -t 8 temp > inc_2_fractions.s
	rm temp

fraction.s: fraction.cpp fraction.h
	$(CXX) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects) *~
allclean: clean
	rm inc_2_fractions
