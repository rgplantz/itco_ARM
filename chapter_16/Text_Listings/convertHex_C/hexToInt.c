// Converts hex character string to int
// Returns number of characters
 
#include "hexToInt.h"
#define GAP 0x07
#define INTPART 0x0f  // also works for lowercase
#define NUL '\0'

int hexToInt(char *stringPtr, int *intPtr) {
    *intPtr = 0;
    char current;
    int count = 0;

    current = *stringPtr;
    while (current != NUL) {
        if (current > '9') {
            current -= GAP;
        }
        current = current & INTPART;
        *intPtr = *intPtr << 4;
        *intPtr |= current;
        stringPtr++;
        count++;
        current = *stringPtr;
    }
    return count;
}
