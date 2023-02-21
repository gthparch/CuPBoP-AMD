#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

pushd kernel
"$AMDCUDA_DIR/scripts/amdcuda" -c \
    kernel_gpu_cuda_wrapper.cu \
    kernel_gpu_cuda_wrapper_2.cu
popd

pushd util/cuda
    "$AMDCUDA_DIR/scripts/amdcuda" -c cuda.cu
popd

pushd util/num
    "$AMDCUDA_DIR/scripts/amdcuda" -c num.c
popd

pushd util/timer
    "$AMDCUDA_DIR/scripts/amdcuda" -c timer.c
popd

"$AMDCUDA_DIR/scripts/amdcuda" -o "b+tree.cupbop" \
    kernel/kernel_gpu_cuda_wrapper.o \
    kernel/kernel_gpu_cuda_wrapper_2.o \
    util/cuda/cuda.o \
    util/num/num.o \
    util/timer/timer.o \
    main.cu

AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./b+tree.cupbop \
    file "$RODINIA_PATH/rodinia-data/b+tree/mil.txt" \
    command "$RODINIA_PATH/rodinia-data/b+tree/command.txt"
