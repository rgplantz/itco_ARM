// Echos unsigned int

#include "get_int.h"
#include "put_int.h"
#include "write_str.h"
#include "write_char.h"

int main(void)
{
    int x;

    write_str("Enter unsigned integer: ");
    x = get_int();
    write_str("You entered: ");
    put_int(x);
    write_char('\n');
    
    return 0;
}
