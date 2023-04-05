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
    int count;
    char digit;
    char *ptr;
    unsigned int working;
    bool negative = false;
    
    if (theInt < 0) {
        negative = true;
        theInt = -theInt;
    }
    working = (unsigned)theInt;    ptr = reverseDec;   // point to local char array
    *ptr = NUL;         // start with termination char
    do {
        ptr++;
        digit = (char)(working % RADIX);
        *ptr = ASCII | digit;
        working = working / RADIX;
    } while (working > 0);

    count = 0;
    if (negative) {
        *decString = '-';
        count++;
        decString++;
    }
    do {                // reverse the string
        *decString = *ptr;
        count++;
        decString++;
        ptr--;
    } while (*ptr != NUL);
    *decString = *ptr;  // copy termination char

    return count;
}
