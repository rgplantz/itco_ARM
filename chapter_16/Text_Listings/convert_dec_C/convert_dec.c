// Gets decimal integer from user and stores it as an int

#include <stdio.h>
#include "write_str.h"
#include "read_str.h"
#include "dec_to_int.h"
#define MAX 11
#define ARRAYSZ MAX+1

int main(void) {
#define ARRAYSZ MAX+1
    char the_string[MAX];
    int the_tnt;
    
    write_str("Enter an integer: ");
    read_str(the_string, MAX);

    dec_to_int(&the_int, the_string);
    printf("\"%s\" is stored as 0x%x\n", the_string, the_int);
    
    return 0;
}
