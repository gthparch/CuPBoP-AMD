#include "cuda_runtime.h"
#include <stdlib.h>
#include "stdio.h"

// https://github.com/ricsonc/linear_vs_texture_memory_cuda/blob/master/main.cu

#define gpuCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char *file, int line, bool abort=true)
{
   if (code != cudaSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", cudaGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

typedef float4 typ;

texture<typ, 1> texref;
texture<typ, 2> texref2;
texture<typ, 3> texref3;

/* 1D texture memory */

__global__ void touch1Dtexture(void* outPtr_, long M){
    long N = gridDim.x * blockDim.x;
    long i = blockIdx.x * blockDim.x + threadIdx.x;

    typ* outPtr = (typ*) outPtr_;

    for(; i < M-2; i += N) {
        outPtr[i] = (
            tex1Dfetch(texref, i) +
            tex1Dfetch(texref, i+1) +
            tex1Dfetch(texref, i+2) + 
            tex1Dfetch(texref, i+3)
        );
    }
}

void time1Dtexture()
{
    void* refPtr;
    void* outPtr;
    long M = 1000L*1000L*100L;
    int blocks = 65536;
    int threads = 64;

    gpuCheck( cudaMalloc(&refPtr, M*sizeof(typ)) );
    gpuCheck( cudaMalloc(&outPtr, M*sizeof(typ)) );
    gpuCheck( cudaBindTexture(NULL, texref, refPtr, M) );
    
    touch1Dtexture<<<blocks, threads>>>(outPtr, M);
    
    gpuCheck( cudaPeekAtLastError() );
    gpuCheck( cudaDeviceSynchronize() );


    gpuCheck( cudaUnbindTexture(texref) );    
    gpuCheck( cudaFree(refPtr) );
    gpuCheck( cudaFree(outPtr) );
    
}

/* 2D linear memory */

__global__ void touch2Dtexture(void* outPtr_, long M){
    long N = gridDim.x * blockDim.x;
    long ix = blockIdx.x * blockDim.x + threadIdx.x;
    long iy = blockIdx.y * blockDim.y + threadIdx.y;

    typ* outPtr = (typ*) outPtr_;

    for(; ix < M-1; ix += N) {
        for(; iy < M-1; iy += N) {
            outPtr[ix*M+iy] = (
                tex2D(texref2, ix, iy) +
                tex2D(texref2, ix+1, iy) +
                tex2D(texref2, ix, iy+1) +
                tex2D(texref2, ix+1, iy+1)
            );
        }
    }
}

/* 3D texture memory */

__global__ void touch3Dtexture(void* outPtr_, long M){
    long N = gridDim.x * blockDim.x;
    long ix = blockIdx.x * blockDim.x + threadIdx.x;
    long iy = blockIdx.y * blockDim.y + threadIdx.y;
    long iz = blockIdx.z * blockDim.z + threadIdx.z;

    typ* outPtr = (typ*) outPtr_;

    for(; ix < M-1; ix += N) {
        for(; iy < M-1; iy += N) {
            for(; iz < M-1; iz += N) {
                outPtr[ix*M*M+iy*M+iz] = (
                    tex3D(texref3, ix, iy, iz) +                    
                    tex3D(texref3, ix, iy, iz+1) +
                    tex3D(texref3, ix, iy+1, iz) +
                    tex3D(texref3, ix+1, iy, iz)
                );
            }
        }
    }
}

void time2Dtexture()
{
    long M = 10000;
    dim3 blocks(256, 256);
    dim3 threads(8,8);

    void* outPtr;
    gpuCheck( cudaMalloc(&outPtr, M*M*sizeof(typ)) );

    cudaArray *refPtr;
    gpuCheck( cudaMallocArray(&refPtr, &texref2.channelDesc, M, M) );
    gpuCheck( cudaBindTextureToArray(texref2, refPtr) );
    
    auto start = std::chrono::system_clock::now();
    for(int i = 0; i < RUNS; i++){
        touch2Dtexture<<<blocks, threads>>>(outPtr, M);
    }
    
    gpuCheck( cudaPeekAtLastError() );
    gpuCheck( cudaDeviceSynchronize() );

    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> delta = end-start;

    gpuCheck( cudaUnbindTexture(texref) );    
    gpuCheck( cudaFreeArray(refPtr) );
    gpuCheck( cudaFree(outPtr) );
    
    printf("texture 2D: %.1f ms\n", delta.count());
}


void time3Dtexture()
{
    unsigned long M = 465;
    dim3 blocks(32,32,32);
    dim3 threads(4,4,4);

    void* outPtr;
    gpuCheck( cudaMalloc(&outPtr, M*M*M*sizeof(typ)) );
    
    cudaArray* refPtr;
    gpuCheck( cudaMalloc3DArray(&refPtr, &texref2.channelDesc, {M, M, M}) );
    gpuCheck( cudaBindTextureToArray(texref3, refPtr) );
    
    auto start = std::chrono::system_clock::now();
    for(int i = 0; i < RUNS; i++){
        touch3Dtexture<<<blocks, threads>>>(outPtr, M);
    }
    
    gpuCheck( cudaPeekAtLastError() );
    gpuCheck( cudaDeviceSynchronize() );

    auto end = std::chrono::system_clock::now();
    std::chrono::duration<double> delta = end-start;

    gpuCheck( cudaUnbindTexture(texref) );    
    gpuCheck( cudaFreeArray(refPtr) );
    gpuCheck( cudaFree(outPtr) );
    
    printf("texture 3D: %.1f ms\n", delta.count());
}