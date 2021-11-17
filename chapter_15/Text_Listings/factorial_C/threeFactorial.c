/* computeFactorial.c
 */
#include <stdio.h>
#include "factorial.h"

int main(void)
{
  unsigned int x = 3;
  unsigned int y;
  
  y = factorial(x);
  printf("%u! = %u\n", x, y);
  return 0;
}

