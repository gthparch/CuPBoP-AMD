#include "cuda_runtime.h"
#include "stdio.h"
__global__ void empty(int* N) {
  *N = 10;
}

int main(int argc, char **argv) { 
  int * host_n;
  int * device_n;

  host_n = (int*)malloc(sizeof(int));
  cudaMalloc(&device_n, sizeof(int));

  empty<<<1,1>>>(device_n);

  cudaMemcpy(host_n, device_n, sizeof(int), cudaMemcpyDeviceToHost );

  if(*host_n == 10) {
    printf("Success \n");
  }

  cudaFree(device_n);
  return 0;
}
