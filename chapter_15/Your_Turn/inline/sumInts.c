// sumInts.c
// Adds two integers, shows if overflow

#include <stdio.h>

int main(void) {
    int x, y, z, overflow;
  
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);

    asm ("adds %w0, %w2, %w3\n"
        "csinc w0, wzr, wzr, vc\n"
        "str w0, %1"
        : "=r" (z), "=m" (overflow)
        : "r" (x), "r" (y)
        : "w0");

    printf("%i + %i = %i\n", x, y, z);
    if (overflow)
        printf("*** Overflow occurred ***\n");

    return 0;
}