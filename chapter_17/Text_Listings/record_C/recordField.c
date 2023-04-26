// Allocates a record and assigns a value to each field.

#include <stdio.h>

int main(void) {
    struct {
        char aChar;
        int oneInt;
        char bChar;
        int twoInt;
        char cChar;
    } x;

    x.aChar = 'a';
    x.oneInt = 12;
    x.bChar = 'b';
    x.twoInt = 34;
    x.cChar = 'c';

    printf("x: %c, %i, %c, %i, %c\n", x.aChar, x.oneInt,
          x.bChar, x.twoInt, x.cChar);
    return 0;
}
