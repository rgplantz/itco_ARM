// Load a record with data.

#include "my_grouped_record.h"
#include "load_record.h"

void load_record(struct chars_and_ints *a_record, char v, int w,
                 char x, int y, char z) {
    (*a_record).a = v;
    a_record->b = x;    // Equivalent syntax
    a_record->c = z;
    a_record->i = w;
    a_record->j = y;
}
