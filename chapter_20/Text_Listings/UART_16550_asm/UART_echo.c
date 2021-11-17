/* UART_echo.c
 * Use a UART to echo a single character.
 * WARNING: This code does not run on any known
 *          device. It is meant to sketch some
 *          general I/O concepts only.
 */

#include "UART_functions.h"
#define UART0 (unsigned short int)0x3f8  /* location of UART */

int myProg() {
  unsigned char aCharacter;

  UART_init(UART0);
  aCharacter = UART_in(UART0);
  UART_out(UART0, aCharacter);
   
  return 0;
}

