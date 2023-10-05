// Compares scope and lifetime of automatic, static,
// and global variables.

#include <stdio.h>
#include "add_const.h"
#define INIT_x 12
#define INIT_y 34
#define INIT_z 56

int z = INIT_z;

int main(void) {
    int x = INIT_x;
    int y = INIT_y;

    printf("           automatic   static   global\n");
    printf("                   x        y        z\n");
    printf("In main:%12i %8i %8i\n", x, y, z);
    add_const();
    add_const();
    printf("In main:%12i %8i %8i\n", x, y, z);
    return 0;
}
