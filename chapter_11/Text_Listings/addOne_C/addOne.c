/* addOne.c
 * Adds one to an integer.
 */

#include <stdio.h>

int main(void)
{
  int anInt;

  printf("Enter an integer: ");
  scanf("%i", &anInt);
  anInt++;
  printf("Result: %i\n", anInt);

  return 0;
}

