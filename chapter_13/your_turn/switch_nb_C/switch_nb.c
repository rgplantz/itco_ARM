// Select one of three or default.

#include <stdio.h>
#define N_TIMES 10

int main(void)
{
    int i;

    for (i = 1; i <= N_TIMES; i++) {
        switch (i) {
        case 1:
            puts("i = 1");
        case 2:
            puts("i = 2");
        case 3:
            puts("i = 3");
        default:
            puts("i > 3");
        }
    }

    return 0;
}
