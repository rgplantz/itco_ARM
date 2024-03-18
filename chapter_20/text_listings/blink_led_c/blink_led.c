// Blinks an LED
#include <stdio.h>
#include <error.h>
#include <unistd.h>
#include <gpiod.h>

#define PIN 17          // gpio pin connected to led
#define OFF 0           // pin at 0.0v
#define ON 1            // pin at 3.3v
#define BLINKS 5        // number of blinks
#define SECONDS 3       // time between blinks

int main(void)
{
    struct gpiod_chip *chip;
    struct gpiod_line *line;
    int i;
    int error;

    chip = gpiod_chip_open("/dev/gpiochip0");
    if(!chip) {
        perror("Cannot open chip");
        return EXIT_FAILURE;
    }

    line = gpiod_chip_get_line(chip, PIN);
    if(line == NULL) {
        gpiod_chip_close(chip);
        perror("Cannot get GPIO line");
        return EXIT_FAILURE;
    }
    error = gpiod_line_request_output(line, "example", 0);
    if(error == -1) {
        gpiod_line_release(line);
        gpiod_chip_close(chip);
        perror("Cannot set GPIO output");
        return EXIT_FAILURE;
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

    return EXIT_SUCCESS;
}
