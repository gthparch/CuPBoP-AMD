#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# export AMD_LOG_LEVEL=4

make -j$(nproc)

echo "[*] Running CuPBoP version..."
time ./euler3d.cupbop "$RODINIA_PATH/rodinia-data/cfd/fvcorr.domn.097K"

echo "[*] Running HIPIFY version..."
time ./euler3d.hipify "$RODINIA_PATH/rodinia-data/cfd/fvcorr.domn.097K"
