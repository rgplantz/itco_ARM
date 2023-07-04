// varLife.c
// Compares scope and lifetime of automatic, static,
// and global variables.

#include <stdio.h>
#include "addConst.h"
#define INITx 12
#define INITy 34
#define INITz 56

int z = INITz;

int main(void) {
    int x = INITx;
    int y = INITy;

    printf("           automatic   static   global\n");
    printf("                   x        y        z\n");
    printf("In main:%12i %8i %8i\n", x, y, z);
    addConst();
    addConst();
    printf("In main:%12i %8i %8i\n", x, y, z);
    return 0;
}
