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

    if (*stringPtr == '-') {
        negative = true;
        stringPtr++;
    } else if (*stringPtr == '+') {
        stringPtr++;
    }

    while (*stringPtr != NUL) {
        result = RADIX * result;
        result += (int)(*stringPtr & INTMASK);
        stringPtr++;
        count++;
    }

    if (negative) {
        result = -result;
    }
    *intPtr = result;
    return count;
}
