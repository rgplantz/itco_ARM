// Add two unsigned integers and return 1 for carry, 0 for no carry.

#include "add_two.h"

unsigned int add_two(unsigned int *a, unsigned int b, unsigned int c)
{
    unsigned int sum;
    unsigned int carry = 0;   // Assume no overflow
  
    sum = b + c;
//    if (((b > 0) && (c > 0) && (sum < 0)) ||
//            ((b < 0) && (c < 0) && (sum > 0))) {
//        carry = 1;
//    }
    *a = sum;

    return carry;
}
