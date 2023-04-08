// Converts an int to corresponding decimal text
// string representation. Returns number of characters.

#include <stdbool.h>
#include "intToDec.h"
#define ARRAYSZ 12
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int intToDec(char *decString, int theInt) {
    char reverseDec[ARRAYSZ];
    int count = 0;
    char digit;
    char *ptr;
    
    if (theInt < 0) {
        *decString = '-';
        count++;
        decString++;
    }
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        ptr++;
        digit = (theInt % RADIX);
        if (digit < 0) {
            digit = -digit;
        }
        *ptr = ASCII | digit;
        theInt = theInt / RADIX;
    } while (theInt > 0);

    do {                // reverse the string
        *decString = *ptr;
        count++;
        decString++;
        ptr--;
    } while (*ptr != NUL);
    *decString = *ptr;  // copy termination char

    return count;
}
