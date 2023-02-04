#include "hip/hip_runtime.h"
#include <stdio.h>
#include <stdlib.h>

__global__ void test(int *N) {

  __shared__ int s[32];
  int t = threadIdx.x;
  if (t == 0) {
    s[10] = 20;
    N[0] = s[10];
  }

}


int main() {


  int* host_n;
  host_n = (int*) calloc(32, sizeof(int));

  int* device_n;

  hipMalloc(&device_n, sizeof(int)*32);

  hipMemcpy(device_n, host_n, sizeof(int)*32, hipMemcpyHostToDevice);


  test<<<1,1>>>(device_n);

  if (host_n[0] == 20) {
    printf("Success \n");
  }

  hipMemcpy(host_n, device_n, sizeof(int)*32, hipMemcpyDeviceToHost);


  hipFree(device_n);
  free(host_n);

  return 0;
}