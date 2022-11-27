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
/*
cudaError_t cudaDeviceReset() {
  printf("insideDeviceReset\n")
  HIP_CHECK(hipDeviceReset());
}

cudaError_t cudaGetLastError() {
  printf("insideGetLastError\n")
  HIP_CHECK(hipGetLastError());
}

cudaError_t cudaPeekAtLastError() {
  printf("insidePeekAtLastError\n")
  HIP_CHECK(hipPeekAtLastError());
}

cudaError_t cudaGetDevice(int *devPtr) { 
  printf("insideGetDevice\n");
  HIP_CHECK(hipGetDevice(devPtr));
}
*/
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
/*
cudaError_t cudaMalloc (void ** devPtr, size_t size) {
  printf("insideCudaMalloc\n");
  HIP_CHECK(hipMalloc(ptr, size));
}

cudaError_t cudaFree (void* ptr) {
  printf("inside cudaFree\n")
  HIP_CHECK(hipFree(ptr));
}

cudaError_t cudaHostAlloc (void** ptr, size_t size, unsigned int flag) {
  printf("inside HostAlloc\n")
  HIP_CHECK(hipHostMalloc(ptr, size, flag));
}

cudaError_t cudaMemcpy (void* dst, const void* src, size_t count, cudaMemcpyKind kind) {
  printf("insideCudaMemcpy\n");
  HIP_CHECK(hipMemCpy(dst, src, count, (hipMemcpyKind)kind))
}

cudaError_t cudaLaunchKernel (const void* func, dim3 gridDim, dim3 blockDim, void** args, size_t sharedMem, cudaStream_t stream) {
  printf("insideCudaLaunchKernel\n");
  HIP_CHECK(hipLaunchKernel(func, gridDim, blockDim, args, sharedMem, (hipStream_t) stream));
}
*/