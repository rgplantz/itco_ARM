// Converts an int to corresponding decimal text
// string representation. Returns number of characters.

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
    ptr = reverse;      // point to local char array
    *ptr = NUL;         // start with termination char
    working = (unsigned int)the_int; // use unsigned arithmetic
    do {
        ptr++;
        digit = (char)(working % RADIX);
        *ptr = ASCII | digit;
        working = working / RADIX;
    } while (working > 0);

    do {                // reverse the string
        *dec_string = *ptr;
        count++;
        dec_string++;
        ptr--;
    } while (*ptr != NUL);
    *dec_string = *ptr;  // copy termination char

    return count;
}
