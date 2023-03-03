#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

make -j$(nproc)

echo "[*] Running CuPBoP version..."
AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./b+tree.cupbop \
    file "$RODINIA_PATH/rodinia-data/b+tree/mil.txt" \
    command "$RODINIA_PATH/rodinia-data/b+tree/command.txt"

echo "[*] Running hipify version..."
./b+tree.hipify \
    file "$RODINIA_PATH/rodinia-data/b+tree/mil.txt" \
    command "$RODINIA_PATH/rodinia-data/b+tree/command.txt"
