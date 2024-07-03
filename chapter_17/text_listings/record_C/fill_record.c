// Allocate a record and assign a value to each field.

#include <stdio.h>

int main(void)
{
    struct {
        char a;
        int i;
        char b;
        int j;
        char c;
    } x;

    x.a = 'a';
    x.i = 12;
    x.b = 'b';
    x.j = 34;
    x.c = 'c';

    printf("x: %c, %i, %c, %i, %c\n", x.a, x.i,
          x.b, x.j, x.c);
    return 0;
}
