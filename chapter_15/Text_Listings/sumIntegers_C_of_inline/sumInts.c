// Adds two integers, shows if overflow

#include <stdio.h>

int main(void) {
    int x, y, z, overflow;
  
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);

    asm ("adds %w0, %w2, %w3\n"
        "cinc %w1, wzr, vs"
        : "=r" (z), "=r" (overflow)
        : "r" (x), "r" (y));

    printf("%i + %i = %i\n", x, y, z);
    if (overflow)
        printf("*** Overflow occurred ***\n");

    return 0;
}
