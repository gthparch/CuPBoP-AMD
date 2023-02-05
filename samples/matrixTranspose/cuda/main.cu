#include <stdio.h>
#include <stdlib.h>
#include "cuda_runtime.h"

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

void validate(float *output, float *reference, int n) {
  int num_invalid = 0;
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      if (output[j+i*n] != reference[j+i*n]) {
        num_invalid += 1;
        fprintf(stderr, "output[%d, %d]: %d != reference: %d\n", j, i, output[j+i*n], reference[j+i*n]);
      }
    }
  }
  printf("%d inconsistencies\n", num_invalid);
}

int main(int argc, char **argv){
  
  int N = 2048;
  float *A  = (float*) calloc(N*N, sizeof(float));
  float *AT = (float*) calloc(N*N, sizeof(float));
  float *AT_ref = (float*) calloc(N*N, sizeof(float));

  printf("N=%d\n", N);

  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      A[j+i*N] = j;
      AT_ref[i+j*N] = j;
    }
  }

  float *c_A, *c_AT;
  size_t sz = N*N*sizeof(float); // size of matrix
  cudaMalloc(&c_A, sz);
  cudaMalloc(&c_AT, sz);
  cudaMemcpy(c_A, A, sz, cudaMemcpyHostToDevice);

  int Nblocks = (N+BDIM-1)/BDIM; // nearest Nblocks such that Nblocks * BDIM > N
  dim3 threadsPerBlock(BDIM,BDIM,1);
  dim3 blocks(Nblocks,Nblocks,1);

  printf("transposeV1");
  copy <<< blocks,threadsPerBlock >>> (N,c_A,c_AT);
  transposeV1 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);
  cudaMemcpy(AT, c_AT, sz, cudaMemcpyDeviceToHost);
  validate(AT, AT_ref, N);
  
  printf("transposeV2");
  transposeV2 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);
  cudaMemcpy(AT, c_AT, sz, cudaMemcpyDeviceToHost);
  validate(AT, AT_ref, N);

  printf("transposeV3");
  transposeV3 <<< blocks, threadsPerBlock >>> (N, c_A, c_AT);
  cudaMemcpy(AT, c_AT, sz, cudaMemcpyDeviceToHost);
  validate(AT, AT_ref, N);
  
  // --------------------------------------------------------------------------------

  cudaError_t err = cudaGetLastError();
  if(err != cudaSuccess){
    fprintf(stderr, "CUDA ERROR: %s\n", 
	    cudaGetErrorString(err));
  } else {
    fprintf(stderr, "No cuda error reported.\n");
  }

}