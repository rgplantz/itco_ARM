/* addTwo.c
 * Adds two integers and outputs sum.
 */

#include "addTwo.h"

void addTwo(int a, int b, int *c)
{
  int sum;
  
  sum = a + b;
  *c = sum;
}
