// Reads decimal number from keyboard and displays in
// hexadecimal how it's stored .

#include <stdio.h>
#include "writeStr.h"
#include "readStr.h"
#include "decToUInt.h"
#define MAX 10
#define ARRAYSZ MAX+1

int main(void) {
#define ARRAYSZ MAX+1
    char theString[MAX];
    unsigned int theInt;
    
    writeStr("Enter an unsigned integer: ");
    readStr(theString, MAX);

    decToUInt(&theInt, theString);
    printf("\"%s\" is stored as 0x%x\n", theString, theInt);
    
    return 0;
}
