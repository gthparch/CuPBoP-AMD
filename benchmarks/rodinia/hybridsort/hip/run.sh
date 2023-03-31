# hipcc -c mergesort_kernel.cu --save-temps -O3 
# llvm-dis mergesort_kernel-hip-amdgcn-amd-amdhsa-gfx90a.bc
# llvm-dis mergesort_kernel-host-x86_64-unknown-linux-gnu.bc 

# clang++ mergesort_kernel.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis mergesort_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc

# /nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator mergesort_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis main-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.b

/nethome/jchen706/coding/code2/amdcuda/scripts/amdcuda -c  mergesort_kernel.cu 