#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <mach/mach_time.h>

int main(void) {
    uint64_t tsc1, tsc2;

    // Read the TSC before the sleep
    tsc1 = mach_absolute_time();

    sleep(1);

    // Read the TSC after the sleep
    tsc2 = mach_absolute_time();

    // Calculate the elapsed time in nanoseconds
    uint64_t elapsed_time = tsc2 - tsc1;
    printf("%lld nanoseconds\n", elapsed_time);

    return 0;
}
