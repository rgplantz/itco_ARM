// Converts an int to corresponding decimal text
// string representation. Returns number of characters.

#include <stdbool.h>
#include "intToDec.h"
#define ARRAYSZ 12
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int intToDec(char *decString, int theInt) {
    int count;
    char reverseDec[ARRAYSZ];
    char digit;
    char *ptr;
    bool negative = false;
    
    if (theInt < 0) {
        negative = true;
        theInt = -theInt;
    }
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        ptr++;
        digit = (char)(theInt % RADIX);
        *ptr = ASCII | digit;
        theInt = theInt / RADIX;
    } while (theInt > 0);

    if (negative) {
        *ptr = "-";
        ptr++;
    }
    count = 0;          // reverse the string
    do {
        *decString = *ptr;
        decString++;
        ptr--;
        count++;
    } while (*ptr != NUL);
    *decString = *ptr;  // copy termination char

    return count;
}
