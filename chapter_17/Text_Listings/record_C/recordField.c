// Allocates a record and assigns a value to each field.

#include <stdio.h>

int main(void) {
    struct {
        char aChar;
        int anInt;
        char bChar;
    } x;

    x.aChar = 'a';
    x.anInt = 123;
    x.bChar = 'b';

    printf("x: %c, %i, %c\n",
            x.aChar, x.anInt, x.bChar);
    return 0;
}
