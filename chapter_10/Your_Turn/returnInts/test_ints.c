/* test_ints.c
 * Tests three functions that return ints.
 */

#include <stdio.h>
#include "twelve.h"
#include "thirtyFour.h"
#include "fiftySix.h"

int main(void)
{
  int return1, return2, return3;

  return1 = twelve();
  return2 = thirtyFour();
  return3 = fiftySix();
  printf("The returned ints are: %i, %i, and %i.\n",
         return1, return2, return3);

  return 0;
}

