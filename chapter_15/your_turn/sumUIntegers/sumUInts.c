// sumUIntsC.c
// Adds two unsigned integers, shows if carry
#include <stdio.h>
#include "addTwoU.h"

int main(void) {
    unsigned int x, y, z, carry;
  
    printf("Enter an integer: ");
    scanf("%u", &x);
    printf("Enter an integer: ");
    scanf("%u", &y);
    carry = addTwoU(x, y, &z);
    printf("%u + %u = %u\n", x, y, z);
    if (carry)
        printf("** Carry occurred **\n");

    return 0;
}
