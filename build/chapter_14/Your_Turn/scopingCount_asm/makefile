# Build varLife program

objects = varLife.o addConstCount.o
asmflags = --gstabs

varLife: $(objects)
	gcc $ -o varLife $(objects)

varLife.o: varLife.s
	as $(asmflags) -o varLife.o varLife.s

addConstCount.o: addConstCount.s
	as $(asmflags) -o addConstCount.o addConstCount.s

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm varLife

