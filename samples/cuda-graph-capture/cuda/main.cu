#include <cstdlib>
#include <cuda.h>
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

    cudaMemcpy(d_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, N * sizeof(int), cudaMemcpyHostToDevice);
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
    cudaStream_t stream;
    cudaGraph_t graph;
    cudaGraphExec_t instance;

    fprintf(stdout, "sizeof(cudaStream_t)=%lu, sizeof(cudaGraph_t)=%lu, sizeof(cudaGraphExec_t)=%lu\n", sizeof(cudaStream_t), sizeof(cudaGraph_t), sizeof(cudaGraphExec_t));
    srand((unsigned) time(&t));

    // Allocate memory
    a = (int *) malloc(N * sizeof(int));
    b = (int *) malloc(N * sizeof(int));
    out_a = (int *) malloc(N * sizeof(int));
    out_b = (int *) malloc(N * sizeof(int));
    output = (int *) malloc(N * sizeof(int));

    cudaMalloc((void **) &d_a, N * sizeof(int));
    cudaMalloc((void **) &d_b, N * sizeof(int));
    cudaMalloc((void **) &d_out_a, N * sizeof(int));
    cudaMalloc((void **) &d_out_b, N * sizeof(int));
    cudaMalloc((void **) &d_output, N * sizeof(int));

    cudaStreamCreate(&stream);

    // Capture graph - a simple graph where
    // A   B
    //  \ /
    //   C
    cudaStreamBeginCapture(stream, cudaStreamCaptureModeGlobal);
    kernel_a<<<GRID_SIZE, BLOCK_SIZE, 0, stream>>>(d_a, d_b, d_out_a);
    kernel_b<<<GRID_SIZE, BLOCK_SIZE, 0, stream>>>(d_a, d_b, d_out_b);
    kernel_c<<<GRID_SIZE, BLOCK_SIZE, 0, stream>>>(d_out_a, d_out_b, d_output);
    cudaStreamEndCapture(stream, &graph);
    cudaGraphInstantiate(&instance, graph, NULL, NULL, 0);

    // Execute graphs multiple times
    for (int i = 0; i < NUM_LAUNCHES; ++i) {
        fprintf(stdout, "\rLaunching instance %d/%d with %d inputs...", i + 1, NUM_LAUNCHES, N);
        fflush(stdout);
        prepare_inputs(a, b, d_a, d_b);
        cudaGraphLaunch(instance, stream);
        cudaStreamSynchronize(stream);
        cudaMemcpy(output, d_output, N * sizeof(int), cudaMemcpyDeviceToHost);
        verify_outputs(a, b, output);
    }
    fprintf(stdout, "\n");

    cudaStreamDestroy(stream);
    
    // Free memory
    free(a);
    free(b);
    free(out_a);
    free(out_b);
    free(output);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_out_a);
    cudaFree(d_out_b);
    cudaFree(d_output);

    return 0;
}
