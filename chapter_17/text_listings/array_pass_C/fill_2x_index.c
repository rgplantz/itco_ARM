// Allocates an int array, stores 2 x element number
// in each element and prints array contents.

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
