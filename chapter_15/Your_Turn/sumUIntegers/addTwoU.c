// addTwoU.c
// Adds two unsigned integers and outputs sum; returns carry T or F
#include "addTwoU.h"

unsigned int addTwoU(unsigned int a, unsigned int b, unsigned int *c) {
    unsigned int sum;
    unsigned int Cflag = 0;   // assume no carry
  
    sum = a + b;
    if ((sum < a) || (sum < b)) {
        Cflag = 1;
    }
    *c = sum;

    return Cflag;
}
