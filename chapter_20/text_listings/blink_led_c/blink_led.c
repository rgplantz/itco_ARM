// Blink an LED.
#include <stdio.h>
#include <unistd.h>
#include <gpiod.h>

#define LINE 17         // GPIO line connected to led
#define OFF 0           // Pin at 0.0v
#define ON 1            // Pin at 3.3v
#define BLINKS 5        // Number of blinks
#define SECONDS 3       // Time between blinks

int main(void)
{
    struct gpiod_chip *chip;
    struct gpiod_line *line;
    int i;
    int error;

    chip = gpiod_chip_open("/dev/gpiochip0");  // On RPi 5 use /dev/gpiochip4
    if(!chip) {
        puts("Cannot open chip");
        return -1;
    }

    line = gpiod_chip_get_line(chip, LINE);
    if(line == NULL) {
        gpiod_chip_close(chip);
        puts("Cannot get GPIO line");
        return -1;
    }
    error = gpiod_line_request_output(line, "example", 0);
    if(error == -1) {
        gpiod_line_release(line);
        gpiod_chip_close(chip);
        puts("Cannot set GPIO output");
        return -1;
    }
    
    for (i = 0; i < BLINKS; i++) {
        gpiod_line_set_value(line, ON);
        printf("led on...\n");
        sleep(SECONDS);
        gpiod_line_set_value(line, OFF);
        printf("...led off\n");
        sleep(SECONDS);
    }
        gpiod_line_release(line);
        gpiod_chip_close(chip);

    return 0;
}
