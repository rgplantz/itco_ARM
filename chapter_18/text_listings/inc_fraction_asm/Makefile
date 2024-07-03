# Build inc_fraction program

objects = inc_fraction.o fraction_asm.o write_str.o read_str.o get_int.o put_int.o dec_to_int.o int_to_dec.o write_char.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions

CXXFLAGS = -c -g -Wall
ASFLAGS = --gstabs
CXX = g++

inc_fraction: $(objects)
	$(CXX) $(objects) -o inc_fraction

inc_fraction.o: fraction.h
fraction_asm.o: fraction.h

inc_fraction.s: inc_fraction.cpp fraction.h
	g++ $(genasm) -o temp inc_fraction.cpp
	expand -t 8 temp > inc_fraction.s
	rm temp

fraction_asm.s: fraction_asm.cpp fraction.h
	$(CXX) $(genasm) -o temp fraction_asm.cpp
	expand -t 8 temp > fraction_asm.s
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects) *~
allclean: clean
	rm inc_fraction
