// Allocate an int array, store (2 * element number)
// in each element and print array contents.

#include "twice_index.h"
#include "display_array.h"
#define N 10

int main(void)
{
    int our_array[N];
    
    twice_index(our_array, N);
    display_array(our_array, N);
    
    return 0;
}
