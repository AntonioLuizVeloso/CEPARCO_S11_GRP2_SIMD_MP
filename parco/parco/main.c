#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <time.h>

extern int nonsimdasm(long long int ARRAY_SIZE, float* x, float* y);
extern int xmmfunc(long long int ARRAY_SIZE, float* y, float* x);
extern int ymmasm(long long int ARRAY_SIZE, float* x, float* y);

static void compressY(long long int n, float* y, float* x) {
    int i;
    for (i = 3; i < n - 3; i++) {
        y[i - 3] = x[i - 3] + x[i - 2] + x[i - 1] + x[i] + x[i + 1] + x[i + 2] + x[i + 3];
    }
}

static void forPrinting(long long int ARRAY_SIZE, float* x, float* y, double ave, char* implem)
{
    int i = 0;
    for (i = 0; i < 10; i++) {
        printf("%f \t\t %f\n", x[i], y[i]);
    }
    printf(".\n.\n.\n");
    for (i = 10;i > 0; i--)
    {
        printf("%f \t\t %f\n", x[ARRAY_SIZE - i], y[ARRAY_SIZE - i - 6]);
    }
    printf("%s: Average time taken: %f ms\n", implem, ave);
}

static void forErrors(long long int ARRAY_SIZE, float* y, float* z)
{
    long long int errors = 0;
    int i = 0;
    for (i = 0;i < ARRAY_SIZE-6;i++)
    {
        if (z[i] != y[i])
        {
            errors++;
            printf("%d : %f vs %f\n", i, z[i], y[i]);
        }
    }
    printf("Errors: %lld\n\n", errors);
}

int main() {
    const long long int ARRAY_SIZE = 1 << 25;
    const size_t ARRAY_BYTES = ARRAY_SIZE * sizeof(float);
    int i;
    printf("Number of Elements = %zd\n", ARRAY_SIZE);
    LARGE_INTEGER start, end, freq;
    QueryPerformanceFrequency(&freq);
    long long int errors = 0;
    double time_taken;

    float* x, * y, *z;
    x = (float*)malloc(ARRAY_BYTES);
    y = (float*)malloc(ARRAY_BYTES-6*sizeof(float));
    z = (float*)malloc(ARRAY_BYTES - 6 * sizeof(float));
    int a = rand();
    for (i = 0; i < ARRAY_SIZE; i++) {
        x[i] = (float)rand()/ (float)(RAND_MAX / a);
    }

    //Initalization and Calculation of Values in C
    printf("C Implementation of 1-D Stencil: \n");
    double sum=0.0, ave=0.0;
    for (i = 0; i < 30; i++) {
        QueryPerformanceCounter(&start);
        compressY(ARRAY_SIZE, z, x);
        QueryPerformanceCounter(&end);
        time_taken = ((double)(end.QuadPart - start.QuadPart) * 1e3) / freq.QuadPart;
        sum += time_taken;
    }
    ave = sum / 30.0;
    forPrinting(ARRAY_SIZE, x, z, ave,"C");
    printf("\n\n\n");

    sum = 0.0, ave = 0.0;
    printf("NON-SIMD Implementation of 1-D Stencil: \n");
    for (i = 0; i < 30; i++) {
        QueryPerformanceCounter(&start);
        nonsimdasm(ARRAY_SIZE, x, y);
        QueryPerformanceCounter(&end);
        time_taken = ((double)(end.QuadPart - start.QuadPart) * 1e3) / freq.QuadPart;
        sum += time_taken;
    }
    ave = sum / 30.0;
    forPrinting(ARRAY_SIZE, x, y, ave,"NON-SIMD ASM");
    forErrors(ARRAY_SIZE, y, z);
    printf("\n\n\n");

    sum = 0.0, ave = 0.0;
    printf("XMM-SIMD Implementation of 1-D Stencil: \n");
    for (i = 0; i < 30; i++) {
        QueryPerformanceCounter(&start);
        xmmfunc(ARRAY_SIZE, y, x);
        QueryPerformanceCounter(&end);
        time_taken = ((double)(end.QuadPart - start.QuadPart) * 1e3) / freq.QuadPart;
        sum += time_taken;
    }
    ave = sum / 30.0;
    forPrinting(ARRAY_SIZE, x, y, ave, "XMM-SIMD ASM");
    forErrors(ARRAY_SIZE, y, z);
    printf("\n\n\n");

    sum = 0.0, ave = 0.0;
    printf("YMM-SIMD Implementation of 1-D Stencil: \n");
    for (i = 0; i < 1; i++) {
        QueryPerformanceCounter(&start);
        ymmasm(ARRAY_SIZE, y, x);
        QueryPerformanceCounter(&end);
        time_taken = ((double)(end.QuadPart - start.QuadPart) * 1e3) / freq.QuadPart;
        sum += time_taken;
    }
    ave = sum / 30.0;
    forPrinting(ARRAY_SIZE, x, y, ave, "YMM-SIMD ASM");
    forErrors(ARRAY_SIZE, y, z);
    printf("\n\n\n");
    return 0;
}
