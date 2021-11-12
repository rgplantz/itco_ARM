# Build moneyAdd program

objects = moneyAdd.o getMoney.o displayMoney.o getUInt.o decToUInt.o putUInt.o intToUDec.o writeStr.o readLn.o
myio = ../../../common
VPATH = $(myio)
ASFLAGS = --gstabs
AS = as
CC = gcc

moneyAdd: $(objects)

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm moneyAdd
