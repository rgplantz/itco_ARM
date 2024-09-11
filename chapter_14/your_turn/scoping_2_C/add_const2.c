// Add constant to automatic, static, global variables.

#include <stdio.h>
#include "add_const2.h"
#define INIT_X 78
#define INIT_Y 90
#define ADDITION 1000

void add_const2(void)
{
    int x = INIT_X;         // every call
    static int y = INIT_Y;  // first call only
    extern int z;           // global
   
    x += ADDITION;          // add to each
    y += ADDITION;
    z += ADDITION;

    printf("In add_const2:%6i %8i %8i\n", x, y, z);
}
