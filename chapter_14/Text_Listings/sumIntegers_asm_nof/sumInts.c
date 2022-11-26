/* sumInts.c
 * Adds two integers using local variables
 */
#include <stdio.h>
#include "addTwo.h"

int main(void)
{
  int x = 0, y = 0, z;
  
  printf("Enter an integer: ");
  scanf("%i", &x);
  printf("Enter an integer: ");
  scanf("%i", &y);
  addTwo(x, y, &z);
  printf("%i + %i = %i\n", x, y, z);

  return 0;
}
