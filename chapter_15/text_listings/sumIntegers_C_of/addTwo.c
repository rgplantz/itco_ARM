// Adds  a and b, outputs sum to c; returns overflow T or F

#include "addTwo.h"

int addTwo(int a, int b, int *c) {
    int sum;
    int Vflag = 0;   // assume no overflow
  
    sum = a + b;
    if (((a > 0) && (b > 0) && (sum < 0)) ||
            ((a < 0) && (b < 0) && (sum > 0))) {
        Vflag = 1;
    }
    *c = sum;

    return Vflag;
}