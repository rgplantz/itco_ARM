// sumInts.c
// Adds two integers and detects overflow

#include <stdio.h>

int main(void) {
    int x, y, z, overflow;
  
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);
    z = x + y;
    printf("%i + %i = %i\n", x, y, z);
    if (((a > 0) && (b > 0) && (sum < 0)) ||
            ((a < 0) && (b < 0) && (sum > 0))) {
        printf("*** Overflow occurred ***\n");
    }

    return 0;
}
