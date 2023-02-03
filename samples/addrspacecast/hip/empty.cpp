#include "hip/hip_runtime.h"
#include "stdio.h"

__global__ void empty(int* N) {
  int a = 5;
  *N = 10;
  int myNum[3] = {10, 20, 30};
  int al = sizeof(myNum)/sizeof(myNum[0]);
  for(int i = 0; i< al; i++) {
    *N = *N + myNum[i] * a;
  }
}


int main(int argc, char **argv) { 
  int * host_n;
  int * device_n;

  host_n = (int*)malloc(sizeof(int));
  hipMalloc(&device_n, sizeof(int));

  empty<<<1,1>>>(device_n);

  hipMemcpy(host_n, device_n, sizeof(int), hipMemcpyDeviceToHost );

  if(*host_n == 10) {
    printf(" Success ");
  }

  hipFree(device_n);
  return 0;
}
