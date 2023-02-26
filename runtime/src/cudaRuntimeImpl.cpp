#include "cudaamd.h"
#include "stdio.h"
#include <hip/hip_runtime.h>
#include <hip/amd_detail/amd_channel_descriptor.h>
#include <hip/driver_types.h>
#include <iostream>

#define HIP_CHECK(status)                                                      \
    if (status != hipSuccess) {                                                \
        std::cout << "Got Status: " << status << " at Line: " << __LINE__      \
                  << std::endl;                                                \
        exit(0);                                                               \
    }

// https://docs.nvidia.com/cuda/cuda-runtime-api/structcudaDeviceProp.html

cudaError_t cudaDeviceReset() {
    printf("insideDeviceReset\n");
    HIP_CHECK(hipDeviceReset());
    return cudaSuccess;
}

cudaError_t cudaGetLastError() {
    printf("insideGetLastError\n");
    HIP_CHECK(hipGetLastError());
    return cudaSuccess;
}

cudaError_t cudaPeekAtLastError() {
    printf("insidePeekAtLastError\n");
    HIP_CHECK(hipPeekAtLastError());
    return cudaSuccess;
}

cudaError_t cudaDeviceSynchronize() {
    printf("inside cudaDeviceSynchronize()\n");
    HIP_CHECK(hipDeviceSynchronize());
    return cudaSuccess;
}

cudaError_t cudaThreadSynchronize() {
    printf("inside cudaThreadSynchronize()\n");
    HIP_CHECK(hipDeviceSynchronize());
    return cudaSuccess;
}

cudaError_t cudaSetDevice(int device) {
    HIP_CHECK(hipSetDevice(device));
    return cudaSuccess;
}

cudaError_t cudaGetDevice(int *devPtr) {
    printf("insideGetDevice\n");
    HIP_CHECK(hipGetDevice(devPtr));
    return cudaSuccess;
}

cudaError_t cudaGetDeviceCount(int *count) {
    printf("insideGetDeviceCount\n");
    HIP_CHECK(hipGetDeviceCount(count));
    return cudaSuccess;
}

cudaError_t cudaFuncSetCacheConfig(const void* func, cudaFuncCache cacheConfig) {
    hipFuncCache_t hipCacheConfig = (hipFuncCache_t) cacheConfig;
    HIP_CHECK(hipFuncSetCacheConfig(func, hipCacheConfig));
    return cudaSuccess;
}

cudaError_t cudaGetDeviceProperties(cudaDeviceProp *prop, int device) {
    printf("Get Device Properties\n");
    hipDeviceProp_t dprops;
    HIP_CHECK(hipGetDeviceProperties(&dprops, device));
    memcpy(prop->name, dprops.name, sizeof(prop->name));
    memcpy(prop->maxThreadsDim, dprops.maxThreadsDim, sizeof(dprops.maxThreadsDim));
    memcpy(prop->maxGridSize, dprops.maxGridSize, sizeof(dprops.maxGridSize));

    prop->warpSize = dprops.warpSize;
    prop->clockRate = dprops.clockRate;
    prop->sharedMemPerBlock = dprops.sharedMemPerBlock;
    prop->totalGlobalMem = dprops.totalGlobalMem;
    prop->regsPerBlock = dprops.regsPerBlock;
    prop->memPitch = dprops.memPitch;
    prop->maxThreadsPerBlock = dprops.maxThreadsPerBlock;
    prop->totalConstMem = dprops.totalConstMem;
    prop->major = 11;
    prop->minor = 5;
    prop->clockRate = dprops.clockRate;
    prop->textureAlignment = dprops.textureAlignment;
    prop->deviceOverlap = false;
    prop->multiProcessorCount = dprops.multiProcessorCount;

    printf("Device WarpSize: %d \n", prop->warpSize);
    printf("Device clockRate: %d \n", prop->clockRate);
    return cudaSuccess;
}

