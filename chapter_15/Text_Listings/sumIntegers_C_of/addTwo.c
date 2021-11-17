/* addTwo.c
 * Adds two integers and deterimines overflow.
 */

#include "addTwo.h"

int addTwo(int a, int b, int *c)
{
  int temp;
  int overflow = 0;   // assume no overflow
  
  temp = a + b;
  if (((a > 0) && (b > 0) && (temp < 0)) ||
          ((a < 0) && (b < 0) && (temp > 0)))
  {
    overflow = 1;
  }
  
  *c = temp;
  return overflow;
}
