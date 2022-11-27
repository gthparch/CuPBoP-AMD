# clang++ empty.cu -o a.out

# clang++ empty.cu -c --cuda-gpu-arch=sm_50 \
#     -L/usr/local/cuda-11.6/lib64             \
#     -lcudart_static -ldl -lrt -pthread

clang++ empty.cu -c  \
     --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v