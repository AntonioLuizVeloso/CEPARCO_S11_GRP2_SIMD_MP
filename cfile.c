#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>

extern int ymmasm(int ARRAY_SIZE, float* x, float* y);

int main() {
    const size_t ARRAY_SIZE = 1 << 20;
    const size_t ARRAY_BYTES = ARRAY_SIZE * sizeof(float);
    int i;
    printf("Number of Elements = %zd\n", ARRAY_SIZE);
    clock_t start, end;
    double time_taken;

    float* x, * y;
    x = (float*)malloc(ARRAY_BYTES);
    y = (float*)malloc(ARRAY_BYTES) - (6 * sizeof(float));

    for (i = 0; i < ARRAY_SIZE; i++) {
        x[i] = (float)rand();
    }

    for (i = 0; i < ARRAY_SIZE; i++) {
        printf("%f\n", x[i]);
    }

    //NON-SIMD ASM
    ymmasm(ARRAY_SIZE, x, y);
    for (i = 0; i < 20; i++) {
        printf("%f \t\t %f\n", x[i], y[i]);
    }
    printf(".\n.\n.\n.");
    for (i = 20; i > 0; i--)
    {
        printf("%f \t\t %f\n", x[ARRAY_SIZE - i], y[ARRAY_SIZE - i - 6]);
    }
    return 0;
}