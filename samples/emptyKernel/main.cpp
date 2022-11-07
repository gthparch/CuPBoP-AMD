#include "cuda_runtime.h"
#include "stdio.h"

int main(int argc, char *argv[]) {

  printf("Testing main");
  int device;
  cudaDeviceProp prop;

  cudaGetDevice(&device); // test runtime mapped

  cudaGetDeviceProperties(&prop, device);
}