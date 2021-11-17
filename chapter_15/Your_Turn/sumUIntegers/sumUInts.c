/* sumUInts.c
 * Adds two unsigned integers
 */

#include <stdio.h>
#include "addTwoCF.h"

int main(void)
{
  unsigned int x = 0, y = 0, z, carry;
  
  printf("Enter an integer: ");
  scanf("%u", &x);
  printf("Enter an integer: ");
  scanf("%u", &y);
  carry = addTwoCF(x, y, &z);
  printf("%u + %u = %u\n", x, y, z);
  if (carry)
    printf("*** Carry occurred ***\n");

  return 0;
}
