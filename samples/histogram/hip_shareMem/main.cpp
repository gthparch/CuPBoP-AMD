#include <stdio.h>
#include <hip/hip_runtime.h>
static void HandleError( hipError_t err,
                         const char *file,
                         int line ) {
    if (err != hipSuccess) {
        printf( "%s in %s at line %d\n", hipGetErrorString( err ),
                file, line );
        exit( EXIT_FAILURE );
    }
}
#define HANDLE_ERROR( err ) (HandleError( err, __FILE__, __LINE__ ))


#define HANDLE_NULL( a ) {if (a == NULL) { \
                            printf( "Host memory failed in %s at line %d\n", \
                                    __FILE__, __LINE__ ); \
                            exit( EXIT_FAILURE );}}


void* big_random_block( int size ) {
    unsigned char *data = (unsigned char*)malloc( size );
    HANDLE_NULL( data );
    for (int i=0; i<size; i++)
        data[i] = rand();

    return data;
}


#define SIZE    (100*1024*1024)


__global__ void histo_kernel( unsigned char *buffer,
                              long size,
                              unsigned int *histo ) {

    // clear out the accumulation buffer called temp
    // since we are launched with 256 threads, it is easy
    // to clear that memory with one write per thread
    __shared__  unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    // calculate the starting index and the offset to the next
    // block that each thread will be processing
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    while (i < size) {
        atomicAdd( &temp[buffer[i]], 1 );
        i += stride;
    }
    // sync the data from the above writes to shared memory
    // then add the shared memory values to the values from
    // the other thread blocks using global memory
    // atomic adds
    // same as before, since we have 256 threads, updating the
    // global histogram is just one write per thread!
    __syncthreads();
    atomicAdd( &(histo[threadIdx.x]), temp[threadIdx.x] );
}

int main( void ) {
    unsigned char *buffer =
                     (unsigned char*)big_random_block( SIZE );

    // capture the start time
    // starting the timer here so that we include the cost of
    // all of the operations on the GPU.
    hipEvent_t     start, stop;
    HANDLE_ERROR( hipEventCreate( &start ) );
    HANDLE_ERROR( hipEventCreate( &stop ) );
    HANDLE_ERROR( hipEventRecord( start, 0 ) );

    // allocate memory on the GPU for the file's data
    unsigned char *dev_buffer;
    unsigned int *dev_histo;
    HANDLE_ERROR( hipMalloc( (void**)&dev_buffer, SIZE ) );
    HANDLE_ERROR( hipMemcpy( dev_buffer, buffer, SIZE,
                              hipMemcpyHostToDevice ) );

    HANDLE_ERROR( hipMalloc( (void**)&dev_histo,
                              256 * sizeof( int ) ) );
    HANDLE_ERROR( hipMemset( dev_histo, 0,
                              256 * sizeof( int ) ) );

    // kernel launch - 2x the number of mps gave best timing
    hipDeviceProp_t  prop;
    HANDLE_ERROR( hipGetDeviceProperties( &prop, 0 ) );
    int blocks = prop.multiProcessorCount;
    histo_kernel<<<blocks*2,256>>>( dev_buffer, SIZE, dev_histo );
    
    unsigned int    histo[256];
    HANDLE_ERROR( hipMemcpy( histo, dev_histo,
                              256 * sizeof( int ),
                              hipMemcpyDeviceToHost ) );

    // get stop time, and display the timing results
    HANDLE_ERROR( hipEventRecord( stop, 0 ) );
    HANDLE_ERROR( hipEventSynchronize( stop ) );
    float   elapsedTime;
    HANDLE_ERROR( hipEventElapsedTime( &elapsedTime,
                                        start, stop ) );
    printf( "Time to generate:  %3.1f ms\n", elapsedTime );

    long histoCount = 0;
    for (int i=0; i<256; i++) {
        histoCount += histo[i];
    }
    printf( "Histogram Sum:  %ld\n", histoCount );

    // verify that we have the same counts via CPU
    for (int i=0; i<SIZE; i++)
        histo[buffer[i]]--;
    for (int i=0; i<256; i++) {
        if (histo[i] != 0)
            printf( "Failure at %d!  Off by %d\n", i, histo[i] );
    }

    HANDLE_ERROR( hipEventDestroy( start ) );
    HANDLE_ERROR( hipEventDestroy( stop ) );
    hipFree( dev_histo );
    hipFree( dev_buffer );
    free( buffer );
    return 0;
}