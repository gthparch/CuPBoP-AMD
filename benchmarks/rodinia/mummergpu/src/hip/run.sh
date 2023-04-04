hipcc -c mummergpu_kernel.cu --save-temps -O3 
llvm-dis mummergpu_kernel-hip-amdgcn-amd-amdhsa-gfx90a.bc
llvm-dis mummergpu_kernel-host-x86_64-unknown-linux-gnu.bc 

# clang++ mummergpu_kernel.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis mummergpu_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc

# hipify-perl  mummergpu_kernel.cu > mummergpu_kernel.cpp