// Gets hex number from user and stores it as int

#include <stdio.h>
#include "writeStr.h"
#include "readStr.h"
#include "hexToInt.h"

#define MAX 8
#define ARRAYSZ MAX+1

int main() {
    char theString[ARRAYSZ];
    int theInt;

    writeStr("Enter up to 16 hex characters: ");
    readStr(theString, MAX);

    hexToInt(&theInt, theString);
    printf("0x%x = %i\n", theInt, theInt);
    return 0;
}
