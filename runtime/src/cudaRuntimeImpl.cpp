#include "cudaamd.h"
#include <hip/hip_runtime.h>
#include "stdio.h"
#include <iostream>

#define HIP_CHECK(status)                                                                          \
    if (status != hipSuccess) {                                                                    \
        std::cout << "Got Status: " << status << " at Line: " << __LINE__ << std::endl;            \
        exit(0);                                                                                   \
    }

// https://docs.nvidia.com/cuda/cuda-runtime-api/structcudaDeviceProp.html

cudaError_t cudaGetDevice(int *devPtr) { 
  printf("insideGetDevice\n");
  HIP_CHECK(hipGetDevice(devPtr));
}

cudaError_t cudaGetDeviceProperties (cudaDeviceProp* prop, int  device)
{
  printf("Get Device Properties\n");
  hipDeviceProp_t dprops;
  HIP_CHECK(hipGetDeviceProperties( &dprops, device));
  memcpy(prop->name , dprops.name, sizeof(prop->name));
  prop->warpSize = dprops.warpSize;
  prop->clockRate = dprops.clockRate;
  printf("Device WarpSize: %d \n", prop->warpSize);
  printf("Device clockRate: %d \n", prop->clockRate);
}

