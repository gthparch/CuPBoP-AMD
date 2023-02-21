#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

"$AMDCUDA_DIR/scripts/amdcuda" gaussian.cu

AMD_LOG_LEVEL=4 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./gaussian.translated \
    -f "$RODINIA_PATH/rodinia-data/gaussian/matrix1024.txt"
