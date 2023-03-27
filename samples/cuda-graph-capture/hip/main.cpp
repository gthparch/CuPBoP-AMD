#include "hip/hip_runtime.h"
#include <cstdlib>
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 4096
#define BLOCK_SIZE 32
#define GRID_SIZE (N / BLOCK_SIZE)
#define NUM_LAUNCHES 4096

__global__ void kernel_a(int *a, int *b, int *output) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    output[i] = i * a[i] + b[i];
}

__global__ void kernel_b(int *a, int *b, int *output) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    output[i] = a[i] + i * b[i];
}

__global__ void kernel_c(int *out_a, int *out_b, int *output) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    output[i] = out_a[i] + out_b[i];
}

__host__ void prepare_inputs(int *a, int *b, int *d_a, int *d_b) {
    for (int i = 0; i < N; ++i) {
        a[i] = rand() % 100;
        b[i] = rand() % 100;
    }

    hipMemcpy(d_a, a, N * sizeof(int), hipMemcpyHostToDevice);
    hipMemcpy(d_b, b, N * sizeof(int), hipMemcpyHostToDevice);
}

__host__ void verify_outputs(int *a, int *b, int *output) {
    for (int i = 0; i < N; ++i) {
        int expected = (i + 1) * (a[i] + b[i]);
        if (output[i] != expected) {
            printf("\nError at index %d: expected %d, got %d (a = %d, b = %d)", i, expected, output[i], a[i], b[i]);
        }
    }
}

int main() {
    int *a, *b, *out_a, *out_b, *output;
    int *d_a, *d_b, *d_out_a, *d_out_b, *d_output;
    time_t t;
    hipStream_t stream;
    hipGraph_t graph;
    hipGraphExec_t instance;

    fprintf(stdout, "sizeof(hipStream_t)=%lu, sizeof(hipGraph_t)=%lu, sizeof(hipGraphExec_t)=%lu\n", sizeof(hipStream_t), sizeof(hipGraph_t), sizeof(hipGraphExec_t));
    srand((unsigned) time(&t));

    // Allocate memory
    a = (int *) malloc(N * sizeof(int));
    b = (int *) malloc(N * sizeof(int));
    out_a = (int *) malloc(N * sizeof(int));
    out_b = (int *) malloc(N * sizeof(int));
    output = (int *) malloc(N * sizeof(int));

    hipMalloc((void **) &d_a, N * sizeof(int));
    hipMalloc((void **) &d_b, N * sizeof(int));
    hipMalloc((void **) &d_out_a, N * sizeof(int));
    hipMalloc((void **) &d_out_b, N * sizeof(int));
    hipMalloc((void **) &d_output, N * sizeof(int));

    hipStreamCreate(&stream);

    // Capture graph - a simple graph where
    // A   B
    //  \ /
    //   C
    hipStreamBeginCapture(stream, hipStreamCaptureModeGlobal);
    hipLaunchKernelGGL(kernel_a, GRID_SIZE, BLOCK_SIZE, 0, stream, d_a, d_b, d_out_a);
    hipLaunchKernelGGL(kernel_b, GRID_SIZE, BLOCK_SIZE, 0, stream, d_a, d_b, d_out_b);
    hipLaunchKernelGGL(kernel_c, GRID_SIZE, BLOCK_SIZE, 0, stream, d_out_a, d_out_b, d_output);
    hipStreamEndCapture(stream, &graph);
    hipGraphInstantiate(&instance, graph, NULL, NULL, 0);

    // Execute graphs multiple times
    for (int i = 0; i < NUM_LAUNCHES; ++i) {
        fprintf(stdout, "\rLaunching instance %d/%d with %d inputs...", i + 1, NUM_LAUNCHES, N);
        fflush(stdout);
        prepare_inputs(a, b, d_a, d_b);
        hipGraphLaunch(instance, stream);
        hipStreamSynchronize(stream);
        hipMemcpy(output, d_output, N * sizeof(int), hipMemcpyDeviceToHost);
        verify_outputs(a, b, output);
    }
    fprintf(stdout, "\n");

    hipStreamDestroy(stream);
    
    // Free memory
    free(a);
    free(b);
    free(out_a);
    free(out_b);
    free(output);

    hipFree(d_a);
    hipFree(d_b);
    hipFree(d_out_a);
    hipFree(d_out_b);
    hipFree(d_output);

    return 0;
}
