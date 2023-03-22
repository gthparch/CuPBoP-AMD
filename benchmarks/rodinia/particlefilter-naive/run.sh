#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./particlefilter-naive.cupbop -x 128 -y 128 -z 10 -np 1000 > output.cupbop.txt

echo "[*] Running HIPIFY version..."
time ./particlefilter-naive.hipify -x 128 -y 128 -z 10 -np 1000 > output.hipify.txt

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f output.cupbop.txt output.hipify.txt
fi
