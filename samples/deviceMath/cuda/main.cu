#include "cuda_runtime.h"
#include "stdio.h"
#include "math.h"
#include <cmath>

#define NUM_TEST_CALLS 2

// __device__ float wrap_sin(float input) {
//     return sin(input);
// }

// __device__ float wrap_cos(float input) {
//     return cos(input);
// }

#define TEST_SEQ(in, out) \
    out[0] = sin(in[0]); \
    out[1] = cos(in[1]);

void test_math_host(float *in, float *out) {
    TEST_SEQ(in, out)
}

__global__ void test_math(float *in, float *out) {
    TEST_SEQ(in, out)
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
