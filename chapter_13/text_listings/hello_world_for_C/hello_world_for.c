// Hello World program using the write system call
// one character at a time.

#include <unistd.h>
#define NUL '\x00'

int main(void) {
    char *message_ptr;

    for (message_ptr = "Hello, World!\n"; *message_ptr != NUL; message_ptr++) {
        write(STDOUT_FILENO, message_ptr, 1);
    }

    return 0;
}
