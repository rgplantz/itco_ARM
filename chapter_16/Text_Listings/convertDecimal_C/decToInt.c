// Converts decimal character string to int
// Returns number of decimal characters

#include <stdio.h>
#include <stdbool.h>
#include "decToInt.h"
#define INTMASK 0x0f
#define RADIX 10
#define NUL '\0'

int decToInt(int *intPtr, char *stringPtr) {
    int negative = false;       // assume positive
    int result = 0;
    int count = 0;
    char current = *stringPtr;  // get first character

    if (current == '-') {
        negative = true;
        stringPtr++;
    } else if (current == '+') {
        stringPtr++;
    }

    current = *stringPtr;
    while (current != NUL) {
        current = current & INTMASK;
        result = RADIX * result;
        result += (int)current;
        stringPtr++;
        count++;
        current = *stringPtr;
    }

    if (negative) {
        result = -result;
    }
    *intPtr = result;
    return count;
}
