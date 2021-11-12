# Build helloWorld-syscall program

objects = helloWorld-syscall.o
ASMFLAGS = -O0 -Wall -masm=intel -fno-asynchronous-unwind-tables \
-fcf-protection=none

helloWorld-syscall: $(objects)
	ld -e myStart $(objects) -o $@

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm helloWorld-syscall
