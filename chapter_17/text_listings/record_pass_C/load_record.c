// Loads record with data.

#include "a_record.h"
#include "load_record.h"

void load_record(struct a_tag *aRecord, char v, int w, char x, int y, char z) {
    (*a_record).a = v;
    a_record->b = x;     /* equivalent syntax */
    a_record->c = z;
    a_record->i = w;
    a_record->j = y;
}