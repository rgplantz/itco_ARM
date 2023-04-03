// Gets hex number from user and stores it as long int

#include <stdio.h>
#include "writeStr.h"
#include "readStr.h"
#include "hexToInt.h"

#define MAX 16
#define ARRAYSZ MAX+1

int main() {
    char theString[ARRAYSZ];
    long int theInt;

    writeStr("Enter up to 8 hex characters: ");
    readStr(theString, MAX);

    hexToInt(&theInt, theString);
    printf("0x%lx = %li\n", theInt, theInt);
    return 0;
}
