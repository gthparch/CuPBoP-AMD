#include "cuda_runtime.h"
#include "stdio.h"

__global__ void test_printf()
{
    printf("%s (%d, %d, %d), blockId = (%d, %d, %d)\n", "threadId =", threadIdx.x, threadIdx.y, threadIdx.z, blockIdx.x, blockIdx.y, blockIdx.z);
}

int main() {
    dim3 gridSize (2, 1, 2);
    dim3 blockSize (1, 2, 1);
    test_printf<<<gridSize, blockSize>>>();
    cudaDeviceSynchronize();
}
