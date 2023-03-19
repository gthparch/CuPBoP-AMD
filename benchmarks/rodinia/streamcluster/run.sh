#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./streamcluster.cupbop 10 20 256 65536 65536 1000 none output.cupbop.txt 1

echo "[*] Running HIPIFY version..."
time ./streamcluster.hipify 10 20 256 65536 65536 1000 none output.hipify.txt 1

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm output.cupbop.txt output.hipify.txt
fi
