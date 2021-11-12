# Build varLife2 program

objects = varLife2.o addConst2.o
asmflags = --gstabs

varLife2: $(objects)
	gcc $ -o varLife2 $(objects)

varLife2.o: varLife2.s
	as $(asmflags) -o varLife2.o varLife2.s

addConst2.o: addConst2.s
	as $(asmflags) -o addConst2.o addConst2.s

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm varLife2

