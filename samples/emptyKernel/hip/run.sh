# ROCM_PATH="/nethome/jchen706/opt"
# HIP_PATH="/nethome/jchen706/opt/hip"


# run clang to generate llvm

# clang++ empty.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis empty-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis empty-host-x86_64-unknown-linux-gnu.bc

# export LD_LIBRARY_PATH=/nethome/jchen706/opt/lib:/nethome/jchen706/opt/hip/lib:/nethome/jchen706/coding/amdcuda/runtime/build:$LD_LIBRARY_PATH

# g++ -o test -g main.cpp -L/nethome/jchen706/coding/amdcuda/runtime/build \
# -I/nethome/jchen706/coding/amdcuda/runtime/include -lcudaonamd -lc

# -L$HIP_PATH/lib -lamdhip64 -L$ROCM_PATH/lib -lhsa-runtime64 -ldl -lnuma

# run for hip to generate llvm

hipcc empty.cpp -c --save-temps -O3 
llvm-dis empty-hip-amdgcn-amd-amdhsa-gfx90a.bc
llvm-dis empty-host-x86_64-unknown-linux-gnu.bc 


# /nethome/jchen706/coding/amdcuda/newbuild/compilation/hostTranslator empty-host-x86_64-unknown-linux-gnu.ll empty.cu-hip-amdgcn-amd-amdhsa.hipfb
