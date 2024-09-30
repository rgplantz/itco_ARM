// Allocate two records, assign a value to each field
// in each record, and display the contents.

#include "my_grouped_record.h"
#include "load_record.h"
#include "display_record.h"

int main(void) {
    struct chars_and_ints x;
    struct chars_and_ints y;

    load_record(&x, 'a', 12, 'b', 34, 'c');
    load_record(&y, 'd', 56, 'e', 78, 'f');
    
    display_record(x);
    display_record(y);
    
    return 0;
}
