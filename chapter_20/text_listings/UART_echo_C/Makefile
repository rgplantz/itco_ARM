# Build UART_echo program

objects = UART_echo.o UART_functions.o
genasm = -S -Wall -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS = -c -g -Wall
CC = gcc
ASFLAGS = --gstabs
AS = as

UART_echo: $(objects)

UART_echo.o: UART_functions.h
UART_functions.o: UART_functions.h

UART_echo.s: UART_echo.c UART_functions.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

UART_functions.s: UART_functions.c UART_functions.h
	$(CC) $(genasm) -o temp $<
	expand -t 8 temp > $@
	rm temp

.PHONY: clean allclean
clean:
	rm -f $(objects)
allclean: clean
	rm UART_echo

