# hipcc -c mummergpu_kernel.cu --save-temps -O3 
# llvm-dis mummergpu_kernel-hip-amdgcn-amd-amdhsa-gfx90a.bc
# llvm-dis mummergpu_kernel-host-x86_64-unknown-linux-gnu.bc 

# clang++ mummergpu_kernel.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis mummergpu_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc

# hipify-perl  mummergpu_kernel.cu > mummergpu_kernel.cpp

/nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator mummergpu_kernel-cuda-nvptx64-nvidia-cuda-sm_35.ll

# Process Device Side Vector Function Type _Z7addr2idj
# Process Device Side Vector Function Type _Z7id2addri
# Process Device Side Vector Function Type _Z14arrayToAddress6uchar3Rj