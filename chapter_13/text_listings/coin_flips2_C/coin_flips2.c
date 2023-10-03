// Flips a coin, heads or tails.

#include <stdio.h>
#include <stdlib.h>
#define N_TIMES 10

int main()
{
    register int random_number;
    register int i;

    for (i = 0; i < N_TIMES; i++) {
        random_number = random();
        if (random_number < RAND_MAX/2) {
            puts("heads");
        } else {
        puts("tails");
        }
    }

    return 0;
}
