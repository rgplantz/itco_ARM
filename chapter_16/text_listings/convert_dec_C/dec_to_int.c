// Converts decimal character string to int
// Returns number of decimal characters

#include <stdio.h>
#include <stdbool.h>
#include "dec_to_int.h"
#define INTMASK 0x0f
#define RADIX 10
#define NUL '\0'

int dec_to_int(int *int_ptr, char *string_ptr) {
    bool negative = false;       // assume positive
    int result = 0;
    int count = 0;

    if (*string_ptr == '-') {
        negative = true;
        string_ptr++;
    } else if (*string_ptr == '+') {
        string_ptr++;
    }

    while (*string_ptr != NUL) {
        result = RADIX * result;
        result += (int)(*string_ptr & INTMASK);
        string_ptr++;
        count++;
    }

    if (negative) {
        result = -result;
    }
    *int_ptr = result;
    return count;
}
