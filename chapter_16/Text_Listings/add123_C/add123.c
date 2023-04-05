// Reads an int from user, adds 123,
// and displays the result.

#include "writeStr.h"
#include "readStr.h"
#include "decToInt.h"
#include "intToDec.h"
#define MAX 11
#define ARRAYSZ MAX+1

int main(void) {
    char theString[ARRAYSZ];
    int theInt;
    
    writeStr("Enter an integer: ");
    readStr(theString, MAX);

    decToInt(&theInt, theString);
    theInt -= 123;
    intToDec(theString, theInt);
    
    writeStr("The result is: ");
    writeStr(theString);
    writeStr("\n");
    
    return 0;
}
