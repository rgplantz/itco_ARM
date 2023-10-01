// Hello World program using the write system call
// one character at a time.

#include <unistd.h>
#define NUL '\x00'

int main(void)
{
    char *message_ptr = "Hello, World!\n";

    while (*message_ptr != NUL)  {
        write(STDOUT_FILENO, message_ptr, 1);
        message_ptr++;
    }

    return 0;
}
