# #!/bin/bash

# AMDCUDA_DIR=`realpath ../../..`
# RODINIA_PATH=`realpath ..`

# make -j$(nproc)

# # export AMD_LOG_LEVEL=4

# echo "[*] Running CuPBoP version..."
# time ./dwt2d.cupbop rgb.bmp -d 1024x1024 -f -5 -l 3

# echo "[*] Running HIPIFY version..."
# time ./dwt2d.hipify rgb.bmp -d 1024x1024 -f -5 -l 3



#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
FLAG=$1
BENCHMARK="dwt2d"

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
        { time (./$BENCHMARK.cupbop rgb.bmp -d 1024x1024 -f -5 -l 3) >/dev/null; } 2>>$CuBoP_OUTPUT_FILE
        
        echo "[*] Running hipify version..."
        { time (./$BENCHMARK.hipify rgb.bmp -d 1024x1024 -f -5 -l 3) >/dev/null; } 2>>$HIPIFY_OUTPUT_FILE

    else
        echo "[*] Running CuPBoP version..."
        time ./$BENCHMARK.cupbop rgb.bmp -d 1024x1024 -f -5 -l 3
        echo "[*] Running hipify version..."
        time ./$BENCHMARK.hipify rgb.bmp -d 1024x1024 -f -5 -l 3
    fi
done

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f ./result.txt
fi