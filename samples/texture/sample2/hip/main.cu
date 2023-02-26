#include "hip/hip_runtime.h"
#include <stdlib.h>
#include "stdio.h"
// #include "helper_math.h"

// will need export CPATH=~/hip-11.5/samples/common/inc:$CPATH

// https://forums.developer.nvidia.com/t/tex1dfetch-apparently-returning-incorrect-value/38795
// https://github.com/ricsonc/linear_vs_texture_memory_hip/blob/master/main.cu

#define gpuCheck(ans) { gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(hipError_t code, const char *file, int line, bool abort=true)
{
   if (code != hipSuccess) 
   {
      fprintf(stderr,"GPUassert: %s %s %d\n", hipGetErrorString(code), file, line);
      if (abort) exit(code);
   }
}

typedef float4 typ;
typedef uint4 typ3;

// typedef float2 typ1;
// typedef float3 typ2;
// typedef int2 typ4;
// typedef int3 typ5;


texture<typ, 1> texref;
// texture<typ3, 1> texref2;
// texture<typ3, 2> texref2;


// texture<typ1, 1> texref1;
// texture<typ2, 1> texref2;
// texture<typ3, 1> texref3;
// texture<typ4, 1> texref4;
// texture<typ5, 1> texref5;




// texture<typ1, 2> texref5;
// texture<typ, 3> texref6;

/* 1D texture memory */

__global__ void touch1Dtexture(void* outPtr_, long M){
    long N = gridDim.x * blockDim.x;
    long i = blockIdx.x * blockDim.x + threadIdx.x;

    typ* outPtr = (typ*) outPtr_;

    for(; i < M-2; i += N) {
        float4 a = tex1Dfetch(texref, i);
        // float4 b = tex1Dfetch(texref, i+1); 
        // float4 c = tex1Dfetch(texref, i+2);  
        // float4 d = tex1Dfetch(texref, i+3);
        outPtr[i] = (
           a 
        );
        //  if (i < 10) {
        //     printf("%d: %f ,", i, a.x);
        // }
    }
}


// __global__ void touch1Dtexture1(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long i = blockIdx.x * blockDim.x + threadIdx.x;

//     typ1* outPtr = (typ1*) outPtr_;

//     for(; i < M-2; i += N) {
//         float2 a = tex1Dfetch(texref1, i);
//         // float4 b = tex1Dfetch(texref, i+1); 
//         // float4 c = tex1Dfetch(texref, i+2);  
//         // float4 d = tex1Dfetch(texref, i+3);
//         outPtr[i] = (
//            a 
//         );
//     }
// }

// __global__ void touch1Dtexture2(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long i = blockIdx.x * blockDim.x + threadIdx.x;

//     typ2* outPtr = (typ2*) outPtr_;

//     for(; i < M-2; i += N) {
//         float3 a = tex1Dfetch(texref2, i);
//         // float4 b = tex1Dfetch(texref, i+1); 
//         // float4 c = tex1Dfetch(texref, i+2);  
//         // float4 d = tex1Dfetch(texref, i+3);
//         outPtr[i] = (
//            a 
//         );
//     }
// }

// __global__ void touch1Dtexture3(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long i = blockIdx.x * blockDim.x + threadIdx.x;

//     typ3* outPtr = (typ3*) outPtr_;

//     for(; i < M-2; i += N) {
//         int4 a = tex1Dfetch(texref3, i);
//         // float4 b = tex1Dfetch(texref, i+1); 
//         // float4 c = tex1Dfetch(texref, i+2);  
//         // float4 d = tex1Dfetch(texref, i+3);
//         outPtr[i] = (
//            a 
//         );
//     }
// }

// __global__ void touch1Dtexture4(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long i = blockIdx.x * blockDim.x + threadIdx.x;

//     typ4* outPtr = (typ4*) outPtr_;

//     for(; i < M-2; i += N) {
//         int2 a = tex1Dfetch(texref4, i);
//         // float4 b = tex1Dfetch(texref, i+1); 
//         // float4 c = tex1Dfetch(texref, i+2);  
//         // float4 d = tex1Dfetch(texref, i+3);
//         outPtr[i] = (
//            a 
//         );
//     }
// }

// __global__ void touch1Dtexture5(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long i = blockIdx.x * blockDim.x + threadIdx.x;

//     typ5* outPtr = (typ5*) outPtr_;

