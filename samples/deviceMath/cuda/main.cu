#include <cuda.h>
#include "cuda_runtime.h"
#include "stdio.h"
#include "math.h"
#include <cmath>

#define NUM_TEST_CALLS 26

#define TEST_SEQ(in, out, counter) \
    out[counter] = (int) ::lgamma(10.0f); counter += 1; \
    out[counter] = (int) ::exp(1.0f); counter += 1; \
    out[counter] = (int) ::log(1.0f); counter += 1; \
    out[counter] = (int) ::log10(1000.0f); counter += 1; \
    out[counter] = (int) ::log1p(0.0f); counter += 1; \
    out[counter] = (int) ::log2(1000.0f); counter += 1; \
    out[counter] = (int) ::expm1(1.0f); counter += 1; \
    out[counter] = (int) ::cos(0.0f); counter += 1; \
    out[counter] = (int) ::sin(0.0f); counter += 1; \
    out[counter] = (int) ::sqrt(100.0f); counter += 1; \
    out[counter] = (int) ::ceil(2.4f); counter += 1; \
    out[counter] = (int) ::floor(2.7f); counter += 1; \
    out[counter] = (int) ::trunc(2.7f); counter += 1; \
    out[counter] = (int) ::cosh(1.0f); counter += 1; \
    out[counter] = (int) ::acosh(1.0f); counter += 1; \
    out[counter] = (int) ::asin(1.0f); counter += 1; \
    out[counter] = (int) ::sinh(1.0f); counter += 1; \
    out[counter] = (int) ::asinh(1.0f); counter += 1; \
    out[counter] = (int) ::tan(0.0f); counter += 1; \
    out[counter] = (int) ::atan(1.0f); counter += 1; \
    out[counter] = (int) ::tanh(1.0f); counter += 1; \
    out[counter] = (int) ::erf(10.0f); counter += 1; \
    out[counter] = (int) ::erfc(10.0f); counter += 1; \
    out[counter] = (int) ::round(2.3f); counter += 1; \
    out[counter] = (int) ::pow(2.0f, 10.0f); counter += 1; \
    out[counter] = (int) ::atan2(7.0f, 0.0f); counter += 1; \
    /* out[counter] = (int) ::isnan(0.0f); counter += 1; */ \
    /* out[counter] = (int) ::isinf(0.0f); counter += 1; */

void test_math_host(float *in, float *out) {
    int counter = 0;
    TEST_SEQ(in, out, counter)
}

__global__ void test_math(float *in, float *out) {
    int counter = 0;
    TEST_SEQ(in, out, counter)
}

void check_is_close(int cs, float result, float ref, float error = 1e-6) {
    if (fabs(result - ref) > error) {
        fprintf(stderr, "test case %d failed: %f != %f\n", cs, result, ref);
    } else {
        printf("test case %d passed\n", cs);
    }
}

int main() {
    float in_h[NUM_TEST_CALLS];
    float *in_d;
    float out_h[NUM_TEST_CALLS];
    float out_exp_h[NUM_TEST_CALLS];
    float *out_d;

    cudaMalloc(&in_d, NUM_TEST_CALLS * sizeof(float));
    cudaMalloc(&out_d, NUM_TEST_CALLS * sizeof(float));

    in_h[0] = 1.123;
    in_h[1] = 2.321;
    
    cudaMemcpy(in_d, in_h, NUM_TEST_CALLS * sizeof(float), cudaMemcpyHostToDevice);
    test_math_host(in_h, out_exp_h);
    test_math<<<1, 1>>>(in_d, out_d);
    cudaMemcpy(out_h, out_d, NUM_TEST_CALLS * sizeof(float), cudaMemcpyDeviceToHost);

    for (int i = 0; i < NUM_TEST_CALLS; ++i) {
        check_is_close(i, out_h[i], out_exp_h[i]);
    }

    cudaFree(in_d);
    cudaFree(out_d);
}
