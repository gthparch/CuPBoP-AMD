#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

make

echo "[*] Running CuPBoP version..."
time ./leukocyte.cupbop "$RODINIA_PATH/rodinia-data/leukocyte/testfile.avi" 5

echo "[*] Running HIPIFY version..."
time ./leukocyte.hipify "$RODINIA_PATH/rodinia-data/leukocyte/testfile.avi" 5
