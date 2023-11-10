#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# "$AMDCUDA_DIR/scripts/amdcuda" -o "kmeans.cupbop" \
#     cluster.o rmse.o kmeans_clustering.o kmeans.o \
#     kmeans_cuda.cu \
make

echo "[*] Running CuPBoP version..."
 
# AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./kmeans.cupbop -o -i \
#     file "$RODINIA_PATH/rodinia-data/kmeans/kdd_cup"

echo $RODINIA_PATH
time  ./kmeans.cupbop -o -i "$RODINIA_PATH/rodinia-data/kmeans/kdd_cup"
