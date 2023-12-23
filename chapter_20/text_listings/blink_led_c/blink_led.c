// Blinks an LED
#include <stdio.h>
#include <unistd.h>
#include <pigpio.h>

#define PIN 17          // gpio pin connected to led
#define OFF 0           // pin at 0.0v
#define ON 1            // pin at 3.3v
#define BLINKS 5        // number of blinks
#define SECONDS 3       // time between blinks

int main(void)
{
    int version;
    int error;
    int i;

    version = gpioInitialise();
    if (version == PI_INIT_FAILED) {
        printf("Can't initialize gpio\n");
        return -1;
    }
    printf("Using version %d of pigpio\n", version);

    error = gpioSetMode(PIN, PI_OUTPUT);  // use pin for output
    if (error) {
        printf("Can't set GPIO mode\n");
        return -1;
    }

    for (i = 0; i < BLINKS; i++) {
        error = gpioWrite(PIN, ON);
        if (error) {
            printf("Can't turn LED on\n");
            return -1;
        }
        printf("led on...\n");
        sleep(SECONDS);
        error = gpioWrite(LED_PIN, OFF);
        if (error) {
            printf("Can't turn LED off\n");
            return -1;
        }
        printf("...led off\n");
        sleep(SECONDS);
    }
    gpioTerminate();

    return 0;
}
