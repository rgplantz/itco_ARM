// Adds constant to automatic, static, global variables.

#include <stdio.h>
#include "add_const.h"
#define INIT_x 78
#define INIT_y 90
#define ADDITION 1000

void add_const(void) {
    int x = INIT_x;         // every call
    static int y = INIT_y;  // first call only
    extern int z;           // global
   
    x += ADDITION;          // add to each
    y += ADDITION;
    z += ADDITION;

    printf("In add_const:%8i %8i %8i\n", x, y, z);
}
