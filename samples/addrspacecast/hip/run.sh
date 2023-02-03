# clang++ main.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis main-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis main-host-x86_64-unknown-linux-gnu.bc


hipcc empty.cpp --save-temps -O3 
# llvm-dis empty-hip-amdgcn-amd-amdhsa-gfx90a.bc
# llvm-dis empty-host-x86_64-unknown-linux-gnu.bc 