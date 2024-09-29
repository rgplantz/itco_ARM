// Stores 2 x element number in each array element.

#include "twiceIndex.h"

void twiceIndex(int *theArray, int nElements) {
  int i;
   
    for (i = 0; i < nElements; i++) {
        theArray[i] = 2 * i;
  }
}
