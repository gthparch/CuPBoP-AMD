#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version with random values..."
time ./hybridsort.cupbop ../rodinia-data/hybridsort/500000.txt

echo "[*] Running HIPIFY version..."
time ./hybridsort.cupbop ../rodinia-data/hybridsort/500000.txt

# if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
#     echo "[*] Cleaning up..."
#     make clean
# fi

# ./hybridsort.cupbop r
# ./hybridsort.cupbop /nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/rodinia-data/hybridsort/t.txt > z1.txt
# ./hybridsort.hipify /nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/rodinia-data/hybridsort/t.txt > z2.txt