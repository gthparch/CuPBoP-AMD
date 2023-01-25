#include "hip/hip_runtime.h"

__global__ void run_printf() { 
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  int ty = threadIdx.y;
  int tz = threadIdx.z;
  printf("tid %d\n", tid);
  printf("ty: %d\n", ty);
  printf("tz: %d\n", tz);  
}


__global__ void run_printf1() { 
  int tid = blockIdx.y * blockDim.y + threadIdx.y;

  printf("tid %d\n", tid);
}

__global__ void run_printf2() { 
  int tid = blockIdx.z * blockDim.z + threadIdx.z;

  printf("tid %d\n", tid);
}

__global__ void run_printf3() { 
  int tid = blockIdx.z * blockDim.z + threadIdx.z;

  printf("tid %d\n", tid);
}


int main() {
    run_printf<<<1,1>>>();
    hipDeviceSynchronize();
    return 0;
}