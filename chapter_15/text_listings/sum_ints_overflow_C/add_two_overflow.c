// Adds  a and b, outputs sum to c; returns overflow T or F

#include "add_two_overflow.h"

int add_two(int a, int b, int *c)
{
    int sum;
    int V_flag = 0;   // assume no overflow
  
    sum = a + b;
    if (((a > 0) && (b > 0) && (sum < 0)) ||
            ((a < 0) && (b < 0) && (sum > 0))) {
        V_flag = 1;
    }
    *c = sum;

    return V_flag;
}
