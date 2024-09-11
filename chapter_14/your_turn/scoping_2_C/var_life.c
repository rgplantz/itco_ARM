// Compare scope and lifetime of automatic, static,
// and global variables.

#include <stdio.h>
#include "add_const.h"
#define INIT_X 12
#define INIT_Y 34
#define INIT_Z 56

int z = INIT_Z;

int main(void)
{
    int x = INIT_X;
    int y = INIT_Y;

    printf("           automatic   static   global\n");
    printf("                   x        y        z\n");
    printf("In main:%12i %8i %8i\n", x, y, z);
    add_const();
    add_const();
    printf("In main:%12i %8i %8i\n", x, y, z);
    return 0;
}
