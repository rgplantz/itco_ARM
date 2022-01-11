/* intToUDec.c
 * Converts an int to corresponding unsigned text
 * string representation.
 */

#include "intToUDec.h"
#define ASCII 0x30
#define MAX 12
#define NUL '\0'

int intToUDec(char *decString, unsigned int theInt)
{
  int radix = 10;
  int count = -1;   // allow for NUL char
  char reverseArray[MAX];
  char digit;
  char *ptr = reverseArray;
   
  *ptr = NUL;       // start with termination char
  ptr++;
  do
  {
    digit = theInt % radix;
    digit = ASCII | digit;
    *ptr = digit;
    theInt = theInt / radix;
    ptr++;
  } while (theInt > 0);
  do                // reverse the string
  {
    ptr--;
    *decString = *ptr;
    decString++;
    count++;
  } while (*ptr != NUL);
  return count;
}
