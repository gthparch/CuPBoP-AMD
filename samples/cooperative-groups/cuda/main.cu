#include <cuda.h>
#include <cooperative_groups.h>
#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <numeric>

namespace cg = cooperative_groups;

__global__ void test_thread_block() {
    auto g = cg::this_thread_block();

    int i = g.thread_rank();
    int s = g.size();

    g.sync();

    if (threadIdx.x < 5 && blockIdx.x == 1) {
        printf("Rank %d, Size %d, TID.x = %d, BID.x = %d\n", i, s, threadIdx.x, blockIdx.x);
    }
}

__global__ void test_grid() {
    auto g = cg::this_grid();

    int i = g.thread_rank();
    int s = g.size();

    g.sync();

    if (threadIdx.x < 5 && blockIdx.x == 1) {
        printf("Rank %d, Size %d, TID.x = %d, BID.x = %d\n", i, s, threadIdx.x, blockIdx.x);
    }
}

int main(void) {
    test_thread_block<<<4, 32>>>();
    cudaDeviceSynchronize();

    void *kernel_args[] = {};
    cudaLaunchCooperativeKernel((void*) test_grid, 4, 32, kernel_args);
    cudaDeviceSynchronize();
}
