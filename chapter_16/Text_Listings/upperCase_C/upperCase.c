// Converts alphabetic characters to uppercase

#include <stdio.h>
#include "toUpper.h"
#include "writeStr.h"
#include "writeChar.h"
#include "readStr.h"
#define MAX 50
#define ARRAYSZ MAX+1

int main(void) {
    char myString[ARRAYSZ];
   
    writeStr("Enter up to 50 alphabetic characters: ");
    readStr(myString, MAX);

    toUpper(myString, myString);
    writeStr("All upper: ");
    writeStr(myString);
    writeChar('\n');
   
    return 0;
}
