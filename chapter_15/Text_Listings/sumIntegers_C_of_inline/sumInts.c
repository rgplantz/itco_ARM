/* sumInts.c
 * Adds two integers
 */

#include <stdio.h>

int main(void)
{
  int x = 0, y = 0, z, overflow;
  
  printf("Enter an integer: ");
  scanf("%i", &x);
  printf("Enter an integer: ");
  scanf("%i", &y);

  asm ("adds %w0, %w2, %w3\n"
      "csinc %w1, wzr, wzr, vc\n"
      : "=rm" (z), "=rm" (overflow)
      : "rm" (x), "rm" (y)
      : "w0", "w1");

  printf("%i + %i = %i\n", x, y, z);
  if (overflow)
    printf("*** Overflow occurred ***\n");

  return 0;
}
