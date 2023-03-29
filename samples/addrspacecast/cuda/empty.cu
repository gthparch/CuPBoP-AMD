#include "cuda_runtime.h"
#include "stdio.h"

__global__ void empty(int *N) {
    int a = 5;
    *N = 10;
    int myNum[3] = {10, 20, 30};
    int al = sizeof(myNum) / sizeof(myNum[0]);
    for (int i = 0; i < al; i++) {
        *N = *N + myNum[i] * a;
    }
}

struct myStruct {
    int a;
    int b;
    int c;
};

__global__ void empty_byval(myStruct x, int *N) {
    *N = x.a + x.b + x.c;
}

// 10 + 10 * 5 = 60
// 60 + 6- * 5
// __global__ void empty(int* N) {
//   int a = 5;
//   *N = 10;
//   int myNum[3] = {10, 20, 30};
//   int al = sizeof(myNum)/sizeof(myNum[0]);
//   for(int i = 0; i< al; i++) {
//     *N = *N + myNum[i] * a;
//   }
// }

int main(int argc, char **argv) {
    int *host_n;
    int *device_n;
    myStruct x { 3, 2, 1 };

    host_n = (int *)malloc(sizeof(int));
    cudaMalloc(&device_n, sizeof(int));

    // With simple argument
    empty<<<1, 1>>>(device_n);
    cudaMemcpy(host_n, device_n, sizeof(int), cudaMemcpyDeviceToHost);

    printf("Value: %d\n", *host_n); // 310
    if (*host_n == 310) {
        printf("Success 1\n");
    }

    // With one byval() struct
    empty_byval<<<1, 1>>>(x, device_n);
    cudaMemcpy(host_n, device_n, sizeof(int), cudaMemcpyDeviceToHost);

    printf("Value: %d\n", *host_n);
    if (*host_n == 6) {
        printf("Success 2\n");
    }

    cudaFree(device_n);
    return 0;
}
