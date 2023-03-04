#include "hip/driver_types.h"
#include "hip/hip_runtime_api.h"
#include <stddef.h>
#include <stdint.h>
#include <string.h>

extern "C" {
// typedef __int32 int32_t;
// typedef unsigned __int32 uint32_t;

enum cudaError_t { cudaSuccess, cudaErrorInvalidValue };

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

enum cudaFuncCache {
    cudaFuncCachePreferNone = 0,
    cudaFuncCachePreferShared = 1,
    cudaFuncCachePreferL1 = 2,
    cudaFuncCachePreferEqual = 3
};

typedef struct CUuuid_st { /**< CUDA definition of UUID */
    char bytes[16];
} CUuuid;

typedef struct CUuuid_st cudaUUID_t;

// typedef uint8_t CUstream_st*;
typedef struct ihipStream_t *cudaStream_t;

typedef struct ihipEvent_t *cudaEvent_t;

typedef void (*cudaStreamCallback_t)(cudaStream_t stream, hipError_t status,
                                     void *userData);

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
typedef hipMipmappedArray_const_t cudaMipmappedArray_const_t;
typedef hipChannelFormatDesc cudaChannelFormatDesc;
typedef hipResourceDesc cudaResourceDesc;
typedef hipTextureDesc cudaTextureDesc;
typedef struct hipResourceViewDesc cudaResourceViewDesc;

typedef struct cudaDeviceProp {
    char         name[256];                  /**< ASCII string identifying device */
    cudaUUID_t   uuid;                       /**< 16-byte unique identifier */
    char         luid[8];                    /**< 8-byte locally unique identifier. Value is undefined on TCC and non-Windows platforms */
    unsigned int luidDeviceNodeMask;         /**< LUID device node mask. Value is undefined on TCC and non-Windows platforms */
    size_t       totalGlobalMem;             /**< Global memory available on device in bytes */
    size_t       sharedMemPerBlock;          /**< Shared memory available per block in bytes */
    int          regsPerBlock;               /**< 32-bit registers available per block */
    int          warpSize;                   /**< Warp size in threads */
    size_t       memPitch;                   /**< Maximum pitch in bytes allowed by memory copies */
    int          maxThreadsPerBlock;         /**< Maximum number of threads per block */
    int          maxThreadsDim[3];           /**< Maximum size of each dimension of a block */
    int          maxGridSize[3];             /**< Maximum size of each dimension of a grid */
    int          clockRate;                  /**< Clock frequency in kilohertz */
    size_t       totalConstMem;              /**< Constant memory available on device in bytes */
    int          major;                      /**< Major compute capability */
    int          minor;                      /**< Minor compute capability */
    size_t       textureAlignment;           /**< Alignment requirement for textures */
    size_t       texturePitchAlignment;      /**< Pitch alignment requirement for texture references bound to pitched memory */
    int          deviceOverlap;              /**< Device can concurrently copy memory and execute a kernel. Deprecated. Use instead asyncEngineCount. */
    int          multiProcessorCount;        /**< Number of multiprocessors on device */
    int          kernelExecTimeoutEnabled;   /**< Specified whether there is a run time limit on kernels */
    int          integrated;                 /**< Device is integrated as opposed to discrete */
    int          canMapHostMemory;           /**< Device can map host memory with cudaHostAlloc/cudaHostGetDevicePointer */
    int          computeMode;                /**< Compute mode (See ::cudaComputeMode) */
    int          maxTexture1D;               /**< Maximum 1D texture size */
    int          maxTexture1DMipmap;         /**< Maximum 1D mipmapped texture size */
    int          maxTexture1DLinear;         /**< Deprecated, do not use. Use cudaDeviceGetTexture1DLinearMaxWidth() or cuDeviceGetTexture1DLinearMaxWidth() instead. */
    int          maxTexture2D[2];            /**< Maximum 2D texture dimensions */
    int          maxTexture2DMipmap[2];      /**< Maximum 2D mipmapped texture dimensions */
    int          maxTexture2DLinear[3];      /**< Maximum dimensions (width, height, pitch) for 2D textures bound to pitched memory */
    int          maxTexture2DGather[2];      /**< Maximum 2D texture dimensions if texture gather operations have to be performed */
    int          maxTexture3D[3];            /**< Maximum 3D texture dimensions */
    int          maxTexture3DAlt[3];         /**< Maximum alternate 3D texture dimensions */
    int          maxTextureCubemap;          /**< Maximum Cubemap texture dimensions */
    int          maxTexture1DLayered[2];     /**< Maximum 1D layered texture dimensions */
    int          maxTexture2DLayered[3];     /**< Maximum 2D layered texture dimensions */
    int          maxTextureCubemapLayered[2];/**< Maximum Cubemap layered texture dimensions */
    int          maxSurface1D;               /**< Maximum 1D surface size */
    int          maxSurface2D[2];            /**< Maximum 2D surface dimensions */
    int          maxSurface3D[3];            /**< Maximum 3D surface dimensions */
    int          maxSurface1DLayered[2];     /**< Maximum 1D layered surface dimensions */
    int          maxSurface2DLayered[3];     /**< Maximum 2D layered surface dimensions */
    int          maxSurfaceCubemap;          /**< Maximum Cubemap surface dimensions */
    int          maxSurfaceCubemapLayered[2];/**< Maximum Cubemap layered surface dimensions */
    size_t       surfaceAlignment;           /**< Alignment requirements for surfaces */
    int          concurrentKernels;          /**< Device can possibly execute multiple kernels concurrently */
    int          ECCEnabled;                 /**< Device has ECC support enabled */
    int          pciBusID;                   /**< PCI bus ID of the device */
    int          pciDeviceID;                /**< PCI device ID of the device */
    int          pciDomainID;                /**< PCI domain ID of the device */
    int          tccDriver;                  /**< 1 if device is a Tesla device using TCC driver, 0 otherwise */
    int          asyncEngineCount;           /**< Number of asynchronous engines */
    int          unifiedAddressing;          /**< Device shares a unified address space with the host */
    int          memoryClockRate;            /**< Peak memory clock frequency in kilohertz */
    int          memoryBusWidth;             /**< Global memory bus width in bits */
    int          l2CacheSize;                /**< Size of L2 cache in bytes */
    int          persistingL2CacheMaxSize;   /**< Device's maximum l2 persisting lines capacity setting in bytes */
    int          maxThreadsPerMultiProcessor;/**< Maximum resident threads per multiprocessor */
    int          streamPrioritiesSupported;  /**< Device supports stream priorities */
    int          globalL1CacheSupported;     /**< Device supports caching globals in L1 */
    int          localL1CacheSupported;      /**< Device supports caching locals in L1 */
    size_t       sharedMemPerMultiprocessor; /**< Shared memory available per multiprocessor in bytes */
    int          regsPerMultiprocessor;      /**< 32-bit registers available per multiprocessor */
    int          managedMemory;              /**< Device supports allocating managed memory on this system */
    int          isMultiGpuBoard;            /**< Device is on a multi-GPU board */
    int          multiGpuBoardGroupID;       /**< Unique identifier for a group of devices on the same multi-GPU board */
    int          hostNativeAtomicSupported;  /**< Link between the device and the host supports native atomic operations */
    int          singleToDoublePrecisionPerfRatio; /**< Ratio of single precision performance (in floating-point operations per second) to double precision performance */
    int          pageableMemoryAccess;       /**< Device supports coherently accessing pageable memory without calling cudaHostRegister on it */
    int          concurrentManagedAccess;    /**< Device can coherently access managed memory concurrently with the CPU */
    int          computePreemptionSupported; /**< Device supports Compute Preemption */
    int          canUseHostPointerForRegisteredMem; /**< Device can access host registered memory at the same virtual address as the CPU */
    int          cooperativeLaunch;          /**< Device supports launching cooperative kernels via ::cudaLaunchCooperativeKernel */
    int          cooperativeMultiDeviceLaunch; /**< Deprecated, cudaLaunchCooperativeKernelMultiDevice is deprecated. */
    size_t       sharedMemPerBlockOptin;     /**< Per device maximum shared memory per block usable by special opt in */
    int          pageableMemoryAccessUsesHostPageTables; /**< Device accesses pageable memory via the host's page tables */
    int          directManagedMemAccessFromHost; /**< Host can directly access managed memory on the device without migration. */
    int          maxBlocksPerMultiProcessor; /**< Maximum number of resident blocks per multiprocessor */
    int          accessPolicyMaxWindowSize;  /**< The maximum value of ::cudaAccessPolicyWindow::num_bytes. */
    size_t       reservedSharedMemPerBlock;  /**< Shared memory reserved by CUDA driver per block in bytes */
} cudaDeviceProp;

typedef struct callParams {
    dim3 gridDim;
    dim3 blockDim;
    size_t shareMem;
    void *stream;
} callParams;

cudaError_t cudaSetDevice(int device);

cudaError_t cudaGetDevice(int *devPtr);

cudaError_t cudaGetDeviceCount(int *count);

cudaError_t cudaFuncSetCacheConfig(const void *func, cudaFuncCache cacheConfig);

cudaError_t cudaGetDeviceProperties(cudaDeviceProp *prop, int device);

cudaError_t cudaDeviceReset();

cudaError_t cudaThreadExit();

cudaError_t cudaSetDeviceFlags(unsigned int flags);

cudaError_t cudaHostGetDevicePointer(void **pDevice, void *pHost,
                                     unsigned int flags);

cudaError_t cudaGetLastError();

cudaError_t cudaPeekAtLastError();

cudaError_t cudaMalloc(void **devPtr, size_t size);

cudaError_t cudaMallocHost(void **hostPtr, size_t size);

cudaError_t cudaMallocArray(cudaArray_t *array,
                            const cudaChannelFormatDesc *desc, size_t width,
                            size_t height, unsigned int flags);

cudaError_t cudaMallocPitch(void **devPtr, size_t *pitch, size_t width,
                            size_t height);

cudaError_t cudaFree(void *ptr);

cudaError_t cudaFreeHost(void *ptr);

cudaError_t cudaHostAlloc(void **ptr, size_t size, unsigned int flag);

cudaError_t cudaMemcpy(void *dst, const void *src, size_t count,
                       cudaMemcpyKind kind);

cudaError_t cudaMemcpyAsync(void *dst, const void *src, size_t count,
                            cudaMemcpyKind kind, cudaStream_t stream = 0);

cudaError_t cudaMemcpyToSymbol(const void *symbol, const void *src,
                               size_t count, size_t offset = 0,
                               cudaMemcpyKind kind = cudaMemcpyHostToDevice);

cudaError_t cudaMemcpy2D(void *dst, size_t dpitch, const void *src,
                         size_t spitch, size_t width, size_t height,
                         cudaMemcpyKind kind);

cudaError_t cudaLaunchKernel(const void *func, dim3 gridDim, dim3 blockDim,
                             void **args, size_t sharedMem,
                             cudaStream_t stream);

cudaError_t cudaDeviceSynchronize();

/// Deprecated by Nvidia's documents and replaced by cudaDeviceSynchronize()
cudaError_t cudaThreadSynchronize();

cudaError_t cudaMemset(void *devPtr, int value, size_t count);

cudaError_t cudaEventElapsedTime(float *ms, cudaEvent_t start, cudaEvent_t end);

cudaError_t cudaEventDestroy(cudaEvent_t event);

cudaError_t cudaEventSynchronize(cudaEvent_t event);

cudaError_t cudaEventRecord(cudaEvent_t event, cudaStream_t stream);

cudaError_t cudaEventCreate(cudaEvent_t *event);

const char *cudaGetErrorString(cudaError_t error);

cudaError_t cudaStreamAddCallback(cudaStream_t stream,
                                  cudaStreamCallback_t callback, void *userData,
                                  unsigned int flags);

cudaError_t cudaStreamQuery(cudaStream_t stream);

cudaError_t cudaStreamWaitEvent(cudaStream_t stream, cudaEvent_t event,
                                unsigned int flags);

cudaError_t cudaStreamGetPriority(cudaStream_t stream, int *priority);

cudaError_t cudaStreamGetFlags(cudaStream_t stream, unsigned int *flags);

cudaError_t cudaStreamDestroy(cudaStream_t stream);

cudaError_t cudaStreamSynchronize(cudaStream_t stream);

cudaError_t cudaStreamCreate(cudaStream_t *stream);

cudaError_t cudaDeviceGetStreamPriorityRange(int *leastPriority,
                                             int *greatestPriority);

cudaError_t cudaStreamCreateWithPriority(cudaStream_t *stream,
                                         unsigned int flags, int priority);

cudaError_t cudaStreamCreateWithFlags(cudaStream_t stream, unsigned int flags);

cudaChannelFormatDesc cudaCreateChannelDesc(int x, int y, int z, int w,
                                            cudaChannelFormatKind f);

cudaError_t cudaDestroyTextureObject(cudaTextureObject_t texObject);

cudaError_t cudaCreateTextureObject(cudaTextureObject_t *pTexObject,
                                    const cudaResourceDesc *pResDesc,
                                    const cudaTextureDesc *pTexDesc,
                                    const cudaResourceViewDesc *pResViewDesc);

cudaError_t cudaGetChannelDesc(cudaChannelFormatDesc *desc,
                               cudaArray_const_t array);

cudaError_t cudaGetTextureObjectResourceDesc(cudaResourceDesc *pResDesc,
                                             cudaTextureObject_t texObject);

cudaError_t
cudaGetTextureObjectResourceViewDesc(cudaResourceViewDesc *pResViewDesc,
                                     cudaTextureObject_t texObject);

cudaError_t cudaGetTextureObjectTextureDesc(cudaTextureDesc *pTexDesc,
                                            cudaTextureObject_t texObject);

cudaError_t cudaBindTexture(size_t *offset, const textureReference *texref,
                            const void *devPtr,
                            const cudaChannelFormatDesc *desc, size_t size);

cudaError_t cudaBindTexture2D(size_t *offset, const textureReference *texref,
                              const void *devPtr,
                              const cudaChannelFormatDesc *desc, size_t width,
                              size_t height, size_t pitch);

cudaError_t cudaUnbindTexture(const textureReference *texref);

void **__hipRegisterFatBinary(const void *data);

void __hipRegisterFunction(void **modules, const void *hostFunction,
                           char *deviceFunction, const char *deviceName,
                           unsigned int threadLimit, uint3 *tid, uint3 *bid,
                           dim3 *blockDim, dim3 *gridDim, int *wSize);

void __hipRegisterVar(
    void **modules,  // The device modules containing code object
    void *var,       // The shadow variable in host code
    char *hostVar,   // Variable name in host code
    char *deviceVar, // Variable name in device code
    int ext,         // Whether this variable is external
    size_t size,     // Size of the variable
    int constant,    // Whether this variable is constant
    int global);

void __hipRegisterManagedVar(
    void *
        hipModule, // Pointer to hip module returned from __hipRegisterFatbinary
    void **pointer, // Pointer to a chunk of managed memory with size \p size
                    // and alignment \p align HIP runtime allocates such managed
                    // memory and assign it to \p pointer
    void *init_value, // Initial value to be copied into \p pointer
    const char *name, // Name of the variable in code object
    size_t size, unsigned align);

void __hipRegisterTexture(
    void **modules,  // The device modules containing code object
    void *var,       // The shadow variable in host code
    char *hostVar,   // Variable name in host code
    char *deviceVar, // Variable name in device code
    int type, int norm, int ext);

void __hipRegisterSurface(
    void **modules,  // The device modules containing code object
    void *var,       // The shadow variable in host code
    char *hostVar,   // Variable name in host code
    char *deviceVar, // Variable name in device code
    int type, int ext);

void __hipUnregisterFatBinary(void **modules);
}
