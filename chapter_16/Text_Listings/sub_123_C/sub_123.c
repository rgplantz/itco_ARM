// Reads an int from user, subtracts 123, and displays
// the result.

#include "write_str.h"
#include "write_char.h"
#include "read_str.h"
#include "dec_to_int.h"
#include "int_to_dec.h"
#define MAX 11
#define ARRAYSZ MAX+1

int main(void) {
    char the_string[ARRAYSZ];
    int the_int;
    
    write_str("Enter an integer: ");
    read_str(the_string, MAX);

    dec_to_int(&the_int, the_string);
    the_int -= 123;
    int_to_dec(the_string, the_int);
    
    write_str("The result is: ");
    write_str(the_string);
    write_char('\n');
    
    return 0;
}
