// Gets hex number from user and stores it as int.

#include <stdio.h>
#include "write_str.h"
#include "read_str.h"
#include "hex_to_int.h"

#define MAX 20

int main()
{
    char the_string[MAX];
    int the_int;
    int count;
    
    write_str("Enter up to 8 hex characters: ");
    read_str(the_string, MAX);

    count = hex_to_int(&the_int, the_string);
    printf("The %i characters %lx = %li\n", count, the_int, the_int);
    return 0;
}
