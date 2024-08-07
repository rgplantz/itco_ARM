// Initialize, read, and write functions for an abstract UART.
// WARNING: This code does not run on any known device. It is
//      meant to sketch some general I/O concepts only.

#ifndef UART_FUNCTIONS_H
#define UART_FUNCTIONS_H
void UART_init(unsigned char* UART);                  // Initialize UART
unsigned char UART_in(unsigned char* UART);           // Input
void UART_out(unsigned char* UART, unsigned char c);  // Output
#endif
