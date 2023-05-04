// Prints int array contents.

#include "displayArray.h"
#include "writeStr.h"
#include "writeChar.h"
#include "putInt.h"
void displayArray(int theArray[], int nElements) {
    int i;
    
    for (i = 0; i < nElements; i++) {
        writeStr("intArray[");
        putInt(i);
        writeStr("] = ");
        putInt(theArray[i]);
        writeChar('\n');
    }
}
