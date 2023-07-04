// Converts alphabetic letters in a C string to upper case
 
#include "to_upper.h"
#define UPMASK 0xdf
#define NUL '\0'

int to_upper(char *dest_ptr, char *src_ptr)
{
    int count = 0;
  
    while (*src_ptr != NUL) {
        *dest_ptr = *src_ptr & UPMASK;
        src_ptr++;
        dest_ptr++;
        count++;
    }
    *dest_ptr = *src_ptr;   // include NUL
  
    return count;
}
