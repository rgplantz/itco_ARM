// Reads an unsigned int from user, adds 123,
// and displays the result.

#include "writeStr.h"
#include "readStr.h"
#include "uDecToInt.h"
#include "uIntToDec.h"
#define MAX 10
#define ARRAYSZ MAX+1

int main(void) {
    char theString[ARRAYSZ];
    unsigned int theInt;
    
    writeStr("Enter an unsigned integer: ");
    readStr(theString, MAX);

    uDecToInt(&theInt, theString);
    theInt += 123;
    uIntToDec(theString, theInt);
    
    writeStr("The result is: ");
    writeStr(theString);
    writeStr("\n");
    
    return 0;
}
