// factorial.c
// returns n x (n - 1)!

#include "factorial.h"

unsigned int factorial(unsigned int n) {
    unsigned int current = 1; // assume base case

    if (n != 0)
        current = n * factorial(n - 1);

  return current;
}
