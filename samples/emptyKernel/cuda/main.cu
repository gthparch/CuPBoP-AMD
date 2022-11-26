#include "cuda_runtime.h"
#include "stdio.h"

__global__ void empty(int* N) {
  *N = 10;
}

int main(int argc, char *argv[]) {

  printf("Testing main");
  int device;
  cudaDeviceProp prop;

  cudaGetDevice(&device); // test runtime mapped

  cudaGetDeviceProperties(&prop, device);
  int n = 1;

  int *h_a;

  int *d_a;

  size_t bytes = n*sizeof(int);

  h_a = (int*)malloc(bytes);

  cudaMalloc(&d_a, bytes);


  for(int i = 0; i < n; i++ ) {
    h_a[i] = 0;
  }

  cudaMemcpy( d_a, h_a, bytes, cudaMemcpyHostToDevice);

  int blockSize, gridSize;

  blockSize = 1024;
  gridSize = (int)ceil((float)n/blockSize);


  empty<<<gridSize, blockSize>>>(d_a);

  cudaMemcpy( h_a, d_a, bytes, cudaMemcpyDeviceToHost );

  // check the value

  // h_a = 0
  if (h_a[0] == 10) {
    printf("correct \n");
  }


  cudaFree(d_a);
  free(h_a);

  return 0;

}