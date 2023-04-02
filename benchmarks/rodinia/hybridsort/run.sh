#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./hybridsort.cupbop

echo "[*] Running HIPIFY version..."
time ./hybridsort.hipify

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
fi