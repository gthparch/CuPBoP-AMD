
// https://github.com/ArchaeaSoftware/hiphandbook/blob/master/texturing/tex1dfetch.cu

#include <stdio.h>
#include "hip/hip_runtime.h"
// #include <chError.h>

#define NUM_FLOATS 16

texture<float, 1, hipReadModeElementType> tex1;

__global__ void
TexReadout( float *out, size_t N )
{
    for (size_t i = blockIdx.x*blockDim.x + threadIdx.x; 
          i < N; 
          i += gridDim.x*blockDim.x )   
    {
        out[i] = tex1Dfetch(tex1, i);
    }
}

void
PrintTex( float *host, size_t N )
{
    float *device;
    hipError_t status;
    memset( host, 0, N*sizeof(float) );
    hipHostGetDevicePointer( (void **) &device, host, 0 );
    
    TexReadout<<<2,384>>>( device, N );
    hipDeviceSynchronize();
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
    hipError_t status;
    hipDeviceProp_t props;

    hipSetDeviceFlags(hipDeviceMapHost);
    hipGetDeviceProperties( &props, 0);
    hipMalloc( (void **) &p, NUM_FLOATS*sizeof(float));
    hipHostMalloc( (void **) &finHost, NUM_FLOATS*sizeof(float), hipHostMallocMapped);
    hipHostGetDevicePointer( (void **) &finDevice, finHost, 0 );

    hipHostMalloc( (void **) &foutHost, NUM_FLOATS*sizeof(float), hipHostMallocMapped);
    hipHostGetDevicePointer( (void **) &foutDevice, foutHost, 0 );

    for ( int i = 0; i < NUM_FLOATS; i++ ) {
        finHost[i] = (float) i;
    }

    {
        size_t offset;
        hipBindTexture( &offset, tex1, finDevice, NUM_FLOATS*sizeof(float));
    }

    PrintTex( foutHost, NUM_FLOATS );

    ret = 0;
Error:
    hipFree( p );
    hipFreeHost( finHost );
    hipFreeHost( foutHost );
    return ret;
}