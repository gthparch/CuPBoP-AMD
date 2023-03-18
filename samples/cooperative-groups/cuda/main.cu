#include <__clang_cuda_builtin_vars.h>
#include <algorithm>
#include <cooperative_groups.h>
#include <cstdio>
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
        printf("[device] Rank %d, Size %d, TID.x = %d, BID.x = %d, dim=(%d, %d, %d)\n",
               i, s, threadIdx.x, blockIdx.x, dim.x, dim.y, dim.z);
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
        printf("[device] Rank %d, Size %d, TID.x = %d, BID.x = %d, valid = %d, dim=(%d, "
               "%d, %d)\n",
               i, s, threadIdx.x, blockIdx.x, v, dim.x, dim.y, dim.z);
    }
}

__global__ void test_block_tiling() {
    auto g = cg::this_thread_block();

    g.sync();

    cg::thread_block_tile<4> tile4 = cg::tiled_partition<4>(g);
    auto mgrank = tile4.size();

    tile4.sync();
    if (tile4.meta_group_rank() == 0) {
        printf("[device] tid=<(%d, %d, %d), (%d, %d, %d)>, t16.mgr=%d, t16.mgs=%d, "
               "t16.size=%d, t16.rank=%d\n",
               threadIdx.x, threadIdx.y, threadIdx.z, blockIdx.x, blockIdx.y,
               blockIdx.z, tile4.meta_group_rank(), tile4.meta_group_size(),
               tile4.size(), tile4.thread_rank());
    }
}

__global__ void test_coalesced_threads() {
    auto blockGroup = cg::this_thread_block();
    if ((blockGroup.thread_rank() % 3) == 0) {
        auto coalescedGroup = cg::coalesced_threads();
        auto rank = coalescedGroup.thread_rank();
        auto size = coalescedGroup.size();
        coalescedGroup.sync();
        printf("[device] Rank %d, Size %d, TID.x = %d, BID.x = %d\n", rank, size,
               threadIdx.x, blockIdx.x);
    }
}

int main(void) {
    printf("[host] Running test_coalesced_threads\n");
    test_coalesced_threads<<<1, 64>>>();
    cudaDeviceSynchronize();

    printf("[host] Running test_thread_block\n");
    test_thread_block<<<4, 32>>>();
    cudaDeviceSynchronize();

    printf("[host] Running test_grid\n");
    test_block_tiling<<<4, 32>>>();
    cudaDeviceSynchronize();

    // TODO: future kernel launches seems to hang after this??
    void *kernel_args[] = {};
    printf("[host] Running test_grid\n");
    cudaLaunchCooperativeKernel((void *)test_grid, 4, 32, kernel_args);
    cudaDeviceSynchronize();

    return 0;
}
