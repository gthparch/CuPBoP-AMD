#pragma once

// Because HIPIFY-perl cannot translate header files, we define a set of macros
// that replaces some of the symbols with HIP compatible ones. This shouldn't
// affect performance in any ways.
#if defined(__HIPCC__)
#define cudaStream_t hipStream_t
#define cudaEvent_t hipEvent_t
#define cudaError_t hipError_t
#define cudaDeviceProp hipDeviceProp_t

#define cudaSuccess hipSuccess
#define cudaMalloc hipMalloc
#define cudaFree hipFree
#define cudaMemcpy hipMemcpy
#define cudaMemcpyAsync hipMemcpyAsync
#define cudaMemcpyHostToDevice hipMemcpyHostToDevice
#define cudaMemcpyDeviceToHost hipMemcpyDeviceToHost
#define cudaMemset hipMemset
#define cudaEventCreate hipEventCreate
#define cudaEventRecord hipEventRecord
#define cudaEventSynchronize hipEventSynchronize
#define cudaStreamCreate hipStreamCreate
#define cudaStreamSynchronize hipStreamSynchronize
#define cudaEventElapsedTime hipEventElapsedTime
#define cudaGetErrorString hipGetErrorString
#define cudaGetDeviceProperties hipGetDeviceProperties
#define cudaSetDevice hipSetDevice
#define cudaGetDeviceCount hipGetDeviceCount
#endif
