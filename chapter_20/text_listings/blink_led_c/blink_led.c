// Blinks an LED
#include <stdio.h>
#include <unistd.h>
#include <pigpio.h>

#define LED_PIN 17                  // gpio pin connected to led
#define LOW 0                       // pin at 0v
#define HIGH 1                      // pin at 3.5v
#define N_SECONDS 3

int main(void) {
    int version;
    int i;

    version = gpioInitialise();
    if (version == PI_INIT_FAILED) {
        printf("Cannot initialise gpio\n");
        return -1;
    }
    else {
        printf("Using version %d of pigpio\n", version);
    }
    gpioSetMode(LED_PIN, PI_OUTPUT);  // use pin for output

    for (i = 0; i < 5; i++) {
        gpioWrite(LED_PIN, HIGH);     //led on
        printf("led on...\n");
        sleep(N_SECONDS);
        gpioWrite(LED_PIN, LOW);      // led off
        printf("...led off\n");
        sleep(N_SECONDS);
    }
  
    gpioTerminate();
    return 0;
}