cudaError_t cudaSetDeviceFlags(unsigned int flags) {
    HIP_CHECK(hipSetDeviceFlags(flags));
    return cudaSuccess;
}


cudaError_t cudaHostGetDevicePointer (void** pDevice, void* pHost, unsigned int flags) {
    HIP_CHECK(hipHostGetDevicePointer(pDevice, pHost, flags));
    return cudaSuccess;
}

cudaError_t cudaMalloc(void **devPtr, size_t size) {
    printf("insideCudaMalloc %p size=%zu\n", devPtr, size);
    HIP_CHECK(hipMalloc(devPtr, size));
    printf("endCudaMalloc\n");
    return cudaSuccess;
}

cudaError_t cudaMallocArray(cudaArray_t* array, const cudaChannelFormatDesc* desc, size_t width, size_t height = 0, unsigned int  flags = 0) {
        HIP_CHECK(hipMallocArray(array, desc, width, height, flags));
        return cudaSuccess;
}

cudaError_t cudaMallocPitch(void **devPtr, size_t *pitch, size_t width, size_t height)	{
  HIP_CHECK(hipMallocPitch(devPtr,  pitch, width, height))
  return cudaSuccess;
}

cudaError_t cudaFree(void *ptr) {
    printf("inside cudaFree\n");
    HIP_CHECK(hipFree(ptr));
    return cudaSuccess;
}

cudaError_t cudaFreeHost(void *ptr) {

    HIP_CHECK(hipFreeHost(ptr));
    return cudaSuccess;
}

cudaError_t cudaFreeArray(cudaArray_t array) {
    HIP_CHECK(hipFreeArray(array));
    return cudaSuccess;
}
cudaError_t cudaHostAlloc(void **ptr, size_t size, unsigned int flag) {
    printf("inside HostAlloc\n");
    HIP_CHECK(hipHostMalloc(ptr, size, flag));
    return cudaSuccess;
}

cudaError_t cudaMemcpy(void *dst, const void *src, size_t count,
                       cudaMemcpyKind kind) {
    printf("insideCudaMemcpy\n");
    HIP_CHECK(hipMemcpy(dst, src, count, (hipMemcpyKind)kind));
    return cudaSuccess;
}

cudaError_t cudaMemcpyToSymbol(const void* symbol, const void* src, size_t count, size_t offset , cudaMemcpyKind kind) {

    hipMemcpyToSymbol(
    symbol,  src, count, offset ,
    (hipMemcpyKind)kind);

}



cudaError_t cudaMemcpy2D(void * dst, size_t dpitch, const void * src, size_t spitch, size_t width,
    size_t 	height, cudaMemcpyKind kind) {
        HIP_CHECK(hipMemcpy2D(dst, dpitch, src, spitch, width, height, (hipMemcpyKind)kind));
        return cudaSuccess;
}

cudaError_t cudaLaunchKernel(const void *func, dim3 gridDim, dim3 blockDim,
                             void **args, size_t sharedMem,
                             cudaStream_t stream) {
    printf("insideCudaLaunchKernel\n");
    HIP_CHECK(hipLaunchKernel(func, gridDim, blockDim, args, sharedMem,
                              (hipStream_t)stream));
    printf("cudaLaunchKernel\n");
    return cudaSuccess;
}

cudaError_t cudaEventCreate (cudaEvent_t* event) {
    printf("hipEventCreate\n");

    HIP_CHECK(hipEventCreate(event));
    return cudaSuccess;


}

cudaError_t cudaEventRecord (cudaEvent_t event, cudaStream_t stream = 0) {
    printf("hipEventRecord\n");

    HIP_CHECK(hipEventRecord(event, stream));
    return cudaSuccess;

}

cudaError_t cudaEventSynchronize (cudaEvent_t event) {
    printf("hipSynchronize\n");

    HIP_CHECK(hipEventSynchronize(event));
    return cudaSuccess;

}

