HIPIFY=hipify-clang
HIPIFY_FLAGS=
HIPCC=hipcc
HIPCC_FLAGS=-g --save-temps
GPU_ARCH=sm_61
CXX=clang++
CXXFLAGS=-g -S -emit-llvm --cuda-path=/usr/local/cuda --cuda-gpu-arch=$(GPU_ARCH) -L/usr/local/cuda/lib64 -ldl -lrt -save-temps
ROCM_PATH=/opt/rocm
ROCM_LLVM_DIS=$(ROCM_PATH)/llvm/bin/llvm-dis

.PHONY: all clean

%.hip: %.cu
	$(HIPIFY) $(HIPIFY_FLAGS) -o $@ $<

%.cu.device.ll: %.cu
	$(CXX) $(CXXFLAGS) $<
	mv $(patsubst %.cu,%-cuda-nvptx64-nvidia-cuda-$(GPU_ARCH).ll,$<) $@
	mv $(patsubst %.cu,%.ll,$<) $(patsubst %.cu,%.cu.host.ll,$<)

%.hip.device.bc: %.hip
	$(HIPCC) $(HIPCC_FLAGS) -o $(patsubst %.hip,%.hip.out,$<) $<
	mv $(patsubst %.hip,%-hip-amdgcn-amd-amdhsa-gfx803.bc,$<) $@
	mv $(patsubst %.hip,%-host-x86_64-unknown-linux-gnu.bc,$<) $(patsubst %.hip,%.hip.host.bc,$<)

%.hip.device.ll: %.hip.device.bc
	$(ROCM_LLVM_DIS) $<
	$(ROCM_LLVM_DIS) $(patsubst %.hip.device.bc,%.hip.host.bc,$<)

all: vecadd.hip vecadd.hip.device.ll vecadd.cu.device.ll

package: all
	rm *.cui *.bc *.o *.out *.resolution.txt *.s *.hipfb
	tar -czvf vecadd.tar.gz *

clean:
	rm -f *.hip *.ll *.cui *.bc *.hipfb *.s *.o *.out *.out.resolution.txt
