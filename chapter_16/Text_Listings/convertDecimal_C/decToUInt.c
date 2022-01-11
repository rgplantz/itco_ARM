/* decToUInt.c
 * Converts decimal character string to unsigned int.
 * Returns number of characters.
 */

#include <stdio.h>
#include "decToUInt.h"
#define INTMASK 0x0f
#define NUL '\0'

int decToUInt(unsigned int *intPtr, char *stringPtr)
{
  int radix = 10;
  char current;
  int count = 0;
  
  *intPtr = 0;
  current = *stringPtr;
  while (current != NUL)
  {
    current = current & INTMASK;
    *intPtr = *intPtr * radix;
    *intPtr += current;
    stringPtr++;
    count++;
    current = *stringPtr;
  }
  return count;
}
   
