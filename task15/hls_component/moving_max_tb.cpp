/* C-simulation testbench for moving_max.
 * Returns 0 on success, non-zero on failure (Vitis HLS convention). */
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include "moving_max.h"
 
/* Golden model: straightforward max over in[max(0, n-WINDOW+1) .. n]. */
static void moving_max_ref(const int in[N_SAMPLES], int out[N_SAMPLES]) {
    for (int n = 0; n < N_SAMPLES; n++) {
        int start = (n - WINDOW + 1 < 0) ? 0 : n - WINDOW + 1;
        int m = in[start];
        for (int k = start + 1; k <= n; k++) {
            if (in[k] > m) m = in[k];
        }
        out[n] = m;
    }
}
 
static int run_case(const char *name, int in[N_SAMPLES]) {
    int out_dut[N_SAMPLES];
    int out_ref[N_SAMPLES];
 
    moving_max(in, out_dut);
    moving_max_ref(in, out_ref);
 
    int errors = 0;
    for (int n = 0; n < N_SAMPLES; n++) {
        if (out_dut[n] != out_ref[n]) {
            if (errors < 10) {
                printf("  [%s] mismatch at n=%d: in=%d dut=%d ref=%d\n",
                       name, n, in[n], out_dut[n], out_ref[n]);
            }
            errors++;
        }
    }
    printf("%-22s : %s (%d errors)\n", name, errors ? "FAIL" : "PASS", errors);
    return errors;
}
 
int main(void) {
    int in[N_SAMPLES];
    int total_errors = 0;
 
    printf("moving_max testbench: N_SAMPLES=%d, WINDOW=%d\n\n", N_SAMPLES, WINDOW);
 
    /* 1. Monotonically increasing: output must equal the input. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = n;
    total_errors += run_case("increasing ramp", in);
 
    /* 2. Monotonically decreasing: output lags by WINDOW-1 once full. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = 1000 - n;
    total_errors += run_case("decreasing ramp", in);
 
    /* 3. All negative values: catches a max initialised to 0. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = -1000 - (n * 7) % 50;
    total_errors += run_case("all negative", in);
 
    /* 4. Single impulse: max must hold for exactly WINDOW samples. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = 0;
    in[N_SAMPLES / 4] = 12345;
    total_errors += run_case("single impulse", in);
 
    /* 5. Impulse at sample 0: checks the start-up (partially filled window). */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = -5;
    in[0] = 99;
    total_errors += run_case("impulse at start", in);
 
    /* 6. Extreme values INT_MIN / INT_MAX. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = (n % 3 == 0) ? INT_MAX : INT_MIN;
    total_errors += run_case("INT_MIN/INT_MAX mix", in);
 
    /* 7. All INT_MIN: output must be INT_MIN everywhere. */
    for (int n = 0; n < N_SAMPLES; n++) in[n] = INT_MIN;
    total_errors += run_case("all INT_MIN", in);
 
    /* 8. Random signed data, several seeds. */
    for (int seed = 1; seed <= 5; seed++) {
        char name[32];
        srand(seed);
        for (int n = 0; n < N_SAMPLES; n++) in[n] = (rand() % 20001) - 10000;
        snprintf(name, sizeof(name), "random seed %d", seed);
        total_errors += run_case(name, in);
    }
 
    printf("\n%s: %d total errors\n", total_errors ? "TEST FAILED" : "TEST PASSED",
           total_errors);
    return total_errors ? 1 : 0;
}
 