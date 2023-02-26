
// https://github.com/ArchaeaSoftware/cudahandbook/blob/master/texturing/tex1dfetch.cu

#include <stdio.h>
#include "cuda_runtime.h"
// #include <chError.h>

#define NUM_FLOATS 16

texture<float, 1, cudaReadModeElementType> tex1;

__global__ void
TexReadout( float *out, size_t N )
{
    for (size_t i = blockIdx.x*blockDim.x + threadIdx.x; 
          i < N; 
          i += gridDim.x*blockDim.x )   
    {
        out[i] = tex1Dfetch(tex1, i) * 0.5 ;
    }
}


__global__ void
TexReadout1( float *out, size_t N )
{
    for (size_t i = blockIdx.x*blockDim.x + threadIdx.x; 
          i < N; 
          i += gridDim.x*blockDim.x )   
    {
        out[i] = tex1Dfetch(tex1, i) - 0.5 ;
    }
}


void
PrintTex( float *host, size_t N )
{
    float *device;
    cudaError_t status;
    memset( host, 0, N*sizeof(float) );
    cudaHostGetDevicePointer( (void **) &device, host, 0 );
    
    TexReadout1<<<2,384>>>( device, N );
    cudaDeviceSynchronize();
    for (int i = 0; i < N; i++) {
        printf( "%.2f ", host[i] );
    }
    printf( "\n" );
    // Output
    // 0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00 13.00 14.00 15.00
Error:;
}

int
main( int argc, char *argv[] )
{
    int ret = 1;
    float *p = 0;
    float *finHost;
    float *finDevice;

    float *foutHost;
    float *foutDevice;
    cudaError_t status;
    cudaDeviceProp props;

    cudaSetDeviceFlags(cudaDeviceMapHost);
    cudaGetDeviceProperties( &props, 0);
    cudaMalloc( (void **) &p, NUM_FLOATS*sizeof(float));
    cudaHostAlloc( (void **) &finHost, NUM_FLOATS*sizeof(float), cudaHostAllocMapped);
    cudaHostGetDevicePointer( (void **) &finDevice, finHost, 0 );

    cudaHostAlloc( (void **) &foutHost, NUM_FLOATS*sizeof(float), cudaHostAllocMapped);
    cudaHostGetDevicePointer( (void **) &foutDevice, foutHost, 0 );

    for ( int i = 0; i < NUM_FLOATS; i++ ) {
        finHost[i] = (float) i;
    }

    {
        size_t offset;
        cudaBindTexture( &offset, tex1, finDevice, NUM_FLOATS*sizeof(float));
    }

    PrintTex( foutHost, NUM_FLOATS );

    ret = 0;
Error:
    cudaFree( p );
    cudaFreeHost( finHost );
    cudaFreeHost( foutHost );
    return ret;
}