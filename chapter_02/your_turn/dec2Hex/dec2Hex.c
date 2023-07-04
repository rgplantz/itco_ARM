/* dec2Hex.c
 * Converts from decimal to hexadecimal
 */

#include <stdio.h>

int main(void)
{
  unsigned int value;

  printf("Decimal: ");
  scanf("%u", &value);
  printf("%u = 0x%02x\n", value, value);

  return 0;
}

