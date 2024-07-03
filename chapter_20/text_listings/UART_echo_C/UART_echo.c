// Use a UART to echo a single character.
// WARNING: This code does not run on any known device. It is
//      meant to sketch some general I/O concepts only.

#include "UART_functions.h"
#define UART0 (unsigned char *)0xfe200040   // Address of UART

int main(void)
{
    unsigned char character;

    UART_init(UART0);
    character = UART_in(UART0);
    UART_out(UART0, character);
    
    return 0;
}
