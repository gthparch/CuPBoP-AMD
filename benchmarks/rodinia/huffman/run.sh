#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

make -j$(nproc)

# export AMD_LOG_LEVEL=4

echo "[*] Running CuPBoP version..."
./huffman.cupbop "$RODINIA_PATH/rodinia-data/huffman/test1024_H2.206587175259.in"

echo "[*] Running HIPIFY version..."
./huffman.hipify "$RODINIA_PATH/rodinia-data/huffman/test1024_H2.206587175259.in"
