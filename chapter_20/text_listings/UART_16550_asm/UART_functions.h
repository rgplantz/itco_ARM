/* UART_functions.h
 * Initialize, read, and write functions for an abstract UART.
 * WARNING: This code does not run on any known
 *          device. It is meant to sketch some
 *          general I/O concepts only.
 */
#ifndef UART_FUNCTIONS_H
#define UART_FUNCTIONS_H
void UART_init(unsigned short int UART);       /* initialize UART  */
unsigned char UART_in(unsigned short int UART);          /* input  */
void UART_out(unsigned short int UART, unsigned char c); /* output */
#endif

