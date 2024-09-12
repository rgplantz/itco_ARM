// Add two unsigned integers and show if there is carry.
#include <stdio.h>
#include "add_two.h"

int main(void)
{
    unsigned int x, y, z, carry;
  
    printf("Enter an integer: ");
    scanf("%u", &x);
    printf("Enter an integer: ");
    scanf("%u", &y);
    carry = add_two(&z, x, y);
    printf("%u + %u = %u\n", x, y, z);
    if (carry)
        printf("** Carry occurred **\n");

    return 0;
}
