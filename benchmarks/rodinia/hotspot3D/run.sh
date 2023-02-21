#!/bin/bash

AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

"$AMDCUDA_DIR/scripts/amdcuda" -o 3D.cupbop 3D.cu

AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./3D.cupbop \
    512 8 100 \
    "$RODINIA_PATH/rodinia-data/hotspot3D/power_512x8" \
    "$RODINIA_PATH/rodinia-data/hotspot3D/temp_512x8" \
    "hotspot3d-output.txt"

# echo "[*] Printing differences between output and the references..."
# diff "hotspot3d-output.txt" "hotspot3d-reference-output.txt"
