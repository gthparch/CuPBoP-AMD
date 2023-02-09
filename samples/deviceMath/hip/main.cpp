#include "hip/hip_runtime.h"
#include "stdio.h"
#include "math.h"

#define NUM_TEST_CALLS 32

__device__ __attribute__((noinline)) volatile float wrap_sin1(float input) {
    return sin(input);
}

__device__ __attribute__((noinline)) volatile float wrap_sin(float input) {
    return wrap_sin1(input);
}

__device__ __attribute__((noinline)) volatile float wrap_cos(float input) {
    return cos(input);
}

__global__ void test_math(float *in, float *out) {
    out[0] = wrap_sin(in[0]);
    out[1] = wrap_cos(in[1]);
}

int main() {
    float in_h[NUM_TEST_CALLS];
    float *in_d;
    float out_h[NUM_TEST_CALLS];
    float *out_d;

    hipMalloc(&in_d, NUM_TEST_CALLS * sizeof(float));
    hipMalloc(&out_d, NUM_TEST_CALLS * sizeof(float));
    
    hipMemcpy(in_d, in_h, NUM_TEST_CALLS * sizeof(float), hipMemcpyHostToDevice);
    test_math<<<1, 1>>>(in_d, out_d);
    hipMemcpy(out_h, out_d, NUM_TEST_CALLS * sizeof(float), hipMemcpyDeviceToHost);

    hipFree(in_d);
    hipFree(out_d);
}
