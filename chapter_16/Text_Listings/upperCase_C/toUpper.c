// Converts alphabetic letters in a C string to upper case
 
#include "toUpper.h"
#define UPMASK 0xdf
#define NUL '\0'

int toUpper(char *destPtr, char *srcPtr) {
    int count = 0;
  
    while (*srcPtr != NUL) {
        *destPtr = *srcPtr & UPMASK;
        srcPtr++;
        destPtr++;
        count++;
    }
    *destPtr = *srcPtr;
  
    return count;
}
