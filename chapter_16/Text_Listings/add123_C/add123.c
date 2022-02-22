/* add123.c
 * Reads an unsigned int from user, adds 123,
 * and displays the result.
 */

#include "writeStr.h"
#include "readLn.h"
#include "decToUInt.h"
#include "intToUDec.h"
#define MAX 11
int main()
{
  char theString[MAX];
  unsigned int theInt;
   
  writeStr("Enter an unsigned integer: ");
  readLn(theString, MAX);

  decToUInt(&theInt, theString);
  theInt += 123;
  intToUDec(theString, theInt);
   
  writeStr("The result is: ");
  writeStr(theString);
  writeStr("\n");
   
  return 0;
}
