#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

make -j$(nproc)

# export AMD_LOG_LEVEL=4

echo "[*] Running CuPBoP version..."
time ./dwt2d.cupbop rgb.bmp -d 1024x1024 -f -5 -l 3

echo "[*] Running HIPIFY version..."
time ./dwt2d.hipify rgb.bmp -d 1024x1024 -f -5 -l 3
