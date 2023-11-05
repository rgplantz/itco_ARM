# Build inc_fractions program

objects = inc_fractions.o fraction_2.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fractions: $(objects)
	$(CXX) $(objects) -o inc_fractions

inc_fractions.o: fraction_2.h
fraction_2.o: fraction_2.h

inc_fractions.s: inc_fractions.cpp fraction_2.h
	g++ $(genasm) -o temp inc_fractions.cpp
	expand -t 8 temp > inc_fractions.s
	rm temp

fraction_2.s: fraction_2.cpp fraction_2.h
	$(CXX) $(genasm) -o temp fraction_2.cpp
	expand -t 8 temp > fraction_2.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects) *~
allclean: clean
	rm inc_fractions
