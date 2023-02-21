#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

"$AMDCUDA_DIR/scripts/amdcuda" -o "b+tree.cupbop" \
    kernel/kernel_gpu_cuda_wrapper.cu \
    kernel/kernel_gpu_cuda_wrapper_2.cu \
    util/cuda/cuda.cu \
    util/num/num.cu \
    util/timer/timer.cu \
    main.cu

AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./b+tree.cupbop \
    file "$RODINIA_PATH/rodinia-data/b+tree/mil.txt" \
    command "$RODINIA_PATH/rodinia-data/b+tree/command.txt"
