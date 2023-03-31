// Gets decimal integer from user and stores it as an int

#include <stdio.h>
#include <stdbool.h>
#include "writeStr.h"
#include "readStr.h"
#include "decToInt.h"
#define MAX 11
#define ARRAYSZ MAX+1

int main(void) {
#define ARRAYSZ MAX+1
    char theString[MAX];
    int theInt;
    
    writeStr("Enter an integer: ");
    readStr(theString, MAX);

    decToInt(&theInt, theString);
    printf("\"%s\" is stored as 0x%x\n", theString, theInt);
    
    return 0;
}
