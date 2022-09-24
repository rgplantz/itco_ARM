/* addOne.c
 * Adds one to an integer.
 */

#include <stdio.h>

int main(void)
{
  int x, y;

  printf("Enter an integer: ");
  scanf("%i", &x);
  y = x + 1;
  printf("Result: %i\n", y);

  return 0;
}

