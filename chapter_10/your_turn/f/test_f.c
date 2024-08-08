// Tests f() function.

#include <stdio.h>
#include "f.h"

int main(void)
{
    int return_value;
    return_value = f();
    printf("f returned %i.\n", return_value);

    return 0;
}

