#include "hip/hip_runtime.h"
#include <hip/hip_runtime.h>
#include <hip/hip_cooperative_groups.h>
#include <stdlib.h>
#include <numeric>

namespace cg = cooperative_groups;

__attribute__((noinline))
__device__ int cg_rank(cg::thread_group g) {
    return g.thread_rank();
}

__attribute__((noinline))
__device__ void cg_sync(cg::thread_group g) {
    g.sync();
}

__attribute__((noinline))
__device__ cg::thread_group cg_this_thread_block() {
    return cg::this_grid();
}

__device__ int reduce_sum(cg::thread_group g, int *temp,
                          int val) {

    int lane = cg_rank(g);

    for (int i = g.size() / 2; i > 0; i /= 2) {

        temp[lane] = val;
        cg_sync(g);
        if (lane < i)
            val += temp[lane + i];
        cg_sync(g);
    }
    // printf("val returned in reduced_sum =%d\n",val);
    return val;
}

__device__ int thread_sum(int *input, int n) {
    int sum = 0;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n / 4;
         i += blockDim.x * gridDim.x) {
        int4 in = ((int4 *)input)[i];
        sum += in.x + in.y + in.z + in.w;
    }
    // printf("sum returned from thrad_sum =%d\n",sum);
    return sum;
}

__global__ void sum_kernel_block(int *sum, int *input, int n) {
    extern __shared__ int temp[];
    int my_sum = thread_sum(input, n);
    auto g = cg_this_thread_block();
    int block_sum = reduce_sum(g, temp, my_sum);

    if (cg_rank(g) == 0)
        atomicAdd(sum, block_sum);
}

int main(void) {
    int n = 1 << 24;
    int blockSize = 256;
    int nBlocks = (n + blockSize - 1) / blockSize;
    int sharedBytes = blockSize * sizeof(int);
    int result;
    int *sum, *data;
    
    hipMallocManaged(&sum, sizeof(int));
    hipMallocManaged(&data, n * sizeof(int));
    
    std::fill_n(data, n, rand());
    int cpu_res = std::accumulate(data, data + n, 0);

    hipMemset(sum, 0, sizeof(int));

    hipLaunchKernelGGL(sum_kernel_block, nBlocks, blockSize, sharedBytes, 0, sum, data, n);

    hipDeviceSynchronize();
    hipMemcpy(&result, sum, sizeof(int), hipMemcpyDeviceToHost);
    printf("Sum of 16M array number = %d, expecting %d\n", result, cpu_res);

    hipFree(sum);
    hipFree(data);
}
