// Adds constant to automatic, static, global variables.

#include <stdio.h>
#include "add_const.h"
#define INIT_X 78
#define INIT_Y 90
#define ADDITION 1000

void add_const(void)
{
    int x = INIT_X;         // every call
    static int y = INIT_Y;  // first call only
    extern int z;           // global
   
    x += ADDITION;          // add to each
    y += ADDITION;
    z += ADDITION;

    printf("In add_const:%7i %8i %8i\n", x, y, z);
}
