/* sumUInts.c
 * Adds two unsigned integers
 */

#include <stdio.h>

int main(void)
{
  unsigned int x = 0, y = 0, z, carry;
  
  printf("Enter an integer: ");
  scanf("%u", &x);
  printf("Enter an integer: ");
  scanf("%u", &y);

  asm("mov edi, %2\n"
      "add edi, %3\n"
      "setc al\n"
      "movzx eax, al\n"
      "mov %1, eax\n"
      "mov %0, edi"
      : "=rm" (z), "=rm" (carry)
      : "rm" (x), "rm" (y)
      : "rax", "rdx", "cc");

  printf("%u + %u = %u\n", x, y, z);
  if (carry)
    printf("*** Carry occurred ***\n");

  return 0;
}
