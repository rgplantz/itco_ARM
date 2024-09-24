// Echo an unsigned int.

#include "get_uint.h"
#include "put_uint.h"
#include "write_str.h"
#include "write_char.h"

int main(void)
{
    int x;

    write_str("Enter unsigned integer: ");
    x = get_uint();
    write_str("You entered: ");
    put_uint(x);
    write_char('\n');
    
    return 0;
}
