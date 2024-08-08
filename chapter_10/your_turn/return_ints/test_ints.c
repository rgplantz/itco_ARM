// Tests three functions that return ints.

#include <stdio.h>
#include "twelve.h"
#include "thirty_four.h"
#include "fifty_six.h"

int main(void)
{
    int return1, return2, return3;

    return1 = twelve();
    return2 = thirty_four();
    return3 = fifty_six();
    printf("The returned ints are: %i, %i, and %i.\n",
          return1, return2, return3);

    return 0;
}
