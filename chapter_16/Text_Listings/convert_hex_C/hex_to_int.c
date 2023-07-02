// Converts hex character string to int
// Returns number of characters
 
#include "hex_to_int.h"
#define GAP 0x07
#define INTPART 0x0f  // also works for lowercase
#define NUL '\0'

int hex_to_int(int *int_ptr, char *string_ptr) {
    char current;
    int result;
    int count;

    count = 0;
    result = 0;
    current = *string_ptr;
    while (current != NUL) {
        if (current > '9') {
            current -= GAP;
        }
        current = current & INTPART;
        result = result << 4;
        result |= current;
        string_ptr++;
        count++;
        current = *string_ptr;
    }
    *int_ptr = result;
    return count;
}
