/* inches2feet.c
 * Converts inches to feet and inches.
 */

#include <stdio.h>
#define inchesPerFoot 12

int main(void)
{
  register int feet;
  register int inchesRem;
  register int inches;
  register int *ptr;

  ptr = &inches;

  printf("Enter inches: ");
  scanf("%i", ptr);
  
  feet = inches / inchesPerFoot;
  inchesRem = inches % inchesPerFoot;
  printf("%i\" = %i' %i\"\n", inches, feet, inchesRem);

  return 0;
}
