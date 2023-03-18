// Converts decimal character string to unsigned int.
// Returns number of characters.

#include <stdio.h>
#include "decToUInt.h"
#define INTMASK 0x0f
#define RADIX 10
#define NUL '\0'

int decToUInt(unsigned int *intPtr, char *stringPtr) {
    char current;
    unsigned int result;
    int count;
    
    count = 0;
    result = 0;
    current = *stringPtr;
    while (current != NUL) {
        current = current & INTMASK;
        result = RADIX * result;
        result += (unsigned int)current;
        stringPtr++;
        count++;
        current = *stringPtr;
    }
    *intPtr = result;
    return count;
}
