// Gets hex number from user and stores it as long int

#include <stdio.h>
#include "writeStr.h"
#include "readStr.h"
#include "hexToInt.h"

#define MAX 16
#define BUFFSZ MAX+1

int main() {
    char theString[BUFFSZ];
    long int theInt;
    
    writeStr("Enter up to 16 hex characters: ");
    readStr(theString, MAX);

    hexToInt(theString, &theInt);
    printf("%lx = %li\n", theInt, theInt);
    return 0;
}
