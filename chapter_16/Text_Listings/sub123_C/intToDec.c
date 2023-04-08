// Converts an int to corresponding decimal text
// string representation. Returns number of characters.

#include "intToDec.h"
#define ARRAYSZ 12
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int intToDec(char *decString, int theInt) {
    char reverseDec[ARRAYSZ];
    char digit;
    char *ptr;
    unsigned int working;
    int count = 0;
    
    if (theInt < 0) {
        theInt = -theInt;
        *decString = '-';
        count++;
        decString++;
    }
    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    working = (unsigned int)theInt; // use unsigned arithmetic
    do {
        ptr++;
        digit = (char)(working % RADIX);
        *ptr = ASCII | digit;
        working = working / RADIX;
    } while (working > 0);

    do {                // reverse the string
        *decString = *ptr;
        count++;
        decString++;
        ptr--;
    } while (*ptr != NUL);
    *decString = *ptr;  // copy termination char

    return count;
}
