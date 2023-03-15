// Converts an int to corresponding unsigned text
// string representation. Returns number of characters.

#include "intToUDec.h"
#define ARRAYSZ 11
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int intToUDec(char *decString, unsigned int theInt) {
    int count;
    char reverseDec[ARRAYSZ];
    char digit;
    
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        ptr++;
        digit = theInt % RADIX;
        digit = ASCII | digit;
        *ptr = digit;
        theInt = theInt / RADIX;
    } while (theInt > 0);

    count = 0;          // reverse the string
    while (*ptr != NUL) {
        *decString = *ptr;
        decString++;
        ptr--;
        count++;
    }
    *decString = *ptr;  // copy termination char

    return count;
}
