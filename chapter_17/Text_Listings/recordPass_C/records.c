// Allocates two records, assigns a value to each field
// in each record, and displays the contents.

#include "aRecord.h"
#include "loadRecord.h"
#include "displayRecord.h"

int main(void) {
    struct aTag x;
    struct aTag y;

    loadRecord(&x, 'a', 'b', 'c', 123);
    loadRecord(&y, '1', '2', '3', 456);
    
    displayRecord(x);
    displayRecord(y);
    
    return 0;
}
