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

  asm("mov edi, %2\n"
      "add edi, %3\n"
      "seto al\n"
      "movzx eax, al\n"
      "mov %1, eax\n"
      "mov %0, edi"
      : "=rm" (z), "=rm" (overflow)
      : "rm" (x), "rm" (y)
      : "rax", "rdx", "cc");

  printf("%i + %i = %i\n", x, y, z);
  if (overflow)
    printf("*** Overflow occurred ***\n");

  return 0;
}
