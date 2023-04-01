// Converts decimal character string to int
// Returns number of decimal characters

#include <stdio.h>
#include <stdbool.h>
#include "decToInt.h"
#define INTMASK 0x0f
#define RADIX 10
#define NUL '\0'

int decToInt(int *intPtr, char *stringPtr) {
    bool negative = false;       // assume positive
    int result = 0;
    int count = 0;
    char current;

    if (*stringPtr == '-') {
        negative = true;
        stringPtr++;
    } else if (*stringPtr == '+') {
        stringPtr++;
    }

    current = *stringPtr;
    while (current != NUL) {
        result = RADIX * result;
        result += (int)(current & INTMASK);
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
