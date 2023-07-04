/* threeDoubles.c
 * Associativity of doubles.
 */

#include <stdio.h>
#include <math.h>

int main()
{
  double x, y, z, sum1, sum2;

  printf("Enter a number: ");
  scanf("%lf", &x);
  printf("Enter a number: ");
  scanf("%lf", &y);
  printf("Enter a number: ");
  scanf("%lf", &z);
  
  sum1 = x + y;
  sum1 += z;      /* sum1 = (x + y) + z */
  sum2 = y + z;
  sum2 += x;      /* sum2 = x + (y + z) */

  if (sum1 == sum2)
    printf("%lf is the same as %lf\n", sum1, sum2);
  else
    printf("%lf is not the same as %lf\n", sum1, sum2);

  return 0;
}

