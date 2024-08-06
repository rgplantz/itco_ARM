// Convert inche to feet and inches.

#include <stdio.h>
#define INCHES_PER_FOOT 12

int main(void)
{
    register int feet;
    register int inches;
    register int total_inches;
    register int *ptr;

    ptr = &total_inches;

    printf("Enter inches: ");
    scanf("%i", ptr);
    
    feet = total_inches / INCHES_PER_FOOT;
    inches = total_inches % INCHES_PER_FOOT;
    printf("%i\" = %i' %i\"\n", total_inches, feet, inches);

    return 0;
}
