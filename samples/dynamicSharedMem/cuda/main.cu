#include "cuda_runtime.h"
#include <stdio.h>
#include <stdlib.h>

__global__ void test(int *N) {

  extern __shared__ int s[];
  int t = threadIdx.x;
  if (t == 0) {
    s[10] = 20;
    N[0] = s[10];
  }

}


int main() {


  int* host_n;
  int n = 32;
  host_n = (int*) calloc(32, sizeof(int));

  int* device_n;

  cudaMalloc(&device_n, sizeof(int)*32);

  cudaMemcpy(device_n, host_n, sizeof(int)*32, cudaMemcpyHostToDevice);


  test<<<2,2, n*sizeof(int)>>>(device_n);
  cudaMemcpy(host_n, device_n, sizeof(int)*32, cudaMemcpyDeviceToHost);

  if (host_n[0] == 20) {
    printf("Success \n");
  }

  cudaFree(device_n);
  free(host_n);

  return 0;
}