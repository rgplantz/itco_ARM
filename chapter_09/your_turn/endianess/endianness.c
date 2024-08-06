// Determines endianess. If endianess cannot be determined
// from input value, defaults to "big endian"

#include <stdio.h>

int main(void)
{
    unsigned char *ptr;
    int x, i, bigEndian;
   
    ptr = (unsigned char *)&x;
   
    printf("Enter a non-zero integer: ");
    scanf("%i", &x);
   
    printf("You entered %#010x and it is stored\n", x);
    for (i = 0; i < 4; i++)
        printf("   %p: %02x\n", ptr + i, *(ptr + i));

    bigEndian = (*ptr == (unsigned char)(0xff & (x >> 24))) &&
            (*(ptr + 1) == (unsigned char)(0xff & (x >> 16))) &&
            (*(ptr + 2) == (unsigned char)(0xff & (x >> 8))) &&
            (*(ptr + 3) == (unsigned char)(0xff & x));
    if (bigEndian)
        printf("which is big endian.\n");
    else
        printf("which is little endian.\n");

    return 0;
}
