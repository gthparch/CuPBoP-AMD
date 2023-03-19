#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./lud.cupbop -s 256 -v > output.cupbop.txt

echo "[*] Running HIPIFY version..."
time ./lud.hipify -s 256 -v > output.hipify.txt

echo "[*] Comparing outputs..."
diff output.cupbop.txt output.hipify.txt | cat

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f output.cupbop.txt output.hipify.txt
fi
