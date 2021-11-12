# Build incFraction program

objects = incFraction.o fraction_construct.o fraction_destruct.o fraction_display.o fraction_get.o fraction_add.o writeStr.o readLn.o putInt.o getInt.o intToUDec.o intToSDec.o decToUInt.o decToSInt.o
myio = ../../../common
VPATH = $(myio)
asmflags = --gstabs

incFraction: $(objects)

fraction_construct.o: fraction
fraction_destruct.o: fraction
fraction_display.o: fraction
fraction_get.o: fraction
fraction_add.o: fraction

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm incFraction
