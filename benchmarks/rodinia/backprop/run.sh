#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# export AMD_LOG_LEVEL=4

make -j$(nproc)

echo "[*] Running CuPBoP version..."
time ./backprop.cupbop 2097152

echo "[*] Running hipify version..."
time ./backprop.hipify 2097152
