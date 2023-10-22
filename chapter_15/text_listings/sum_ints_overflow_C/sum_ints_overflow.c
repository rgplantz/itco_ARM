// Adds two integers, shows if overflow
#include <stdio.h>
#include "add_two_overflow.h"

int main(void)
{
    int x, y, z, overflow;
  
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);
    overflow = add_two_overflow(x, y, &z);
    printf("%i + %i = %i\n", x, y, z);
    if (overflow)
        printf("** Overflow occurred **\n");

    return 0;
}
