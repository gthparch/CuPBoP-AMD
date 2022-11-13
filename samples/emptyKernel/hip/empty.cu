#include "hip/hip_runtime.h"

__global__ void vecAdd(int *N) {
  *N = 10;
}