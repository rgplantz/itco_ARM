// Converts hex character string to int
// Returns number of characters
 
#include "hexToInt.h"
#define GAP 0x07
#define INTPART 0x0f  // also works for lowercase
#define NUL '\0'

int hexToInt(char *stringPtr, int *intPtr) {
    char current;
    int result;
    int count;

    count = 0;
    result = 0;
    current = *stringPtr;
    while (current != NUL) {
        if (current > '9') {
            current -= GAP;
        }
        current = current & INTPART;
        result = result << 4;
        result |= current;
        stringPtr++;
        count++;
        current = *stringPtr;
    }
    *intPtr = result;
    return count;
}
