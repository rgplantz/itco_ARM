// Allocates two records, assigns a value to each field
// in each record, and displays the contents.

#include "aRecord.h"
#include "loadRecord.h"
#include "displayRecord.h"

int main(void) {
    struct aTag x;
    struct aTag y;

    loadRecord(&x, 'a', 12, 'b', 34, 'c');
    loadRecord(&y, 'd', 56, 'e', 78, 'f');
    
    displayRecord(x);
    displayRecord(y);
    
    return 0;
}
