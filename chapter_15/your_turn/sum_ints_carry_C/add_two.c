// Add two unsigned integers and return 1 for carry, 0 for no carry.

#include "add_two.h"

unsigned int add_two(unsigned int *a, unsigned int b, unsigned int c)
{
    unsigned int sum;
    unsigned int carry = 0;   // Assume no carry
  
    sum = b + c;
    if ((sum < b) || (sum < c)) {   // sum wraps if carry
        carry = 1;
    }
    *a = sum;

    return carry;
}
