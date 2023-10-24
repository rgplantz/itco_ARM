// Adds  a and b, outputs sum to c; returns overflow T or F

#include "add_two.h"

int add_two(int *a, int b, int c)
{
    int sum;
    int V_flag = 0;   // assume no overflow
  
    sum = b + c;
    if (((b > 0) && (c > 0) && (sum < 0)) ||
            ((b < 0) && (c < 0) && (sum > 0))) {
        V_flag = 1;
    }
    *a = sum;

    return V_flag;
}
