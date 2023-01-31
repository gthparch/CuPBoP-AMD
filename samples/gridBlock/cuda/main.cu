#include "cuda_runtime.h"
#include "stdio.h"

__global__ void test_blockdim(int *x, int *y, int *z)
{
    *x = blockDim.x;
    *y = blockDim.y;
    *z = blockDim.z;
}

__global__ void test_griddim(int *x, int *y, int *z)
{
    *x = gridDim.x;
    *y = gridDim.y;
    *z = gridDim.z;
}

int main()
{
    dim3 grid_size (1, 4, 5);
    dim3 block_size (3, 8, 2);

    int hostbuf[6];
    int *host_ntidx = hostbuf,
        *host_ntidy = hostbuf + 1,
        *host_ntidz = hostbuf + 2,
        *host_nctaidx = hostbuf + 3,
        *host_nctaidy = hostbuf + 4,
        *host_nctaidz = hostbuf + 5;
    int *device_ntidx, *device_ntidy, *device_ntidz, *device_nctaidx, *device_nctaidy, *device_nctaidz;

    cudaMalloc(&device_ntidx, sizeof(int));
    cudaMalloc(&device_ntidy, sizeof(int));
    cudaMalloc(&device_ntidz, sizeof(int));
    cudaMalloc(&device_nctaidx, sizeof(int));
    cudaMalloc(&device_nctaidy, sizeof(int));
    cudaMalloc(&device_nctaidz, sizeof(int));

    test_blockdim<<<grid_size, block_size>>>(device_ntidx, device_ntidy, device_ntidz);
    test_griddim<<<grid_size, block_size>>>(device_nctaidx, device_nctaidy, device_nctaidz);

    cudaDeviceSynchronize();
    cudaMemcpy(host_ntidx, device_ntidx, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(host_ntidy, device_ntidy, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(host_ntidz, device_ntidz, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(host_nctaidx, device_nctaidx, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(host_nctaidy, device_nctaidy, sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(host_nctaidz, device_nctaidz, sizeof(int), cudaMemcpyDeviceToHost);

    if (*host_ntidx != block_size.x) {
        printf("Error: host_ntid.x = %d != %d\n", *host_ntidx, block_size.x);
        return 1;
    }

    if (*host_ntidy != block_size.y) {
        printf("Error: host_ntid.y = %d != %d\n", *host_ntidy, block_size.y);
        return 1;
    }

    if (*host_ntidz != block_size.z) {
        printf("Error: host_ntid.z = %d != %d\n", *host_ntidz, block_size.z);
        return 1;
    }

    if (*host_nctaidx != grid_size.x) {
        printf("Error: host_nctaid.x = %d != %d\n", *host_nctaidx, grid_size.x);
        return 1;
    }

    if (*host_nctaidy != grid_size.y) {
        printf("Error: host_nctaid.y = %d != %d\n", *host_nctaidy, grid_size.y);
        return 1;
    }

    if (*host_nctaidz != grid_size.z) {
        printf("Error: host_nctaid.z = %d != %d\n", *host_nctaidz, grid_size.z);
        return 1;
    }

    printf("Success!\n");

    cudaFree(device_ntidx);
    cudaFree(device_ntidy);
    cudaFree(device_ntidz);
    cudaFree(device_nctaidx);
    cudaFree(device_nctaidy);
    cudaFree(device_nctaidz);

    return 0;
}
