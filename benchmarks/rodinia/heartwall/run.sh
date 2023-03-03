#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

make -j$(nproc)

echo "[*] Running CuPBoP version..."
time ./heartwall.cupbop "${RODINIA_PATH}/rodinia-data/heartwall/test.avi" 20

echo "[*] Running HIPIFY version..."
time ./heartwall.hipify "${RODINIA_PATH}/rodinia-data/heartwall/test.avi" 20
