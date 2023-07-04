/* UART_functions.c
 * Initialize, read, and write functions for an a 16550 UART.
 * WARNING: This code does not run on any known
 *          device. It is meant to sketch some
 *          general I/O concepts only.
 */

#include "UART_defs.h"
#include "UART_functions.h"

/* UART_init intializes the UART and enables it. */
void UART_init(unsigned char* UART)
{
  unsigned char* port = UART;

  *(port+IER) = NOINTERRUPT;  /* no interrupts        */
  *(port+FCR) = NOFIFO;       /* no fifo              */
  *(port+LCR) = SETBAUD;      /* set frequency mode   */
  *(port+DLM) = MSB38400;     /* set to 38400 baud    */
  *(port+DLL) = LSB38400;     /* 2 regs to set        */
  *(port+LCR) = SETCOM;       /* communications mode  */
}

/* UART_in waits until UART has a character then reads it */
unsigned char UART_in(unsigned char* UART)
{
  unsigned char* port = UART;
  unsigned char character;

  while ((*(port+LSR) & RxRDY) != 0)
  { 
  }
  character = *(port+RBR);
  return character;
}

/* UART_out waits until UART is ready then writes a character */
void UART_out(unsigned char* UART, unsigned char character )
{
  unsigned char* port = UART;
  
  while ((*(port+LSR) & TxRDY) != 0)
  {
  }
  *(port+THR) = character;
}
