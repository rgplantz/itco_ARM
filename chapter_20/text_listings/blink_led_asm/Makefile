# Makefile for blinkLED program
# 2017-09-30: Bob Plantz
# VPATH is set for my directory structure. Changing the directory
# structure or file locations may affect this variable.
VPATH = ../../common/asm

ASMFLAGS = --gstabs

# The object files are specific to this program.
OBJECTS = blinkLED.o gpioPinClr.o gpioPinFSelect.o gpioPinSet.o

blinkLED: $(OBJECTS)
	gcc -o blinkLED $(OBJECTS)

blinkLED.o: blinkLED.s
	as $(ASMFLAGS) -o blinkLED.o blinkLED.s

gpioPinClr.o: gpioPinClr.s
	as $(ASMFLAGS) -o gpioPinClr.o gpioPinClr.s

gpioPinFSelect.o: gpioPinFSelect.s
	as $(ASMFLAGS) -o gpioPinFSelect.o gpioPinFSelect.s

gpioPinSet.o: gpioPinSet.s
	as $(ASMFLAGS) -o gpioPinSet.o gpioPinSet.s

clean:
	rm blinkLED $(OBJECTS) *~

