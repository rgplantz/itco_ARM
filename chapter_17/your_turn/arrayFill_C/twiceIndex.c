/* twiceIndex.c
 * Stores 2 X element number in each array element.
 */

#include "twiceIndex.h"

void twiceIndex(int theArray[], int nElements)
{
  unsigned int i;
   
  for (i = 0; i < nElements; i++)
  {
    theArray[i] = 2 * i;
  }
}
