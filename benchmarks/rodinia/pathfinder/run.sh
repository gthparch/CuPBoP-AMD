#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./pathfinder.cupbop 100000 100 20 > output.cupbop.txt

echo "[*] Running HIPIFY version..."
time ./pathfinder.hipify 100000 100 20 > output.hipify.txt

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f output.cupbop.txt output.hipify.txt
fi
