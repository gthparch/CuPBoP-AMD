clang++ vecAdd.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
llvm-dis vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc
llvm-dis vecAdd-host-x86_64-unknown-linux-gnu.bc