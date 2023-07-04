/* addConst.c
 * Adds three constants
 */
#include <stdio.h>

int main(void)
{
  register int x = 400000000;
  register int y = -400000000;
  int z;

  z = x + y + 456;

  printf("%i + %i = %i\n", x, y, z);

  return 0;
}