// sumInts.c
// Adds two integers and detects overflow

#include <stdio.h>

int main(void) {
    int x, y, z;
  
    printf("Enter an integer: ");
    scanf("%i", &x);
    printf("Enter an integer: ");
    scanf("%i", &y);
    z = x + y;
    printf("%i + %i = %i\n", x, y, z);
    if (((x > 0) && (y > 0) && (z < 0)) ||
            ((x < 0) && (y < 0) && (z > 0))) {
        printf("*** Overflow occurred ***\n");
    }

    return 0;
}
