/* displayArray.c
 * Prints array contents.
 */

#include "displayArray.h"
#include "writeStr.h"
#include "putInt.h"
void displayArray(int theArray[], int nElements)
{
  int i;
   
  for (i = 0; i < nElements; i++)
  {
    writeStr("intArray[");
    putInt(i);
    writeStr("] = ");
    putInt(theArray[i]);
    writeStr("\n");
  }
}
