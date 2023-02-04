#include <stdio.h>
#include <stdlib.h>
#include "hip/hip_runtime.h"

// to compile:
// nvcc -O0 -o transpose transpose.cu -lm
// 
// to run:
// ./transpose 1024

// assume going forward 32x32 threads in each thread-block
#define BDIM 32

// reference "copy" kernel
__global__ void copy(int N, 
		     const float *  __restrict__ A,
		     float * __restrict__ AT){
	   
  int idx = threadIdx.x + blockDim.x*blockIdx.x;
  int idy = threadIdx.y + blockDim.y*blockIdx.y;

  // output
  if(idx<N && idy<N){
    AT[idx+idy*N] = A[idx+idy*N];
  }
}

// naive CUDA transpose kernel
__global__ void transposeV1(int N, 
			    const float * __restrict__ A, 
			    float * __restrict__ AT){
	   
  const int idx = threadIdx.x + blockDim.x*blockIdx.x;
  const int idy = threadIdx.y + blockDim.y*blockIdx.y;

  // output
  if(idx<N && idy<N){
    AT[idx+idy*N] = A[idy+idx*N]; // read A non-coalesced, write AT as coalesced
  }
}


// shared memory CUDA transpose kernel
__global__ void transposeV2(int N, 
			    const float *  __restrict__ A, 
			    float * __restrict__ AT){
	   
  const int idx = threadIdx.x + blockDim.x*blockIdx.x;
  const int idy = threadIdx.y + blockDim.y*blockIdx.y;

  __shared__ float s_A[BDIM][BDIM];

  // check this is a legal matrix entry
  if(idx<N && idy<N){
    s_A[threadIdx.y][threadIdx.x] = A[idx+idy*N]; // coalesced reads
  }

  // make sure all threads in this thread-block
  // have read into shared
  __syncthreads();

  // find coordinates of thread in transposed block
  const int idxT = threadIdx.x + blockDim.y*blockIdx.y;
  const int idyT = threadIdx.y + blockDim.x*blockIdx.x;

  // output
  if(idxT<N && idyT<N){
    AT[idxT+idyT*N] = s_A[threadIdx.x][threadIdx.y];
  }
}

// shared memory CUDA transpose kernel with padding to avoid smem bank conflicts
__global__ void transposeV3(int N, 
			    const float *  __restrict__ A, 
			    float * __restrict__ AT){
	   
  const int idx = threadIdx.x + blockDim.x*blockIdx.x;
  const int idy = threadIdx.y + blockDim.y*blockIdx.y;

  // pad by 1 to avoid 32-width bank-conflicts
  __shared__ float s_A[BDIM][BDIM+1];

  // check this is a legal matrix entry
  if(idx<N && idy<N){
    s_A[threadIdx.y][threadIdx.x] = A[idx+idy*N];
  }

  // ensure all threads in thread-block finish
  __syncthreads();

  // find coordinates of thread in transposed block
  const int idxT = threadIdx.x + blockDim.y*blockIdx.y;
  const int idyT = threadIdx.y + blockDim.x*blockIdx.x;

  // output
  if(idxT<N && idyT<N){
    AT[idxT+idyT*N] = s_A[threadIdx.x][threadIdx.y];    
  }
}


int main(int argc, char **argv){
  
  int N = 2048;
  float *A  = (float*) calloc(N*N, sizeof(float));
  float *AT = (float*) calloc(N*N, sizeof(float));

  printf("N=%d\n", N);

  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      A[j+i*N] = j;
    }
  }

  float *c_A, *c_AT;
  size_t sz = N*N*sizeof(float); // size of matrix
  hipMalloc(&c_A, sz);
  hipMalloc(&c_AT, sz);
  hipMemcpy(c_A, A, sz, hipMemcpyHostToDevice);

  int Nblocks = (N+BDIM-1)/BDIM; // nearest Nblocks such that Nblocks * BDIM > N
  dim3 threadsPerBlock(BDIM,BDIM,1);
  dim3 blocks(Nblocks,Nblocks,1);

  copy <<< blocks,threadsPerBlock >>> (N,c_A,c_AT);
  transposeV1 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);
  transposeV2 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);
  transposeV3 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);

  hipMemcpy(AT, c_AT, sz, hipMemcpyDeviceToHost);
  
  // --------------------------------------------------------------------------------

  hipError_t err = hipGetLastError();
  if(err != hipSuccess){
    fprintf(stderr, "CUDA ERROR: %s\n", 
	    hipGetErrorString(err));
  }  

}