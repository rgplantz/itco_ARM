// Add two integers and show if there is carry.

#include <stdio.h>

int main(void)
{
    unsigned int x, y, z, carry;
  
    printf("Enter an integer: ");
    scanf("%u", &x);
    printf("Enter an integer: ");
    scanf("%u", &y);

    asm ("adds %w0, %w2, %w3\n"
        "cinc %w1, wzr, cs"
        : "=r" (z), "=r" (carry)
        : "r" (x), "r" (y));

    printf("%u + %u = %u\n", x, y, z);
    if (carry)
        printf("** Carry occurred **\n");

    return 0;
}
