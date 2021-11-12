# Build UART_echo program

objects = UART_echo.o UART_functions.o
ASFLAGS = --gstabs
AS = as
CC = gcc

UART_echo: $(objects)
	ld -e myProg $(objects) -o $@
UART_echo.o: UART_functions.h
UART_functions.o: UART_defs.h

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm UART_echo
