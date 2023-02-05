#include <stdio.h>
#include <stdlib.h>
#include "cuda_runtime.h"

#define NUM_BLOCKS 32
#define NUM_THREADS 256

__global__ void test_sync(int *output) {
    __shared__ int s[NUM_THREADS];
    __shared__ int placement;
    auto tIdx = threadIdx.x;
    if (tIdx == 0) {
        placement = blockIdx.x;
        s[placement] = 128;
    }

    __syncthreads();

    if (placement == blockIdx.x) {
        output[placement * blockDim.x + tIdx] = s[placement];
    } else {
        output[placement * blockDim.x + tIdx] = -2;
    }
}

int main() {
    int *output_d;
    int output_h[NUM_BLOCKS * NUM_THREADS];
    int num_inconsistent = 0;

    cudaMalloc(&output_d, sizeof(int) * NUM_BLOCKS * NUM_THREADS);
    test_sync<<<NUM_BLOCKS, NUM_THREADS>>>(output_d);
    cudaMemcpy(output_h, output_d, sizeof(int) * NUM_BLOCKS * NUM_THREADS, cudaMemcpyDeviceToHost);

    for (int outputElement : output_h) {
        if (outputElement != 128) {
            num_inconsistent += 1;
            printf("got %d\n", outputElement);
        }
    }

    printf("%d inconsistent results\n", num_inconsistent);

    cudaFree(output_d);
}
