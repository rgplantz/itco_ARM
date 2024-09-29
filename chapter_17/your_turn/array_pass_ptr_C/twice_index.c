// Store 2 x element number in each array element.

#include "twice_index.h"

void twice_index(int *the_array, int n_elements) {
  int i;
   
    for (i = 0; i < n_elements; i++) {
        the_array[i] = 2 * i;
  }
}
