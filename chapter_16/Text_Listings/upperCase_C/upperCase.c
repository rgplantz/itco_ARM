// Converts alphabetic characters to uppercase

#include <stdio.h>
#include "toUpper.h"
#include "writeStr.h"
#include "readLn.h"
#define MAX 50

int main(void) {
    char myString[MAX];
   
    writeStr("Enter up to 50 alphabetic characters: ");
    readLn(myString, MAX);

    toUpper(myString, myString);
    writeStr("All upper: ");
    writeStr(myString);
    writeStr("\n");
   
    return 0;
}
