// Prompts user to enter text and echos it.

#include "write_char.h"
#include "write_str.h"
#include "read_str.h"
#define MAX 5
#define BUFFSZ MAX+1   // make room for NUL

int main(void)
{
    char text[BUFFSZ];

    write_str("Enter some text: ");
    read_str(text, MAX);
    write_str("You entered: ");
    write_str(text);
    write_char('\n');
  
    return 0;
}
