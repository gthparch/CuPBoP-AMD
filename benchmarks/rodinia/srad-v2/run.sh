#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./srad.cupbop 2048 2048 0 127 0 127 0.5 2

echo "[*] Running HIPIFY version..."
time ./srad.hipify 2048 2048 0 127 0 127 0.5 2

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
fi
