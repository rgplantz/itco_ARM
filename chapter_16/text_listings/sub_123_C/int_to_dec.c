// Convert an int to its corresponding decimal text string representation.
// Returns number of characters.

#include "int_to_dec.h"
#define ARRAYSZ 12
#define ASCII 0x30
#define RADIX 10
#define NUL '\0'

int int_to_dec(char *dec_string, int the_int)
{
    char reverse[ARRAYSZ];
    char digit;
    char *ptr;
    unsigned int working;
    int count = 0;
    
    if (the_int < 0) {
        the_int = -the_int;
        *dec_string = '-';
        count++;
        dec_string++;
    }
    ptr = reverse;      // Point to local char array
    *ptr = NUL;         // Start with termination char
    working = (unsigned int)the_int; // Use unsigned arithmetic
    do {
        ptr++;
        digit = (char)(working % RADIX);
        *ptr = ASCII | digit;
        working = working / RADIX;
    } while (working > 0);

    do {                // Reverse the string
        *dec_string = *ptr;
        count++;
        dec_string++;
        ptr--;
    } while (*ptr != NUL);
    *dec_string = *ptr;  // Copy termination char

    return count;
}
