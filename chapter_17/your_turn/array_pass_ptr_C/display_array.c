// Print int array contents.

#include "display_array.h"
#include "write_str.h"
#include "write_char.h"
#include "put_int.h"
void display_array(int *the_array, int n_elements) {
    int i;
    
    for (i = 0; i < n_elements; i++) {
        write_str("int_array[");
        put_int(i);
        write_str("] = ");
        put_int(the_array[i]);
        write_char('\n');
    }
}
