#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

clang -o hurricane_gen hurricane_gen.c

make

# ./hurricane_gen 21893120 2048
echo "[*] Gathering input files..."
find "$RODINIA_PATH/rodinia-data/nn" -name "cane*" -type f -print | sort | tee filelist

echo "[*] Running CuPBoP version..."
time ./nn.cupbop filelist -r 5 -lat 30 -lng 90

echo "[*] Running HIPIFY version..."
time ./nn.hipify filelist -r 5 -lat 30 -lng 90

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f hurricane_gen filelist
fi
