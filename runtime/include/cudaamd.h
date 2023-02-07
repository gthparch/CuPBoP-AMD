#include <stddef.h>
#include <string.h> 
#include <stdint.h>
#include "hip/hip_runtime_api.h"

extern "C" {
// typedef __int32 int32_t;
// typedef unsigned __int32 uint32_t;

enum cudaError_t {
  cudaSuccess,
  cudaErrorInvalidValue 
};

enum cudaMemcpyKind {
  cudaMemcpyHostToHost,
  cudaMemcpyHostToDevice,
  cudaMemcpyDeviceToHost,
  cudaMemcpyDeviceToDevice,
  cudaMemcpyDefault
};

typedef struct CUuuid_st {                                /**< CUDA definition of UUID */
    char bytes[16];
} CUuuid;

typedef  struct CUuuid_st cudaUUID_t;

// typedef uint8_t CUstream_st*;
typedef struct ihipStream_t* cudaStream_t;

typedef struct ihipEvent_t* cudaEvent_t;


struct cudaDeviceProp {
      char name[256];
      cudaUUID_t uuid;
      size_t totalGlobalMem;
      size_t sharedMemPerBlock;
      int regsPerBlock;
      int warpSize;
      size_t memPitch;
      int maxThreadsPerBlock;
      int maxThreadsDim[3];
      int maxGridSize[3];
      int clockRate;
      size_t totalConstMem;
      int major;
      int minor;
      size_t textureAlignment;
      size_t texturePitchAlignment;
      int deviceOverlap;
      int multiProcessorCount;
      int kernelExecTimeoutEnabled;
      int integrated;
      int canMapHostMemory;
      int computeMode;
      int maxTexture1D;
      int maxTexture1DMipmap;
      int maxTexture1DLinear;
      int maxTexture2D[2];
      int maxTexture2DMipmap[2];
      int maxTexture2DLinear[3];
      int maxTexture2DGather[2];
      int maxTexture3D[3];
      int maxTexture3DAlt[3];
      int maxTextureCubemap;
      int maxTexture1DLayered[2];
      int maxTexture2DLayered[3];
      int maxTextureCubemapLayered[2];
      int maxSurface1D;
      int maxSurface2D[2];
      int maxSurface3D[3];
      int maxSurface1DLayered[2];
      int maxSurface2DLayered[3];
      int maxSurfaceCubemap;
      int maxSurfaceCubemapLayered[2];
      size_t surfaceAlignment;
      int concurrentKernels;
      int ECCEnabled;
      int pciBusID;
      int pciDeviceID;
      int pciDomainID;
      int tccDriver;
      int asyncEngineCount;
      int unifiedAddressing;
      int memoryClockRate;
      int memoryBusWidth;
      int l2CacheSize;
      int persistingL2CacheMaxSize;
      int maxThreadsPerMultiProcessor;
      int streamPrioritiesSupported;
      int globalL1CacheSupported;
      int localL1CacheSupported;
      size_t sharedMemPerMultiprocessor;
      int regsPerMultiprocessor;
      int managedMemory;
      int isMultiGpuBoard;
      int multiGpuBoardGroupID;
      int singleToDoublePrecisionPerfRatio;
      int pageableMemoryAccess;
      int concurrentManagedAccess;
      int computePreemptionSupported;
      int canUseHostPointerForRegisteredMem;
      int cooperativeLaunch;
      int cooperativeMultiDeviceLaunch;
      int pageableMemoryAccessUsesHostPageTables;
      int directManagedMemAccessFromHost;
      int accessPolicyMaxWindowSize;
};

typedef struct callParams {
  dim3 gridDim;
  dim3 blockDim;
  size_t shareMem;
  void *stream;
} callParams;


cudaError_t cudaGetDevice(int *devPtr);

cudaError_t cudaGetDeviceProperties (cudaDeviceProp* prop, int  device);

cudaError_t cudaDeviceReset ();

cudaError_t cudaGetLastError ();

cudaError_t cudaPeekAtLastError ();

cudaError_t cudaGetDevice (int *devPtr);

cudaError_t cudaGetDeviceProperties (cudaDeviceProp* prop, int  device );

cudaError_t cudaMalloc (void ** devPtr, size_t size);

cudaError_t cudaFree (void * ptr);

cudaError_t cudaHostAlloc (void** ptr, size_t size, unsigned int flag);

cudaError_t cudaMemcpy (void* dst, const void* src, size_t count, cudaMemcpyKind kind);

cudaError_t cudaLaunchKernel (const void* func, dim3 gridDim, dim3 blockDim, void** args, size_t sharedMem, cudaStream_t stream);

cudaError_t cudaDeviceSynchronize();

cudaError_t cudaMemset(void* devPtr, int  value, size_t count);

cudaError_t cudaEventElapsedTime (float* ms, cudaEvent_t start, cudaEvent_t end);

cudaError_t cudaEventDestroy (cudaEvent_t event);

cudaError_t cudaEventSynchronize (cudaEvent_t event);

cudaError_t cudaEventRecord (cudaEvent_t event, cudaStream_t stream);

cudaError_t cudaEventCreate (cudaEvent_t* event);

const char* cudaGetErrorString(cudaError_t error);

void** __hipRegisterFatBinary(const void* data);


void __hipRegisterFunction(
  void** modules,
  const void*  hostFunction,
  char*        deviceFunction,
  const char*  deviceName,
  unsigned int threadLimit,
  uint3*       tid,
  uint3*       bid,
  dim3*        blockDim,
  dim3*        gridDim,
  int*         wSize);

void __hipRegisterVar(
  void** modules,   // The device modules containing code object
  void*       var,       // The shadow variable in host code
  char*       hostVar,   // Variable name in host code
  char*       deviceVar, // Variable name in device code
  int         ext,       // Whether this variable is external
  size_t      size,      // Size of the variable
  int         constant,  // Whether this variable is constant
  int         global);


void __hipRegisterManagedVar(void *hipModule,   // Pointer to hip module returned from __hipRegisterFatbinary
                                        void **pointer,    // Pointer to a chunk of managed memory with size \p size and alignment \p align
                                                           // HIP runtime allocates such managed memory and assign it to \p pointer
                                        void *init_value,  // Initial value to be copied into \p pointer
                                        const char *name,  // Name of the variable in code object
                                        size_t size,
                                        unsigned align);


void __hipRegisterTexture(void** modules,      // The device modules containing code object
                                     void* var,        // The shadow variable in host code
                                     char* hostVar,    // Variable name in host code
                                     char* deviceVar,  // Variable name in device code
                                     int type, int norm, int ext);


void __hipRegisterSurface(void** modules,      // The device modules containing code object
void* var,        // The shadow variable in host code
char* hostVar,    // Variable name in host code
char* deviceVar,  // Variable name in device code
int type, int ext); 


void __hipUnregisterFatBinary(void** modules);
}
