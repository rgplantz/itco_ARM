// Add two integers and return 1 for overflow, 0 for no overflow.

#include "add_two.h"

int add_two(int *a, int b, int c)
{
    int sum;
    int overflow = 0;   // Assume no overflow
  
    sum = b + c;
    if (((b > 0) && (c > 0) && (sum < 0)) ||
            ((b < 0) && (c < 0) && (sum > 0))) {
        overflow = 1;
    }
    *a = sum;

    return overflow;
}