cudaError_t cudaEventDestroy (cudaEvent_t event) {
    printf("hipEventDestroy\n");

    HIP_CHECK(hipEventDestroy(event));
    return cudaSuccess;

}

cudaError_t cudaEventElapsedTime (float* ms, cudaEvent_t start, cudaEvent_t end) {

    HIP_CHECK(hipEventElapsedTime(ms, start, end));
    return cudaSuccess;


}

cudaError_t cudaMemset(void* devPtr, int  value, size_t count) {
    
    printf("insideCudaMemset\n");
    HIP_CHECK(hipMemset(devPtr, value, count));
    return cudaSuccess;


}

const char* cudaGetErrorString(cudaError_t error) {
    return hipGetErrorString((hipError_t) error);
}

cudaError_t cudaStreamCreateWithFlags(cudaStream_t* stream, unsigned int flags) {
    HIP_CHECK(hipStreamCreateWithFlags(stream, flags));
    return cudaSuccess;
}

cudaError_t cudaStreamCreateWithPriority(cudaStream_t* stream, unsigned int flags, int priority) {
    HIP_CHECK(hipStreamCreateWithPriority(stream, flags, priority));
    return cudaSuccess;
}

cudaError_t cudaDeviceGetStreamPriorityRange(int* leastPriority, int* greatestPriority) {
    HIP_CHECK(hipDeviceGetStreamPriorityRange(leastPriority, greatestPriority));
    return cudaSuccess;
}

cudaError_t cudaStreamCreate(cudaStream_t* stream) {
    HIP_CHECK(hipStreamCreate(stream));
    return cudaSuccess;
}

cudaError_t cudaStreamSynchronize(cudaStream_t stream) {
    HIP_CHECK(hipStreamSynchronize(stream));
    return cudaSuccess;
}

cudaError_t cudaStreamDestroy(cudaStream_t stream) {
    HIP_CHECK(hipStreamDestroy(stream));
    return cudaSuccess;
}

cudaError_t cudaStreamGetFlags(cudaStream_t stream, unsigned int* flags) {
    HIP_CHECK(hipStreamGetFlags(stream, flags));
    return cudaSuccess;
}

cudaError_t cudaStreamGetPriority(cudaStream_t stream, int *priority) {
    HIP_CHECK(hipStreamGetPriority(stream, priority));
    return cudaSuccess;
}

cudaError_t cudaStreamWaitEvent(cudaStream_t stream, cudaEvent_t event, unsigned int flags) {
    HIP_CHECK(hipStreamWaitEvent(stream, event, flags));
    return cudaSuccess;
}

cudaError_t cudaStreamQuery(cudaStream_t stream) {
    HIP_CHECK(hipStreamQuery(stream));
    return cudaSuccess;
}

cudaError_t cudaStreamAddCallback(cudaStream_t stream, cudaStreamCallback_t callback, void* userData, unsigned int flags) {
    HIP_CHECK(hipStreamAddCallback(stream, callback, userData, flags));
    return cudaSuccess;
}

cudaChannelFormatDesc cudaCreateChannelDesc(int  x, int  y, int  z, int  w, cudaChannelFormatKind f) {
 return hipCreateChannelDesc(x, y, z, w, (hipChannelFormatKind)f);
}

cudaError_t cudaCreateTextureObject(cudaTextureObject_t* pTexObject, const cudaResourceDesc* pResDesc, const cudaTextureDesc* pTexDesc, const cudaResourceViewDesc* pResViewDesc) {
    HIP_CHECK(hipCreateTextureObject(pTexObject, pResDesc, pTexDesc, pResViewDesc));
    return cudaSuccess;
}

cudaError_t cudaDestroyTextureObject ( cudaTextureObject_t texObject ) {
    HIP_CHECK(hipDestroyTextureObject(texObject));
    return cudaSuccess;

}

cudaError_t cudaGetChannelDesc(cudaChannelFormatDesc* desc, cudaArray_const_t array) {
    HIP_CHECK(hipGetChannelDesc(desc, array));
    return cudaSuccess;
}

