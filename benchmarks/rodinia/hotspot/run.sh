#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

"$AMDCUDA_DIR/scripts/amdcuda" hotspot.cu

AMD_LOG_LEVEL=4 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./hotspot.translated \
    512 2 2 \
    "$RODINIA_PATH/rodinia-data/hotspot/temp_512" \
    "$RODINIA_PATH/rodinia-data/hotspot/power_512" \
    "hotspot-output.txt"

echo "[*] Printing differences between output and the references..."
diff "hotspot-output.txt" "hotspot-reference-output.txt"
