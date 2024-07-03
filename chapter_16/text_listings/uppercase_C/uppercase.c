// Makes alphabetic text string all uppercase

#include <stdio.h>
#include "to_upper.h"
#include "write_str.h"
#include "write_char.h"
#include "read_str.h"
#define MAX 50
#define ARRA_SZ MAX+1

int main(void)
{
    char my_string[ARRAY_SZ];
   
    write_str("Enter up to 50 alphabetic characters: ");
    read_str(my_string, MAX);

    to_upper(my_string, my_string);
    write_str("All upper: ");
    write_str(my_string);
    write_char('\n');
   
    return 0;
}
