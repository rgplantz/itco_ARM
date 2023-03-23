// Converts an unsigned int to corresponding decimal text
// string representation. Returns number of characters.

#include "intToUDec.h"
#define ARRAYSZ 11
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int intToUDec(char *decString, unsigned int theInt) {
    int count;
    char reverseDec[ARRAYSZ];
    unsigned int dividend, remainder;
    char *ptr;
    
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        dividend = theInt / RADIX;
        remainder = theInt - RADIX * dividend;
        theInt = dividend;
        ptr++;
        *ptr = (char) ASCII | digit;
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
