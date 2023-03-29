#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
FLAG=$1
BENCHMARK="hotspot3D"

TIMEFORMAT='%3R'
CuBoP_OUTPUT_FILE="CuPBoP_Execution_Time.txt" 
HIPIFY_OUTPUT_FILE="HIPIFY_Execution_Time.txt" 
count=1
SAVE_OUTPUTS=0

make -j$(nproc)


# export AMD_LOG_LEVEL=4
if [ "$FLAG" = "-r" ]; then
    > $CuBoP_OUTPUT_FILE
    > $HIPIFY_OUTPUT_FILE
fi


for i in $(seq $count); do
    if [ "$FLAG" = "-r" ]; then
        echo "[*] Running CuPBoP version..."
        #{ /usr/bin/time -f "%e" sh -c '"$0" "$@" > /dev/null 2>&1' ./$TEST.cupbop -f "$RODINIA_PATH/rodinia-data/gaussian/matrix1024.txt"; } 2>> $CuBoP_OUTPUT_FILE
        { time (./$BENCHMARK.cupbop 512 8 100 "$RODINIA_PATH/rodinia-data/hotspot3D/power_512x8" "$RODINIA_PATH/rodinia-data/hotspot3D/temp_512x8" "hotspot3d-output-cupbop.txt") >/dev/null; } 2>>$CuBoP_OUTPUT_FILE
        # echo "[*] Printing differences between output and the references..."
        # diff "hotspot3d-output-cupbop.txt" "hotspot3d-reference-output.txt"
        
        echo "[*] Running hipify version..."
        { time (./$BENCHMARK.hipify 512 8 100 "$RODINIA_PATH/rodinia-data/hotspot3D/power_512x8" "$RODINIA_PATH/rodinia-data/hotspot3D/temp_512x8" "hotspot3d-output-hipify.txt") >/dev/null; } 2>>$HIPIFY_OUTPUT_FILE
        # echo "[*] Printing differences between output and the references..."
        # diff "hotspot3d-output-hipify.txt" "hotspot3d-reference-output.txt"
    
    else
        echo "[*] Running CuPBoP version..."
        time ./$BENCHMARK.cupbop 512 8 100 "$RODINIA_PATH/rodinia-data/hotspot3D/power_512x8" "$RODINIA_PATH/rodinia-data/hotspot3D/temp_512x8" "hotspot3d-output-cupbop.txt"
        # echo "[*] Printing differences between output and the references..."
        # diff "hotspot3d-output-cupbop.txt" "hotspot3d-reference-output.txt"
        echo "[*] Running hipify version..."
        time ./$BENCHMARK.hipify 512 8 100 "$RODINIA_PATH/rodinia-data/hotspot3D/power_512x8" "$RODINIA_PATH/rodinia-data/hotspot3D/temp_512x8" "hotspot3d-output-hipify.txt"
        #echo "[*] Printing differences between output and the references..."
        #diff "hotspot3d-output-hipify.txt" "hotspot3d-reference-output.txt"
    fi
done

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f "hotspot3d-output-cupbop.txt" "hotspot3d-output-hipify.txt"
fi