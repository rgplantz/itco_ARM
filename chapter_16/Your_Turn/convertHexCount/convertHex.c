/* convertHex.c
 * Gets hex number from user and stores it as int.
 */
#include <stdio.h>
#include "writeStr.h"
#include "readLn.h"
#include "hexToInt.h"

#define MAX 20

int main()
{
  char theString[MAX];
  long int theInt;
  int count;
   
  writeStr("Enter up to 16 hex characters: ");
  readLn(theString, MAX);

  count = hexToInt(theString, &theInt);
  printf("The %i characers %lx = %li\n", count, theInt, theInt);
  return 0;
}
