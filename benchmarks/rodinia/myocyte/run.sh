#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Workload 1: Single Workload"

echo "[*] Running CuPBoP version..."
./myocyte.cupbop 128 1 0
mv output.txt output.single.cupbop.txt

echo "[*] Running HIPIFY version..."
./myocyte.hipify 128 1 0
mv output.txt output.single.hipify.txt

echo "[*] Workload 2: Parallelized 256 Workloads"

echo "[*] Running CuPBoP version..."
./myocyte.cupbop 128 256 1
# mv output.txt output.multi.cupbop.txt

echo "[*] Running HIPIFY version..."
./myocyte.hipify 128 256 1
# mv output.txt output.multi.hipify.txt

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f output.single.cupbop.txt output.single.hipify.txt \
        output.multi.cupbop.txt output.multi.hipify.txt
fi
