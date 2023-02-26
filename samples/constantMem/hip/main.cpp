


// #define BLOCKS 2

// __constant__ float factors[BLOCKS];

// __global__ void sum_and_multiply(const float * A, const float * B, float * C, const int size)
// {
//     int item = (blockIdx.x * blockDim.x) + threadIdx.x;
//     C[item] = (A[item] + B[item]) * factors[blockIdx.x];
// }


// http://codeofhonour.blogspot.com/2014/10/memories-from-cudda.html

#include <stdio.h>
#include <hip/hip_runtime.h>
// #include "helper_hip.h"

#define S 4

/** HOST-side data */
int host_const[S] = { 100, 200, 300, 400 };

/* Some host-side vector */
int host_y[S] = { 1, 2, 3, 4 };

/* Address of device-side variable y */
int *dev_y;

/* Variable in the constant memory of the GPU */
__constant__ int dev_const_a[4];


/*
Output

101
202
303
404

*/

/** 
 * Our kernel that adds the constant variable dev_const_a 
 * to the given variable. 
 */
__global__ void kernel(int *dev_var) {
	dev_var[threadIdx.x] += dev_const_a[threadIdx.x];
}

int main(void) {

  int data_size = S * sizeof(int);
  int i;

  /* Allocate space on the device for dev_y */
 hipMalloc((void** ) &dev_y, data_size);

  /* 
   * Copy data from the host to the device constant memory
   * host_const ---> dev_const_a
   */
 
    hipMemcpyToSymbol(dev_const_a, host_const, data_size, 0,
    hipMemcpyHostToDevice);

  /*
   * Copy data onto the device:
   * host_y ---> dev_y
   */

    hipMemcpy(dev_y, host_y, data_size, hipMemcpyHostToDevice);

  /*
   * Run the kernel
   */
  kernel<<<1, S>>>(dev_y);
  hipDeviceSynchronize(); 
//   getLasthipError("Kernel error");  /* Check for kernel errors! */

  /*
   * Copy data from the device back to the hsot
   *  dev_y ---> host_y
   */
  hipMemcpy(host_y, dev_y, data_size, hipMemcpyDeviceToHost);

  for (i = 0; i < S; i++) {
    printf("%d\n", host_y[i]);
  }
  if (dev_y != NULL)
    hipFree(dev_y);
  
  return 0;
}