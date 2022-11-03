
#include <hip/hip_runtime.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// CUDA kernel. Each thread takes care of one element of c
__global__ void vecAdd(double *a, double *b, double *c, int n)
{
    int id = threadIdx.x;
    if (id < n)
    {
        c[id] = a[id] + b[id];
    }
}

int main(int argc, char *argv[])
{
    // Size of vectors
    int n = 100000;

    // Host input vectors
    double *h_a;
    double *h_b;

    // Host output vector
    double *h_c;

    // Device input vectors
    double *d_a;
    double *d_b;

    // Device output vector
    double *d_c;

    // Size, in bytes, of each vector
    size_t bytes = n * sizeof(double);

    // Allocate memory for each vector on host
    h_a = (double *)malloc(bytes);
    h_b = (double *)malloc(bytes);
    h_c = (double *)malloc(bytes);

    // Allocate memory for each vector on GPU
    hipMalloc(&d_a, bytes);
    hipMalloc(&d_b, bytes);
    hipMalloc(&d_c, bytes);

    int i;

    // Initialize vectors on host
    for (i = 0; i < n; i++)
    {
        h_a[i] = sin(i) * sin(i);
        h_b[i] = cos(i) * cos(i);
    }

    // Copy host vectors to device
    hipMemcpy(d_a, h_a, bytes, hipMemcpyHostToDevice);
    hipMemcpy(d_b, h_b, bytes, hipMemcpyHostToDevice);

    int blockSize, gridSize;

    // Number of threads in each thread block
    blockSize = n;

    // Number of thread blocks in grid
    gridSize = 1;

    // Execute the kernel
    vecAdd<<<gridSize, blockSize>>>(d_a, d_b, d_c, n);

    // Copy array back to host
    hipMemcpy(h_c, d_c, bytes, hipMemcpyDeviceToHost);

    // Sum up vector c and print result divided by n, this should equal 1 within error
    double sum = 0;
    for (i = 0; i < n; i++)
        sum += h_c[i];
    printf("final result: %f\n", sum / n);

    // Release device memory
    hipFree(d_a);
    hipFree(d_b);
    hipFree(d_c);

    // Release host memory
    free(h_a);
    free(h_b);
    free(h_c);

    return 0;
}
