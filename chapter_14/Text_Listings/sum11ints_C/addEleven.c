// addEleven.c
// Sums Eleven integers and returns the sum.

#include <stdio.h>
#include "addEleven.h"

int addEleven(int one, int two, int three, int four, int five, int six,
                int seven, int eight, int nine, int ten, int eleven) {
    int sum;

    puts("Adding them");
    sum = one + two + three + four + five + six
            + seven + eight + nine + ten + eleven;
    return sum;
}

