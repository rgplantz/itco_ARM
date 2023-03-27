// Converts an int to corresponding unsigned decimal text
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
    char *ptr;
    
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        ptr++;
        digit = theInt % RADIX;
        *ptr = ASCII | digit;
        theInt = theInt / RADIX;
    } while (theInt > 0);

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
