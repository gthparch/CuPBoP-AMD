#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`
FLAG=$1
BENCHMARK="myocyte"

TIMEFORMAT='%3R'
CuBoP_OUTPUT_FILE="CuPBoP_Execution_Time.txt" 
HIPIFY_OUTPUT_FILE="HIPIFY_Execution_Time.txt" 
count=10
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
        { time (./$BENCHMARK.cupbop 128 1 0) >/dev/null; } 2>>$CuBoP_OUTPUT_FILE
        mv output.txt output.single.cupbop.txt
        
        echo "[*] Running hipify version..."
        { time (./$BENCHMARK.hipify 128 1 0) >/dev/null; } 2>>$HIPIFY_OUTPUT_FILE
        mv output.txt output.single.hipify.txt


        # echo "[*] Workload 2: Parallelized 256 Workloads"

        # echo "[*] Running CuPBoP version..."
        # ./myocyte.cupbop 128 256 1
        # # mv output.txt output.multi.cupbop.txt

        # echo "[*] Running HIPIFY version..."
        # ./myocyte.hipify 128 256 1
        # # mv output.txt output.multi.hipify.txt

    else
        echo "[*] Running CuPBoP version..."
        time ./$BENCHMARK.cupbop 128 1 0
        mv output.txt output.single.cupbop.txt
        
        
        echo "[*] Running hipify version..."
        time ./$BENCHMARK.hipify 128 1 0
        mv output.txt output.single.hipify.txt

        # echo "[*] Workload 2: Parallelized 256 Workloads"

        # echo "[*] Running CuPBoP version..."
        # ./myocyte.cupbop 128 256 1
        # # mv output.txt output.multi.cupbop.txt

        # echo "[*] Running HIPIFY version..."
        # ./myocyte.hipify 128 256 1
        # # mv output.txt output.multi.hipify.txt

    fi
done

if [[ "$SAVE_OUTPUTS" -eq 0 ]]; then
    echo "[*] Cleaning up..."
    make clean
    rm -f output.single.cupbop.txt output.single.hipify.txt \
    output.multi.cupbop.txt output.multi.hipify.txt
fi