cudaError_t cudaGetTextureObjectResourceDesc(cudaResourceDesc* pResDesc, cudaTextureObject_t texObject) {
    HIP_CHECK(hipGetTextureObjectResourceDesc(pResDesc, texObject));
    return cudaSuccess;
}

cudaError_t cudaGetTextureObjectResourceViewDesc(cudaResourceViewDesc* pResViewDesc, cudaTextureObject_t texObject) {
    HIP_CHECK(hipGetTextureObjectResourceViewDesc(pResViewDesc, texObject));
    return cudaSuccess;
}

cudaError_t cudaGetTextureObjectTextureDesc(cudaTextureDesc* pTexDesc, cudaTextureObject_t texObject) {
  HIP_CHECK(hipGetTextureObjectTextureDesc(pTexDesc, texObject));
  return cudaSuccess;

}

cudaError_t cudaBindTexture(size_t* offset, const textureReference* texref, const void* devPtr, const cudaChannelFormatDesc* desc, size_t size = UINT_MAX) {
    printf(" cudaBindTexture Runtime \n");

    size_t offset1;
    if (offset == NULL) {
        *offset = offset1;
    }
    HIP_CHECK(hipBindTexture(offset, texref, devPtr, desc, size));
    
    return cudaSuccess;
}

cudaError_t cudaBindTexture2D(size_t* offset, const textureReference* texref, const void* devPtr, const cudaChannelFormatDesc* desc, 
    size_t width, size_t height, size_t pitch) {
    // printf("cudaBindTexture2d  %p\n", texref);
    // printf("cudaBindTexture2d  %p\n", devPtr);
    // printf("cudaBindTexture2d  %p\n", desc);
    // hipBindTexture2D(offset, texref, devPtr, desc, width, height, pitch);
    
    HIP_CHECK(hipBindTexture2D(offset, texref, devPtr,
    desc, width, height, pitch));
     
    // printf("cudaBindTexture2d  %p\n", texref);
    // printf("cudaBindTexture2d  %p\n", devPtr);
    // printf("cudaBindTexture2d  %p\n", desc);

    // exit(1);
    return cudaSuccess;
}

cudaError_t cudaUnbindTexture(const textureReference* texref) {
    HIP_CHECK(hipUnbindTexture(texref));
    return cudaSuccess;
}

static callParams callParamTemp;
/*
  Internal Cuda Library Functions
*/

extern "C" {
extern cudaError_t __cudaPopCallConfiguration(dim3 *gridDim, dim3 *blockDim,
                                              size_t *sharedMem,
                                              void **stream) {
    //  printf("__cudaPopCallConfiguration: Grid: x:%d y:%d z:%d Block: %d, %d,
    //  %d ShMem: %lu\n",
    // gridDim->x, gridDim->y, gridDim->z, blockDim->x, blockDim->y,
    // blockDim->z, *sharedMem);
    HIP_CHECK(__hipPopCallConfiguration(gridDim, blockDim, sharedMem,
                                        (ihipStream_t **)stream));

    // *gridDim = callParamTemp.gridDim;
    // *blockDim = callParamTemp.blockDim;
    // *sharedMem = callParamTemp.shareMem;
    // *stream = callParamTemp.stream;
    printf("__cudaPopCallConfiguration After : Grid: x:%d y:%d z:%d Block: %d, "
           "%d, %d ShMem: %lu\n",
           gridDim->x, gridDim->y, gridDim->z, blockDim->x, blockDim->y,
           blockDim->z, *sharedMem);

    return cudaSuccess;
}

extern unsigned __cudaPushCallConfiguration(dim3 gridDim, dim3 blockDim,
                                            size_t sharedMem = 0,
                                            void *stream = 0) {
    HIP_CHECK(__hipPushCallConfiguration(gridDim, blockDim, sharedMem,
                                         (ihipStream_t *)stream));

    // // memory checks allocations
    // callParamTemp.gridDim = gridDim;

    // // std::cout << "assign gridDim" << std::endl;

    // callParamTemp.blockDim = blockDim;
    // //  std::cout << "assign blockDim" << std::endl;
    // callParamTemp.shareMem = sharedMem;
    // //  std::cout << "assign shareMem" << std::endl;
    // (callParamTemp.stream) = stream;
    printf("__cudaPushCallConfiguration Grid: x:%d y:%d z:%d Block: %d, %d, %d "
           "ShMem: %lu\n ",
           gridDim.x, gridDim.y, gridDim.z, blockDim.x, blockDim.y, blockDim.z,
           sharedMem);

    // // return 0 continues the Pop
    return cudaSuccess;
}
}

