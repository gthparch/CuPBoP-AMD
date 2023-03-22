#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>

class TestDeviceClass {
  public:
    unsigned int value_a, value_b;

    __device__ TestDeviceClass() {
        value_a = 123;
        value_b = 321;
    }

    __device__ virtual unsigned get_value() { return value_a; }

    __device__ virtual unsigned get_value_fixed() { return value_a; }
};

class TestDeviceSubclass : public TestDeviceClass {
  public:
    __device__ virtual unsigned get_value() override { return value_b; }
};

__global__ void test_polymorphism() {
    auto test_a = TestDeviceClass();
    auto test_b = TestDeviceSubclass();
    TestDeviceClass *test_ref = &test_a;

    if ((threadIdx.x & 0x01) == 0) {
        test_ref = &test_b;
    }

    __syncthreads();
    printf("TID.x=%d, test_ref.get_value()=%d, test_ref.get_value_fixed()=%d\n",
           threadIdx.x, test_ref->get_value(), test_ref->get_value_fixed());
}

int main() {
    test_polymorphism<<<2, 4>>>();
    cudaDeviceSynchronize();
    return 0;
}
