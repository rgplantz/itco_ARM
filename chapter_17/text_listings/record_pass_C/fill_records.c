// Allocates two records, assigns a value to each field
// in each record, and displays the contents.

#include "a_record.h"
#include "load_record.h"
#include "display_record.h"

int main(void) {
    struct a_tag x;
    struct a_tag y;

    load_record(&x, 'a', 12, 'b', 34, 'c');
    load_record(&y, 'd', 56, 'e', 78, 'f');
    
    display_record(x);
    display_record(y);
    
    return 0;
}
