// sumInts.c
// Adds two integers using local variables

#include <stdio.h>
#include "addTwo.h"

int main(void) {
    int x = 123, y = 456, z;
  
    addTwo(x, y, &z);
    printf("%i + %i = %i\n", x, y, z);

    return 0;
}
