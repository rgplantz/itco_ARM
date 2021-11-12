# Build helloWorld-int80 program

objects = helloWorld-int80.o
ASMFLAGS = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

helloWorld-int80: $(objects)
	ld -e myStart $(objects) -o $@

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm helloWorld-int80