// static void **__cudaFatCubinHandle;

extern "C" {
extern void **__cudaRegisterFatBinary(void *fatCubin) {
    printf("before __cudaRegisterFatBinary %p\n", fatCubin);
    void **temp = __hipRegisterFatBinary(fatCubin);
    printf("after __cudaRegisterFatBinary %p\n", temp);
    return temp;
}

// seems to be in cuda 10
extern void __cudaRegisterFatBinaryEnd(void **fatCubinHandle) {
    printf("__cudaRegisterFatBinaryEnd Called\n");
}

extern void __cudaUnregisterFatBinary(void **fatCubinHandle) {
    __hipUnregisterFatBinary(fatCubinHandle);
}

extern void __cudaRegisterVar(void **fatCubinHandle, char *hostVar,
                              char *deviceAddress, const char *deviceName,
                              int ext, size_t size, int constant, int global) {
    __hipRegisterVar(fatCubinHandle, hostVar, deviceAddress, (char *)deviceName,
                     ext, size, constant, global);
}

// extern void __cudaRegisterManagedVar(
//         void **fatCubinHandle,
//         void **hostVarPtrAddress,
//         char  *deviceAddress,
//   const char  *deviceName,
//         int    ext,
//         size_t size,
//         int    constant,
//         int    global
// ) {
//   __hipRegisterManagedVar(fatCubinHandle,
//         hostVarPtrAddress,
//         deviceAddress,
//         deviceName,
//         ext,
//         size);
// }

extern char __cudaInitModule(void **fatCubinHandle) {
    printf("__cudaInitModule Called\n");
    return ' ';
}

extern void __cudaRegisterTexture(void **fatCubinHandle,
                                  const struct textureReference *hostVar,
                                  const void **deviceAddress,
                                  const char *deviceName, int dim, int norm,
                                  int ext) {
    printf("__cudaRegisterTexture Called\n");

    // tex, "texName" 
    // 2 0 0    
    __hipRegisterTexture(fatCubinHandle,      // The device modules containing code object
                                     (void *)hostVar,        // The shadow variable in host code
                                     (char *)deviceName,    // Variable name in host code
                                     (char *)deviceName,  // Variable name in device code
                                     dim, norm, ext);


}

extern void __cudaRegisterSurface(void **fatCubinHandle,
                                  const struct surfaceReference *hostVar,
                                  const void **deviceAddress,
                                  const char *deviceName, int dim, int ext) {
    printf("__cudaRegisterSurface Called\n");
}

extern void __cudaRegisterFunction(void **fatCubinHandle, const char *hostFun,
                                   char *deviceFun, const char *deviceName,
                                   int thread_limit, uint3 *tid, uint3 *bid,
                                   dim3 *bDim, dim3 *gDim, int *wSize) {
    printf("__cudaRegisterFunction Called: hostFun_stubPtr=%p, deviceFun=%s, "
           "deviceName=%s , fatbin_ptr=%p\n",
           hostFun, deviceFun, deviceName, fatCubinHandle);
    __hipRegisterFunction(fatCubinHandle, hostFun, deviceFun, deviceName,
                          thread_limit, tid, bid, bDim, gDim, wSize);
}
}
