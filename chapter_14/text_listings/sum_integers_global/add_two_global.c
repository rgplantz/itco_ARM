// Add two global integers.

#include "add_two_global.h"

extern int x, y, z;

void add_two(void)
{
    z = x + y;
}
