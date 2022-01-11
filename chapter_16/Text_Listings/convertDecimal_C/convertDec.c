/* convertDec.c
 * Reads decimal number from keyboad and displays how
 * it's stored in hexadecimal.
 */

#include <stdio.h>
#include "writeStr.h"
#include "readLn.h"
#include "decToUInt.h"
#define MAX 20
int main()
{
  char theString[MAX];
  unsigned int theInt;
   
  writeStr("Enter an unsigned integer: ");
  readLn(theString, MAX);

  decToUInt(&theInt, theString);
  printf("\"%s\" is stored as 0x%x\n", theString, theInt);
   
  return 0;
}
