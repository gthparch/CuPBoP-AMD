#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# "$AMDCUDA_DIR/scripts/amdcuda" gaussian.cu
make

# export AMD_LOG_LEVEL=4

echo "[*] Running CuPBoP version..."
LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./gaussian.cupbop \
    -f "$RODINIA_PATH/rodinia-data/gaussian/matrix1024.txt"

echo "[*] Running hipify version..."
./gaussian.hipify \
    -f "$RODINIA_PATH/rodinia-data/gaussian/matrix1024.txt"
