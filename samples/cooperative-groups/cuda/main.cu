#include <cuda.h>
#include <cooperative_groups.h>
#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <numeric>

namespace cg = cooperative_groups;

// __device__ int reduce_sum(cg::thread_group g, int *temp,
//                           int val) {

//     int lane = g.thread_rank();

//     for (int i = g.size() / 2; i > 0; i /= 2) {

//         temp[lane] = val;
//         g.sync();
//         if (lane < i)
//             val += temp[lane + i];
//         g.sync();
//     }
//     // printf("val returned in reduced_sum =%d\n",val);
//     return val;
// }

// __device__ int thread_sum(int *input, int n) {
//     int sum = 0;
//     for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n / 4;
//          i += blockDim.x * gridDim.x) {
//         int4 in = ((int4 *)input)[i];
//         sum += in.x + in.y + in.z + in.w;
//     }
//     // printf("sum returned from thrad_sum =%d\n",sum);
//     return sum;
// }

// struct tg_data {
//     unsigned int is_tiled : 1;
//     unsigned int type : 7;
//     unsigned int size : 24;
//     // packed to 4b
//     unsigned int metaGroupSize : 16;
//     unsigned int metaGroupRank : 16;
//     // packed to 8b
//     unsigned int mask;
//     // packed to 12b
//     unsigned int _res;
// };

__global__ void sum_kernel_block(int *sum, int *input, int n) {
    // extern __shared__ int temp[];
    // int my_sum = thread_sum(input, n);
    auto g = cg::this_thread_block();
    // int block_sum = reduce_sum(g, temp, my_sum);
    int i = g.thread_rank();
    int s = g.size();

    g.sync();
    
    if (threadIdx.x < 5 && blockIdx.x == 1) {
        printf("Rank %d, Size %d, TID.x = %d, BID.x = %d\n", i, s, threadIdx.x, blockIdx.x);
    }

    // if (threadIdx.x == 0 && blockIdx.x == 0) {
    //     printf("Size is %d, rank is %d\n", g.size(), g.thread_rank());
    // }

    // if (g.thread_rank() == 0)
    //     atomicAdd(sum, block_sum);
}

int main(void) {
    int n = 1 << 24;
    int blockSize = 256;
    int nBlocks = (n + blockSize - 1) / blockSize;
    int sharedBytes = blockSize * sizeof(int);
    int result;
    int *sum, *data;
    
    cudaMallocManaged(&sum, sizeof(int));
    cudaMallocManaged(&data, n * sizeof(int));

    std::fill_n(data, n, rand());
    int cpu_res = std::accumulate(data, data + n, 0);

    cudaMemset(sum, 0, sizeof(int));

    sum_kernel_block<<<nBlocks, blockSize, sharedBytes>>>(sum, data, n);
    cudaMemcpy(&result, sum, sizeof(int), cudaMemcpyDeviceToHost);
    printf("Sum of 16M array number = %d, expecting %d\n", result, cpu_res);

    cudaFree(sum);
    cudaFree(data);
}
