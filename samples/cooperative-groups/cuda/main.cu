#include <algorithm>
#include <cooperative_groups.h>
#include <cuda.h>
#include <numeric>
#include <stdio.h>
#include <stdlib.h>

namespace cg = cooperative_groups;

__global__ void test_thread_block() {
    auto g = cg::this_thread_block();

    int i = g.thread_rank();
    int s = g.size();
    auto dim = g.group_dim();

    g.sync();

    if (threadIdx.x < 5 && blockIdx.x == 1) {
        printf("Rank %d, Size %d, TID.x = %d, BID.x = %d, dim=(%d, %d, %d)\n", i, s, threadIdx.x,
               blockIdx.x, dim.x, dim.y, dim.z);
    }
}

__global__ void test_grid() {
    auto g = cg::this_grid();

    int i = g.thread_rank();
    int s = g.size();
    bool v = g.is_valid();
    auto dim = g.group_dim();

    g.sync();

    if (threadIdx.x < 5 && blockIdx.x == 1) {
        printf("Rank %d, Size %d, TID.x = %d, BID.x = %d, valid = %d, dim=(%d, %d, %d)\n", i, s,
               threadIdx.x, blockIdx.x, v, dim.x, dim.y, dim.z);
    }
}

int main(void) {
    test_thread_block<<<4, 32>>>();
    cudaDeviceSynchronize();

    void *kernel_args[] = {};
    cudaLaunchCooperativeKernel((void *)test_grid, 4, 32, kernel_args);
    cudaDeviceSynchronize();
}
