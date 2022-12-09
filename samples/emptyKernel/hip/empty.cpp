#include "hip/hip_runtime.h"

__global__ void empty(int *N) {
  *N = 10;
}


int main(int argc, char **argv) { 
  int * host_n;
  int * device_n;

  host_n = (int*)malloc(sizeof(int));
  hipMalloc(&device_n, sizeof(int));

  empty<<<1,1>>>(device_n);

  hipMemcpy(host_n, device_n, sizeof(int), hipMemcpyDeviceToHost );

  if(*host_n == 10) {
    printf("Success \n");
  }

  hipFree(device_n);
  return 0;
}