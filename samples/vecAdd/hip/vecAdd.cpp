#include "hip/hip_runtime.h"


__global__ void vecAdd(int *A, int *B, int* C, int N) {
  int index = blockDim.x * blockIdx.x + threadIdx.x;
  if (index < 10) {
    C[index] = A[index] + B[index];
  }
}
