#include "cuda_runtime.h"
#include "stdio.h"

// __global__ void test1(int* A, unsigned int* B, unsigned long long int* C)
// {
//   atomicOr(A,10); // 1010

//   atomicOr(B,7);  // 0111

//   atomicOr(C,5);  // 0101
// }


// __global__ void test2(int* A, unsigned int* B, unsigned long long int* C, float* D)
// {
// 	atomicAdd(A,10);

// 	atomicAdd(B,10);

// 	atomicAdd(C,10);

// 	atomicAdd(D,10.8);

// }

// __global__ void test3 (int* A, unsigned int* B, unsigned long long int* C)
// {
//   atomicAnd(A,10);

//   atomicAnd(B,1);

//   atomicAnd(C,5);
// }


// __global__ void test4 (int* A, unsigned int* B, unsigned long long int* C)
// {
//   atomicCAS(A,2,11);

//   atomicCAS(B,5,1);

//   atomicCAS(C,7,3);
// }

// __global__ void test5(int* A, unsigned int* B, unsigned long long int* C, float* D)
// {
// 	atomicExch(A,10);

// 	atomicExch(B,100);

// 	atomicExch(C,20);

// 	atomicExch(D,200.0);
// }

// __global__ void test6(unsigned int* B)
// {
//   atomicDec(B,7);//0111 -> 1000 -> 0000 -> 0001 -> 0010 -> 0011 -> 0100 -> 0101 -> 0110 ...
//   	  /*the second argument on atomicDec() is a limit for decs. When this limit is reached, B receives <LIM>*/
// }

// __global__ void test7(unsigned int* B)
// {
//   atomicInc(B,7);//0111 -> 1000 -> 0000 -> 0001 -> 0010 -> 0011 -> 0100 -> 0101 -> 0110 ...
//   	  /*the second argument on atomicInc() is a limit for increments. When this limit is reached, B receives 0*/
// }

// __global__ void test8(int* A, unsigned int* B, unsigned long long int* C)
// {
//   atomicMax(A,10);

//   atomicMax(B,1);

//   atomicMax(C,5);
// }

// __global__ void test9(int* A, unsigned int* B, unsigned long long int* C)
// {
//   atomicMin(A,10);

//   atomicMin(B,1);

//   atomicMin(C,5);
// }

// __global__ void test10(int* A, unsigned int* B)
// {
// 	atomicSub(A,10);

// 	atomicSub(B,5);

// }

__global__ void test11(int* A, unsigned int* B, unsigned long long int* C)
{
  atomicXor(A,10);//1010 xor 0101 = 1111 /*xor looks for distinct bits*/

  atomicXor(B,7);//0111 xor 0101 = 0010

  atomicXor(C,5);//0101 xor 0101 = 0000
}



int main() {

  int NUM_ELEMENTS = 1;
  int* host_a; 
  unsigned int* host_b;
  unsigned long long int* host_c;
  float* host_d;

  int* device_a;
  unsigned int* device_b;
  unsigned long long int* device_c;
  float* device_d;

  cudaMalloc(&device_a, NUM_ELEMENTS * sizeof(int));

  cudaMalloc(&device_b, NUM_ELEMENTS * sizeof(unsigned int));

  cudaMalloc(&device_c, NUM_ELEMENTS * sizeof(unsigned long long int));

  cudaMalloc(&device_d, NUM_ELEMENTS * sizeof(float));


  host_a = (int*)malloc(NUM_ELEMENTS * sizeof(int));
  host_b = (unsigned int*)malloc(NUM_ELEMENTS * sizeof(unsigned int));
  host_c = (unsigned long long int*)malloc(NUM_ELEMENTS * sizeof(unsigned long long int));
  host_d = (float*)malloc(NUM_ELEMENTS * sizeof(float));
  
  // test 1, test 2, test 5

  *host_a = 0;
  *host_b = 0;
  *host_c = 0;
  *host_d = 0;

  // test 3, test 4

  *host_a = 5; // 2 and 0110
  *host_b = 5; // 0000 and 0001
  *host_c = 5; // 0 and 0101
  
  cudaMemcpy(device_a, host_a ,NUM_ELEMENTS * sizeof(int)  , cudaMemcpyDeviceToHost);
  cudaMemcpy(device_b, host_b ,NUM_ELEMENTS * sizeof(unsigned int)  , cudaMemcpyDeviceToHost);
  cudaMemcpy(device_c, host_c ,NUM_ELEMENTS * sizeof(unsigned long long int)  , cudaMemcpyDeviceToHost);
  cudaMemcpy(device_d, host_d ,NUM_ELEMENTS * sizeof(float)  , cudaMemcpyDeviceToHost);

  test11<<<1,1>>>(device_a, device_b, device_c);
  // test5<<<1,1>>>(device_a, device_b, device_c, device_d);
  // test4<<<1,1>>>(device_a, device_b, device_c);
  // test7<<<1,1>>>(device_b);
  // test10<<<1,1>>>(device_a, device_b);


  cudaMemcpy(host_a, device_a ,NUM_ELEMENTS * sizeof(int)  , cudaMemcpyHostToDevice);
  cudaMemcpy(host_b, device_b ,NUM_ELEMENTS * sizeof(unsigned int)  , cudaMemcpyHostToDevice);
  cudaMemcpy(host_c, device_c ,NUM_ELEMENTS * sizeof(unsigned long long int)  , cudaMemcpyHostToDevice);
  cudaMemcpy(host_d, device_d ,NUM_ELEMENTS * sizeof(float)  , cudaMemcpyHostToDevice);


  printf(" %d ", *host_a);
  printf(" %d ", *host_b);
  printf(" %llu \n", *host_c);
  printf(" %f \n", *host_d);


  // check Answers

  cudaFree(device_a);
  cudaFree(device_b);
  cudaFree(device_c);
  cudaFree(device_d);

  free(host_a);
  free(host_b);
  free(host_c);
  free(host_d);


}