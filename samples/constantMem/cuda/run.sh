# clang++ main.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis main-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis main-host-x86_64-unknown-linux-gnu.bc

# /nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator main-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis main-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc

export AMD_LOG_LEVEL=4
../../../scripts/amdcuda -g main.cu
./main.translated
