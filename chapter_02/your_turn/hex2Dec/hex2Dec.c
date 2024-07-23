// Convert from hexadecimal to decimal.

#include <stdio.h>

int main(void)
{
    unsigned int value;

    printf("Hexadecimal: ");
    scanf("%x", &value);
    printf("0x%02x = %u\n", value, value);

    return 0;
}
