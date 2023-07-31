// Associativity of floats.

#include <stdio.h>

int main() {
    float x, y, z, sum1, sum2;

    printf("Enter a number: ");
    scanf("%f", &x);
    printf("Enter a number: ");
    scanf("%f", &y);
    printf("Enter a number: ");
    scanf("%f", &z);
    
    sum1 = (x + y) + z;
    sum2 = x + (y + z);
    sum2 += x;      /* sum2 = x + (y + z) */

    if (sum1 == sum2)
        printf("%f is the same as %f\n", sum1, sum2);
    else
        printf("%f is not the same as %f\n", sum1, sum2);

    return 0;
}
