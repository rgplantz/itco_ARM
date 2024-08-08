// Tests three functions that return chars.

#include <stdio.h>
#include "exclaim.h"
#include "upper_oh.h"
#include "tilde.h"

int main(void)
{
    char return1, return2, return3;

    return1 = exclaim();
    return2 = upper_oh();
    return3 = tilde();
    printf("The returned chars are: %c, %c, and %c.\n",
          return1, return2, return3);

    return 0;
}
