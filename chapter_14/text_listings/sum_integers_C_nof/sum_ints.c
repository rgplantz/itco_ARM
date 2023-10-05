// Adds two integers using local variables

#include <stdio.h>
#include "add_two.h"

int main(void)
{
    int x = 123, y = 456, z;
  
    add_two(x, y, &z);
    printf("%i + %i = %i\n", x, y, z);

    return 0;
}
