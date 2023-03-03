#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# export AMD_LOG_LEVEL=4

make -j$(nproc)

echo "[*] Running CuPBoP version..."
time ./bfs.cupbop "${RODINIA_PATH}/rodinia-data/bfs/graph1MW_6.txt"

echo "[*] Running HIPIFY version..."
time ./bfs.hipify "${RODINIA_PATH}/rodinia-data/bfs/graph1MW_6.txt"
