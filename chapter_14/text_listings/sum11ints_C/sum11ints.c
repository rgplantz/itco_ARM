// Sum the integers 1 to 11.

#include <stdio.h>
#include "add_eleven.h"

int main(void)
{
    int total;
    int a = 1;
    int b = 2;
    int c = 3;
    int d = 4;
    int e = 5;
    int f = 6;
    int g = 7;
    int h = 8;
    int i = 9;
    int j = 10;
    int k = 11;
  
    total = add_eleven(a, b, c, d, e, f, g, h, i, j, k);
    printf("The sum is %i\n", total);

    return 0;
}
