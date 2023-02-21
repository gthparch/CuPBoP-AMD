#include <stddef.h>
#include <string.h> 
#include <stdint.h>
#include "hip/hip_runtime_api.h"
#include "hip/driver_types.h"

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

// the hip runtime api only shows these format kinds
enum cudaChannelFormatKind {
  cudaChannelFormatKindSigned,
  cudaChannelFormatKindUnsigned, 
  cudaChannelFormatKindFloat,
  cudaChannelFormatKindNone,  
};

enum cudaResourceType {
  cudaResourceTypeArray,
  cudaResourceTypeMipmappedArray,
  cudaResourceTypeLinear,
  cudaResourceTypePitch2D, 
};


typedef struct CUuuid_st {                                /**< CUDA definition of UUID */
    char bytes[16];
} CUuuid;

typedef  struct CUuuid_st cudaUUID_t;

// typedef uint8_t CUstream_st*;
typedef struct ihipStream_t* cudaStream_t;

typedef struct ihipEvent_t* cudaEvent_t;

typedef void (*cudaStreamCallback_t)(cudaStream_t stream, hipError_t status, void* userData);


typedef hipTextureObject_t cudaTextureObject_t;
typedef hipSurfaceObject_t cudaSurfaceObject_t;
#define cudaTextureType1D hipTextureType1D
#define cudaTextureType1DLayered hipTextureType1DLayered
#define cudaTextureType2D hipTextureType2D
#define cudaTextureType2DLayered hipTextureType2DLayered
#define cudaTextureType3D hipTextureType3D
#define cudaArray_t hipArray_t
#define cudaArray_const_t hipArray_const_t

typedef hipMipmappedArray_t cudaMipmappedArray_t;
typedef hipMipmappedArray_const_t  cudaMipmappedArray_const_t;
typedef hipChannelFormatDesc  cudaChannelFormatDesc ;
typedef hipResourceDesc cudaResourceDesc;
typedef hipTextureDesc cudaTextureDesc;
typedef struct hipResourceViewDesc cudaResourceViewDesc;

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

cudaError_t cudaGetDeviceCount(int *count);

cudaError_t cudaGetDeviceProperties (cudaDeviceProp* prop, int  device);

cudaError_t cudaDeviceReset ();

cudaError_t cudaGetLastError ();

cudaError_t cudaPeekAtLastError ();

cudaError_t cudaMalloc (void ** devPtr, size_t size);

cudaError_t cudaMallocArray(cudaArray_t* array, const cudaChannelFormatDesc* desc, size_t width, size_t height, unsigned int  flags);

cudaError_t cudaMallocPitch(void **devPtr, size_t *pitch, size_t width, size_t height);

cudaError_t cudaFree (void * ptr);

cudaError_t cudaHostAlloc (void** ptr, size_t size, unsigned int flag);

cudaError_t cudaMemcpy (void* dst, const void* src, size_t count, cudaMemcpyKind kind);

cudaError_t cudaMemcpy2D(void * dst, size_t dpitch, const void * src, size_t spitch, size_t width,
    size_t 	height, cudaMemcpyKind kind);

cudaError_t cudaLaunchKernel (const void* func, dim3 gridDim, dim3 blockDim, void** args, size_t sharedMem, cudaStream_t stream);

cudaError_t cudaDeviceSynchronize();

/// Deprecated by Nvidia's documents and replaced by cudaDeviceSynchronize()
cudaError_t cudaThreadSynchronize();

cudaError_t cudaMemset(void* devPtr, int  value, size_t count);

cudaError_t cudaEventElapsedTime (float* ms, cudaEvent_t start, cudaEvent_t end);

cudaError_t cudaEventDestroy (cudaEvent_t event);

cudaError_t cudaEventSynchronize (cudaEvent_t event);

cudaError_t cudaEventRecord (cudaEvent_t event, cudaStream_t stream);

cudaError_t cudaEventCreate (cudaEvent_t* event);

const char* cudaGetErrorString(cudaError_t error);

cudaError_t cudaStreamAddCallback(cudaStream_t stream, cudaStreamCallback_t callback, void* userData, unsigned int flags);

cudaError_t cudaStreamQuery(cudaStream_t stream);

cudaError_t cudaStreamWaitEvent(cudaStream_t stream, cudaEvent_t event, unsigned int flags);

cudaError_t cudaStreamGetPriority(cudaStream_t stream, int *priority);

cudaError_t cudaStreamGetFlags(cudaStream_t stream, unsigned int *flags);

cudaError_t cudaStreamDestroy(cudaStream_t stream);

cudaError_t cudaStreamSynchronize(cudaStream_t stream);

cudaError_t cudaStreamCreate(cudaStream_t* stream);

cudaError_t cudaDeviceGetStreamPriorityRange(int* leastPriority, int* greatestPriority);

cudaError_t cudaStreamCreateWithPriority(cudaStream_t* stream, unsigned int flags, int priority);

cudaError_t cudaStreamCreateWithFlags(cudaStream_t stream, unsigned int flags);

cudaChannelFormatDesc cudaCreateChannelDesc(int  x, int  y, int  z, int  w, cudaChannelFormatKind f);

cudaError_t cudaDestroyTextureObject ( cudaTextureObject_t texObject );

cudaError_t cudaCreateTextureObject(cudaTextureObject_t* pTexObject, const cudaResourceDesc* pResDesc, const cudaTextureDesc* pTexDesc, const cudaResourceViewDesc* pResViewDesc);

cudaError_t cudaGetChannelDesc(cudaChannelFormatDesc* desc, cudaArray_const_t array);

cudaError_t cudaGetTextureObjectResourceDesc(cudaResourceDesc* pResDesc, cudaTextureObject_t texObject);

cudaError_t cudaGetTextureObjectResourceViewDesc(cudaResourceViewDesc* pResViewDesc, cudaTextureObject_t texObject);

cudaError_t cudaGetTextureObjectTextureDesc(cudaTextureDesc* pTexDesc, cudaTextureObject_t texObject);

cudaError_t cudaBindTexture2D(size_t* offset, const textureReference* texref, const void* devPtr, const cudaChannelFormatDesc* desc, 
   size_t width, size_t height, size_t pitch);


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
