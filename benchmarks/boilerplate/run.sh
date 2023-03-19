#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
SAVE_OUTPUTS=0

make

echo "[*] Running CuPBoP version..."
time ./<benchmark>.cupbop filelist -r 5 -lat 30 -lng 90

echo "[*] Running HIPIFY version..."
time ./<benchmark>.hipify filelist -r 5 -lat 30 -lng 90

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f <any other intermediate files>
fi
