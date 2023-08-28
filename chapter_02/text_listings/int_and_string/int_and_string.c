// Read and display an integer and a text string.

#include <stdio.h>

int main(void)
{
    unsigned int an_int;
    char a_string[10];

    printf("Enter a number in hexadecimal: ");
    scanf("%x", &an_int);
    printf("Enter it again: ");
    scanf("%s", a_string);
    
    printf("The integer is %u and the string is %s\n", an_int, a_string);

    return 0;
}
