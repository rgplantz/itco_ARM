# Build inc_fraction_arg program

objects = inc_fraction_arg.o fraction.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fraction_arg: $(objects)
	$(CXX) $(objects) -o inc_fraction_arg

inc_fraction_arg.o: fraction_arg.h
fraction.o: fraction_arg.h

inc_fraction_arg.s: inc_fraction_arg.cpp fraction_arg.h
	g++ $(genasm) -o temp inc_fraction_arg.cpp
	expand -t 8 temp > inc_fraction_arg.s
	rm temp

fraction.s: fraction.cpp fraction_arg.h
	$(CXX) $(genasm) -o temp fraction.cpp
	expand -t 8 temp > fraction.s
	rm temp

.PHONY: clean
clean:
	rm inc_fraction_arg *.o *~
