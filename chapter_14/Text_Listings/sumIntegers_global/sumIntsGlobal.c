/* sumIntsGlobal.c
 * Adds two integers using global variables
 */
#include <stdio.h>
#include "addTwoGlobal.h"

/* Define global variables. */
int x = 0, y = 0, z;

int main(void)
{
  printf("Enter an integer: ");
  scanf("%i", &x);
  printf("Enter an integer: ");
  scanf("%i", &y);
  addTwo();
  printf("%i + %i = %i\n", x, y, z);

  return 0;
}
