/* sumIntsGlobal.c
 * Adds two integers using global variables
 */
#include <stdio.h>
#include "addTwoGlobal.h"

/* Define global variables. */
int x = 123, y = 456, z;

int main(void)
{
  addTwo();
  printf("%i + %i = %i\n", x, y, z);

  return 0;
}
