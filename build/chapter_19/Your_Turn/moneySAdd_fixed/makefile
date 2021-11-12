# Build moneySAdd program

objects = moneySAdd.o getSMoney.o displaySMoney.o getUInt.o getInt.o decToUInt.o \
decToSInt.o putUInt.o putInt.o intToUDec.o intToSDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

moneySAdd: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm moneySAdd
