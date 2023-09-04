// Blinks an LED
#include <stdio.h>
#include <pigpio.h>

#define LED_PIN 17                        // gpio pin connected to led
#define LOW 0                             // pin at 0.0v
#define HIGH 1                            // pin at 3.3v
#define N_BLINKS 5                        // number of blinks
#define N_SECONDS 3                       // time between blinks

int main(void) {
    int version;
    int error;
    int i;

    version = gpioInitialise();
    if (version == PI_INIT_FAILED) {
        printf("Can't initialize gpio\n");
        return -1;
    }
    else {
        printf("Using version %d of pigpio\n", version);
    }
    gpioSetMode(LED_PIN, PI_OUTPUT);      // use pin for output

    for (i = 0; i < N_BLINKS; i++) {
        error = gpioWrite(LED_PIN, HIGH); //led on
        if (error) {
            printf("Can't turn LED on\n");
            return -1;
        }
        printf("led on...\n");
        sleep(N_SECONDS);
        error = gpioWrite(LED_PIN, LOW);  // led off
        if (error) {
            printf("Can't turn LED off\n");
            return -1;
        }
        printf("...led off\n");
        sleep(N_SECONDS);
    }
    gpioTerminate();

    return 0;
}