//     for(; i < M-2; i += N) {
//         int3 a = tex1Dfetch(texref5, i);
//         // float4 b = tex1Dfetch(texref, i+1); 
//         // float4 c = tex1Dfetch(texref, i+2);  
//         // float4 d = tex1Dfetch(texref, i+3);
//         outPtr[i] = (
//            a 
//         );
//     }
// }



int time1Dtexture()
{
    void* refPtr;
    void* outPtr;
    long M = 1000L*1000L*100L;
    int blocks = 65536;
    int threads = 64;

    gpuCheck( hipMalloc(&refPtr, M*sizeof(typ)) );
    gpuCheck( hipMalloc(&outPtr, M*sizeof(typ)) );
     size_t offset;
    gpuCheck( hipBindTexture(&offset, texref, refPtr, M) );
    
    touch1Dtexture<<<blocks, threads>>>(outPtr, M);
    
    gpuCheck( hipPeekAtLastError() );
    gpuCheck( hipDeviceSynchronize() );


    gpuCheck( hipUnbindTexture(texref) );    
    gpuCheck( hipFree(refPtr) );
    gpuCheck( hipFree(outPtr) );
    
}

/* 2D linear memory */

// __global__ void touch2Dtexture(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long ix = blockIdx.x * blockDim.x + threadIdx.x;
//     long iy = blockIdx.y * blockDim.y + threadIdx.y;

//     typ1* outPtr = (typ1*) outPtr_;

//     for(; ix < M-1; ix += N) {
//         for(; iy < M-1; iy += N) {
//             outPtr[ix*M+iy] = (
//                 tex2D(texref2, ix, iy) +
//                 tex2D(texref2, ix+1, iy) +
//                 tex2D(texref2, ix, iy+1) +
//                 tex2D(texref2, ix+1, iy+1)
//             );
//         }
//     }
// }

// /* 3D texture memory */

// __global__ void touch3Dtexture(void* outPtr_, long M){
//     long N = gridDim.x * blockDim.x;
//     long ix = blockIdx.x * blockDim.x + threadIdx.x;
//     long iy = blockIdx.y * blockDim.y + threadIdx.y;
//     long iz = blockIdx.z * blockDim.z + threadIdx.z;

//     typ* outPtr = (typ*) outPtr_;

//     for(; ix < M-1; ix += N) {
//         for(; iy < M-1; iy += N) {
//             for(; iz < M-1; iz += N) {
//                 outPtr[ix*M*M+iy*M+iz] = (
//                     tex3D(texref3, ix, iy, iz) +                    
//                     tex3D(texref3, ix, iy, iz+1) +
//                     tex3D(texref3, ix, iy+1, iz) +
//                     tex3D(texref3, ix+1, iy, iz)
//                 );
//             }
//         }
//     }
// }

// void time2Dtexture()
// {
//     long M = 10000;
//     dim3 blocks(256, 256);
//     dim3 threads(8,8);

//     void* outPtr;
//     gpuCheck( hipMalloc(&outPtr, M*M*sizeof(typ)) );

//     hipArray *refPtr;
//     gpuCheck( hipMallocArray(&refPtr, &texref2.channelDesc, M, M) );
//     gpuCheck( hipBindTextureToArray(texref2, refPtr) );
    
   
//     touch2Dtexture<<<blocks, threads>>>(outPtr, M);
    
    
//     gpuCheck( hipPeekAtLastError() );
//     gpuCheck( hipDeviceSynchronize() );



//     gpuCheck( hipUnbindTexture(texref) );    
//     gpuCheck( hipFreeArray(refPtr) );
//     gpuCheck( hipFree(outPtr) );
    
// }


// void time3Dtexture()
// {
//     unsigned long M = 465;
//     dim3 blocks(32,32,32);
//     dim3 threads(4,4,4);

//     void* outPtr;
//     gpuCheck( hipMalloc(&outPtr, M*M*M*sizeof(typ)) );
    
//     hipArray* refPtr;
//     gpuCheck( hipMalloc3DArray(&refPtr, &texref2.channelDesc, {M, M, M}) );
//     gpuCheck( hipBindTextureToArray(texref3, refPtr) );
    
   
//     touch3Dtexture<<<blocks, threads>>>(outPtr, M);
    
    
//     gpuCheck( hipPeekAtLastError() );
//     gpuCheck( hipDeviceSynchronize() );


//     gpuCheck( hipUnbindTexture(texref) );    
//     gpuCheck( hipFreeArray(refPtr) );
//     gpuCheck( hipFree(outPtr) );
    
// }

int main() {
    time1Dtexture();
}