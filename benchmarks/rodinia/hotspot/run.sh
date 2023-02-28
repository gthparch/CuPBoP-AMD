#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

export AMD_LOG_LEVEL=4

make -j$(nproc)

LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" time ./hotspot.cupbop \
    512 2 2 \
    "$RODINIA_PATH/rodinia-data/hotspot/temp_512" \
    "$RODINIA_PATH/rodinia-data/hotspot/power_512" \
    "hotspot-output.cupbop.txt"
echo "[*] Printing differences between output and the references..."
diff "hotspot-output.cupbop.txt" "hotspot-reference-output.txt"

time ./hotspot.hipify \
    512 2 2 \
    "$RODINIA_PATH/rodinia-data/hotspot/temp_512" \
    "$RODINIA_PATH/rodinia-data/hotspot/power_512" \
    "hotspot-output.hipify.txt"
echo "[*] Printing differences between output and the references..."
diff "hotspot-output.hipify.txt" "hotspot-reference-output.txt"

echo "[*] Cleaning up..."
make clean
rm -f "hotspot-output.cupbop.txt" "hotspot-output.hipify.txt"
