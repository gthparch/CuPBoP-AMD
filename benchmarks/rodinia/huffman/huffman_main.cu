/*
 * PAVLE - Parallel Variable-Length Encoder for CUDA. Main file.
 *
 * Copyright (C) 2009 Ana Balevic <ana.balevic@gmail.com>
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the MIT License. Read the full licence:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * If you find this program useful, please contact me and reference PAVLE home
 * page in your work.
 *
 */

#include <cuda.h>
#include <sys/time.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>

#include "hipify_polyfill.h"
#include "comparison_helpers.h"
#include "cuda_helpers.h"
#include "load_data.h"
#include "print_helpers.h"
#include "stats_logger.h"
#include "stdafx.h"

// #include "vlc_kernel_gm32.cu"
// #include "vlc_kernel_sm32.cu"
#include "vlc_kernel_sm64huff.cuh"
// #include "vlc_kernel_dpt.cu"
// #include "vlc_kernel_dptt.cu"
// #include "scan_kernel.cu"
#include "cpuencode.h"
#include "pack_kernels.cuh"

// ========================================================
// #include "scan.cuh"

/*
 * Copyright 1993-2006 NVIDIA Corporation.  All rights reserved.
 *
 * NOTICE TO USER:
 *
 * This source code is subject to NVIDIA ownership rights under U.S. and
 * international Copyright laws.
 *
 * NVIDIA MAKES NO REPRESENTATION ABOUT THE SUITABILITY OF THIS SOURCE
 * CODE FOR ANY PURPOSE.  IT IS PROVIDED "AS IS" WITHOUT EXPRESS OR
 * IMPLIED WARRANTY OF ANY KIND.  NVIDIA DISCLAIMS ALL WARRANTIES WITH
 * REGARD TO THIS SOURCE CODE, INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE.
 * IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL,
 * OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
 * OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
 * OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE
 * OR PERFORMANCE OF THIS SOURCE CODE.
 *
 * U.S. Government End Users.  This source code is a "commercial item" as
 * that term is defined at 48 C.F.R. 2.101 (OCT 1995), consisting  of
 * "commercial computer software" and "commercial computer software
 * documentation" as such terms are used in 48 C.F.R. 12.212 (SEPT 1995)
 * and is provided to the U.S. Government only as a commercial end item.
 * Consistent with 48 C.F.R.12.212 and 48 C.F.R. 227.7202-1 through
 * 227.7202-4 (JUNE 1995), all U.S. Government End Users acquire the
 * source code with only those rights set forth herein.
 */

#ifndef _PRESCAN_CU_
#define _PRESCAN_CU_

// includes, kernels
#include <cuda.h>
#include <assert.h>
#include <stdio.h>
#include <math.h>

// ========================================================
// #include "cutil.h"
////////////////////////////////////////////////////////////////////////////
//! Macros

#if CUDART_VERSION >= 4000
#define CUT_DEVICE_SYNCHRONIZE() cudaDeviceSynchronize();
#else
#define CUT_DEVICE_SYNCHRONIZE() cudaThreadSynchronize();
#endif

#if CUDART_VERSION >= 4000
#define CUT_DEVICE_RESET() cudaDeviceReset();
#else
#define CUT_DEVICE_RESET() cudaThreadExit();
#endif

// This is for the CUTIL bank checker
#ifdef _DEBUG
#if __DEVICE_EMULATION__
// Interface for bank conflict checker
#define CUT_BANK_CHECKER(array, index)                                         \
    (cutCheckBankAccess(threadIdx.x, threadIdx.y, threadIdx.z, blockDim.x,     \
                        blockDim.y, blockDim.z, __FILE__, __LINE__, #array,    \
                        index),                                                \
     array[index])
#else
#define CUT_BANK_CHECKER(array, index) array[index]
#endif
#else
#define CUT_BANK_CHECKER(array, index) array[index]
#endif

#define CU_SAFE_CALL_NO_SYNC(call)                                             \
    {                                                                          \
        CUresult err = call;                                                   \
        if (CUDA_SUCCESS != err) {                                             \
            fprintf(stderr, "Cuda driver error %x in file '%s' in line %i.\n", \
                    err, __FILE__, __LINE__);                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

#define CU_SAFE_CALL(call) CU_SAFE_CALL_NO_SYNC(call);

#define CU_SAFE_CTX_SYNC()                                                     \
    {                                                                          \
        CUresult err = cuCtxSynchronize();                                     \
        if (CUDA_SUCCESS != err) {                                             \
            fprintf(stderr, "Cuda driver error %x in file '%s' in line %i.\n", \
                    err, __FILE__, __LINE__);                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

#define CUDA_SAFE_CALL_NO_SYNC(call)                                           \
    {                                                                          \
        cudaError err = call;                                                  \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error in file '%s' in line %i : %s.\n",      \
                    __FILE__, __LINE__, cudaGetErrorString(err));              \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

#define CUDA_SAFE_CALL(call) CUDA_SAFE_CALL_NO_SYNC(call);

#define CUDA_SAFE_THREAD_SYNC()                                                \
    {                                                                          \
        cudaError err = CUT_DEVICE_SYNCHRONIZE();                              \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error in file '%s' in line %i : %s.\n",      \
                    __FILE__, __LINE__, cudaGetErrorString(err));              \
        }                                                                      \
    }

#define CUFFT_SAFE_CALL(call)                                                  \
    {                                                                          \
        cufftResult err = call;                                                \
        if (CUFFT_SUCCESS != err) {                                            \
            fprintf(stderr, "CUFFT error in file '%s' in line %i.\n",          \
                    __FILE__, __LINE__);                                       \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

#define CUT_SAFE_CALL(call)                                                    \
    if (CUTTrue != call) {                                                     \
        fprintf(stderr, "Cut error in file '%s' in line %i.\n", __FILE__,      \
                __LINE__);                                                     \
        exit(EXIT_FAILURE);                                                    \
    }

//! Check for CUDA error
#ifdef _DEBUG
#define CUT_CHECK_ERROR(errorMessage)                                          \
    {                                                                          \
        cudaError_t err = cudaGetLastError();                                  \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
        err = CUT_DEVICE_SYNCHRONIZE();                                        \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }
#else
#define CUT_CHECK_ERROR(errorMessage)                                          \
    {                                                                          \
        cudaError_t err = cudaGetLastError();                                  \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }
#endif

//! Check for malloc error
#define CUT_SAFE_MALLOC(mallocCall)                                            \
    {                                                                          \
        if (!(mallocCall)) {                                                   \
            fprintf(stderr, "Host malloc failure in file '%s' in line %i\n",   \
                    __FILE__, __LINE__);                                       \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }                                                                          \
    while (0)                                                                  \
        ;

//! Check if conditon is true (flexible assert)
#define CUT_CONDITION(val)                                                     \
    if (CUTFalse == cutCheckCondition(val, __FILE__, __LINE__)) {              \
        exit(EXIT_FAILURE);                                                    \
    }

#if __DEVICE_EMULATION__

#define CUT_DEVICE_INIT(ARGC, ARGV)

#else

#define CUT_DEVICE_INIT(ARGC, ARGV)                                            \
    {                                                                          \
        int deviceCount;                                                       \
        CUDA_SAFE_CALL_NO_SYNC(cudaGetDeviceCount(&deviceCount));              \
        if (deviceCount == 0) {                                                \
            fprintf(stderr, "cutil error: no devices supporting CUDA.\n");     \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
        int dev = 0;                                                           \
        cutGetCmdLineArgumenti(ARGC, (const char **)ARGV, "device", &dev);     \
        if (dev < 0)                                                           \
            dev = 0;                                                           \
        if (dev > deviceCount - 1)                                             \
            dev = deviceCount - 1;                                             \
        cudaDeviceProp deviceProp;                                             \
        CUDA_SAFE_CALL_NO_SYNC(cudaGetDeviceProperties(&deviceProp, dev));     \
        if (cutCheckCmdLineFlag(ARGC, (const char **)ARGV, "quiet") ==         \
            CUTFalse)                                                          \
            fprintf(stderr, "Using device %d: %s\n", dev, deviceProp.name);    \
        CUDA_SAFE_CALL(cudaSetDevice(dev));                                    \
    }

//! Check for CUDA context lost
#define CUDA_CHECK_CTX_LOST(errorMessage)                                      \
    {                                                                          \
        cudaError_t err = cudaGetLastError();                                  \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
        err = CUT_DEVICE_SYNCHRONIZE();                                        \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

//! Check for CUDA context lost
#define CU_CHECK_CTX_LOST(errorMessage)                                        \
    {                                                                          \
        cudaError_t err = cudaGetLastError();                                  \
        if (CUDA_ERROR_INVALID_CONTEXT != err) {                               \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
        err = CUT_DEVICE_SYNCHRONIZE();                                        \
        if (cudaSuccess != err) {                                              \
            fprintf(stderr, "Cuda error: %s in file '%s' in line %i : %s.\n",  \
                    errorMessage, __FILE__, __LINE__,                          \
                    cudaGetErrorString(err));                                  \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
    }

#endif

#define CUT_DEVICE_INIT_DRV(cuDevice, ARGC, ARGV)                              \
    {                                                                          \
        cuDevice = 0;                                                          \
        int deviceCount = 0;                                                   \
        CUresult err = cuInit(0);                                              \
        if (CUDA_SUCCESS == err)                                               \
            CU_SAFE_CALL_NO_SYNC(cuDeviceGetCount(&deviceCount));              \
        if (deviceCount == 0) {                                                \
            fprintf(stderr, "cutil error: no devices supporting CUDA\n");      \
            exit(EXIT_FAILURE);                                                \
        }                                                                      \
        int dev = 0;                                                           \
        cutGetCmdLineArgumenti(ARGC, (const char **)ARGV, "device", &dev);     \
        if (dev < 0)                                                           \
            dev = 0;                                                           \
        if (dev > deviceCount - 1)                                             \
            dev = deviceCount - 1;                                             \
        CU_SAFE_CALL_NO_SYNC(cuDeviceGet(&cuDevice, dev));                     \
        char name[100];                                                        \
        cuDeviceGetName(name, 100, cuDevice);                                  \
        if (cutCheckCmdLineFlag(ARGC, (const char **)ARGV, "quiet") ==         \
            CUTFalse)                                                          \
            fprintf(stderr, "Using device %d: %s\n", dev, name);               \
    }

#define CUT_EXIT(argc, argv)                                                   \
    if (!cutCheckCmdLineFlag(argc, (const char **)argv, "noprompt")) {         \
        printf("\nPress ENTER to exit...\n");                                  \
        fflush(stdout);                                                        \
        fflush(stderr);                                                        \
        getchar();                                                             \
    }                                                                          \
    exit(EXIT_SUCCESS);
// ========================================================

#include "scanLargeArray_kernel.cuh"

inline bool isPowerOfTwo(int n) { return ((n & (n - 1)) == 0); }

inline int floorPow2(int n) {
#ifdef WIN32
    // method 2
    return 1 << (int)logb((float)n);
#else
    // method 1
    // float nf = (float)n;
    // return 1 << (((*(int*)&nf) >> 23) - 127);
    int exp;
    frexp((float)n, &exp);
    return 1 << (exp - 1);
#endif
}

#define BLOCK_SIZE 256

static unsigned int **g_scanBlockSums;
static unsigned int g_numEltsAllocated = 0;
static unsigned int g_numLevelsAllocated = 0;

static void preallocBlockSums(unsigned int maxNumElements) {
    assert(g_numEltsAllocated == 0); // shouldn't be called

    g_numEltsAllocated = maxNumElements;

    unsigned int blockSize = BLOCK_SIZE; // max size of the thread blocks
    unsigned int numElts = maxNumElements;
    int level = 0;

    do {
        unsigned int numBlocks =
            std::max(1, (int)std::ceil((float)numElts / (2.f * blockSize)));
        if (numBlocks > 1)
            level++;
        numElts = numBlocks;
    } while (numElts > 1);

    g_scanBlockSums = (unsigned int **)malloc(level * sizeof(unsigned int *));
    g_numLevelsAllocated = level;
    numElts = maxNumElements;
    level = 0;

    do {
        unsigned int numBlocks =
            std::max(1, (int)std::ceil((float)numElts / (2.f * blockSize)));
        if (numBlocks > 1)
            CUDA_SAFE_CALL(cudaMalloc((void **)&g_scanBlockSums[level++],
                                      numBlocks * sizeof(unsigned int)));
        numElts = numBlocks;
    } while (numElts > 1);

    CUT_CHECK_ERROR("preallocBlockSums");
}

static void deallocBlockSums() {
    for (unsigned int i = 0; i < g_numLevelsAllocated; i++) {
        cudaFree(g_scanBlockSums[i]);
    }

    CUT_CHECK_ERROR("deallocBlockSums");

    free((void **)g_scanBlockSums);

    g_scanBlockSums = 0;
    g_numEltsAllocated = 0;
    g_numLevelsAllocated = 0;
}

static void prescanArrayRecursive(unsigned int *outArray,
                                  const unsigned int *inArray, int numElements,
                                  int level) {
    unsigned int blockSize = BLOCK_SIZE; // max size of the thread blocks
    unsigned int numBlocks =
        std::max(1, (int)std::ceil((float)numElements / (2.f * blockSize)));
    unsigned int numThreads;

    if (numBlocks > 1)
        numThreads = blockSize;
    else if (isPowerOfTwo(numElements))
        numThreads = numElements / 2;
    else
        numThreads = floorPow2(numElements);

    unsigned int numEltsPerBlock = numThreads * 2;

    // if this is a non-power-of-2 array, the last block will be non-full
    // compute the smallest power of 2 able to compute its scan.
    unsigned int numEltsLastBlock =
        numElements - (numBlocks - 1) * numEltsPerBlock;
    unsigned int numThreadsLastBlock = std::max(1, (int) (numEltsLastBlock / 2));
    unsigned int np2LastBlock = 0;
    unsigned int sharedMemLastBlock = 0;

    if (numEltsLastBlock != numEltsPerBlock) {
        np2LastBlock = 1;

        if (!isPowerOfTwo(numEltsLastBlock))
            numThreadsLastBlock = floorPow2(numEltsLastBlock);

        unsigned int extraSpace = (2 * numThreadsLastBlock) / NUM_BANKS;
        sharedMemLastBlock =
            sizeof(unsigned int) * (2 * numThreadsLastBlock + extraSpace);
    }

    // padding space is used to avoid shared memory bank conflicts
    unsigned int extraSpace = numEltsPerBlock / NUM_BANKS;
    unsigned int sharedMemSize =
        sizeof(unsigned int) * (numEltsPerBlock + extraSpace);

#ifdef DEBUG
    if (numBlocks > 1) {
        assert(g_numEltsAllocated >= numElements);
    }
#endif

    // setup execution parameters
    // if NP2, we process the last block separately
    dim3 grid(std::max((int) 1, (int) (numBlocks - np2LastBlock)), 1, 1);
    dim3 threads(numThreads, 1, 1);

    // make sure there are no CUDA errors before we start
    CUT_CHECK_ERROR("prescanArrayRecursive before kernels");

    // execute the scan
    if (numBlocks > 1) {
        prescan<true, false><<<grid, threads, sharedMemSize>>>(
            outArray, inArray, g_scanBlockSums[level], numThreads * 2, 0, 0);
        CUT_CHECK_ERROR("prescanWithBlockSums");
        if (np2LastBlock) {
            prescan<true, true><<<1, numThreadsLastBlock, sharedMemLastBlock>>>(
                outArray, inArray, g_scanBlockSums[level], numEltsLastBlock,
                numBlocks - 1, numElements - numEltsLastBlock);
            CUT_CHECK_ERROR("prescanNP2WithBlockSums");
        }

        // After scanning all the sub-blocks, we are mostly done.  But now we
        // need to take all of the last values of the sub-blocks and scan those.
        // This will give us a new value that must be sdded to each block to
        // get the final results.
        // recursive (CPU) call
        prescanArrayRecursive(g_scanBlockSums[level], g_scanBlockSums[level],
                              numBlocks, level + 1);

        uniformAdd<<<grid, threads>>>(outArray, g_scanBlockSums[level],
                                      numElements - numEltsLastBlock, 0, 0);
        CUT_CHECK_ERROR("uniformAdd");
        if (np2LastBlock) {
            uniformAdd<<<1, numThreadsLastBlock>>>(
                outArray, g_scanBlockSums[level], numEltsLastBlock,
                numBlocks - 1, numElements - numEltsLastBlock);
            CUT_CHECK_ERROR("uniformAdd");
        }
    } else if (isPowerOfTwo(numElements)) {
        prescan<false, false><<<grid, threads, sharedMemSize>>>(
            outArray, inArray, 0, numThreads * 2, 0, 0);
        CUT_CHECK_ERROR("prescan");
    } else {
        prescan<false, true><<<grid, threads, sharedMemSize>>>(
            outArray, inArray, 0, numElements, 0, 0);
        CUT_CHECK_ERROR("prescanNP2");
    }
}

static void prescanArray(unsigned int *outArray, unsigned int *inArray,
                         int numElements) {
    prescanArrayRecursive(outArray, inArray, numElements, 0);
}

#endif // _PRESCAN_CU_
// ========================================================

long long get_time() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (tv.tv_sec * 1000000) + tv.tv_usec;
}
void runVLCTest(char *file_name, uint num_block_threads, uint num_blocks = 1);

extern "C" void cpu_vlc_encode(unsigned int *indata, unsigned int num_elements,
                               unsigned int *outdata, unsigned int *outsize,
                               unsigned int *codewords,
                               unsigned int *codewordlens);

int main(int argc, char *argv[]) {
    if (!InitCUDA()) {
        return 0;
    }
    unsigned int num_block_threads = 256;
    if (argc > 1)
        for (int i = 1; i < argc; i++)
            runVLCTest(argv[i], num_block_threads);
    else {
        runVLCTest(NULL, num_block_threads, 1024);
    }
    CUDA_SAFE_CALL(cudaThreadExit());
    return 0;
}

void runVLCTest(char *file_name, uint num_block_threads, uint num_blocks) {
    printf("CUDA! Starting VLC Tests!\n");
    unsigned int
        num_elements; // uint num_elements = num_blocks * num_block_threads;
    unsigned int mem_size; // uint mem_size = num_elements * sizeof(int);
    unsigned int symbol_type_size = sizeof(int);
    //////// LOAD DATA ///////////////
    double H; // entropy
    initParams(file_name, num_block_threads, num_blocks, num_elements, mem_size,
               symbol_type_size);
    printf("Parameters: num_elements: %d, num_blocks: %d, num_block_threads: "
           "%d\n----------------------------\n",
           num_elements, num_blocks, num_block_threads);
    ////////LOAD DATA ///////////////
    uint *sourceData = (uint *)malloc(mem_size);
    uint *destData = (uint *)malloc(mem_size);
    uint *crefData = (uint *)malloc(mem_size);

    uint *codewords = (uint *)malloc(NUM_SYMBOLS * symbol_type_size);
    uint *codewordlens = (uint *)malloc(NUM_SYMBOLS * symbol_type_size);

    uint *cw32 = (uint *)malloc(mem_size);
    uint *cw32len = (uint *)malloc(mem_size);
    uint *cw32idx = (uint *)malloc(mem_size);

    uint *cindex2 = (uint *)malloc(num_blocks * sizeof(int));

    memset(sourceData, 0, mem_size);
    memset(destData, 0, mem_size);
    memset(crefData, 0, mem_size);
    memset(cw32, 0, mem_size);
    memset(cw32len, 0, mem_size);
    memset(cw32idx, 0, mem_size);
    memset(codewords, 0, NUM_SYMBOLS * symbol_type_size);
    memset(codewordlens, 0, NUM_SYMBOLS * symbol_type_size);
    memset(cindex2, 0, num_blocks * sizeof(int));
    //////// LOAD DATA ///////////////
    loadData(file_name, sourceData, codewords, codewordlens, num_elements,
             mem_size, H);

    //////// LOAD DATA ///////////////

    unsigned int *d_sourceData, *d_destData, *d_destDataPacked;
    unsigned int *d_codewords, *d_codewordlens;
    unsigned int *d_cw32, *d_cw32len, *d_cw32idx, *d_cindex, *d_cindex2;

    CUDA_SAFE_CALL(cudaMalloc((void **)&d_sourceData, mem_size));
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_destData, mem_size));
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_destDataPacked, mem_size));

    CUDA_SAFE_CALL(
        cudaMalloc((void **)&d_codewords, NUM_SYMBOLS * symbol_type_size));
    CUDA_SAFE_CALL(
        cudaMalloc((void **)&d_codewordlens, NUM_SYMBOLS * symbol_type_size));

    CUDA_SAFE_CALL(cudaMalloc((void **)&d_cw32, mem_size));
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_cw32len, mem_size));
    CUDA_SAFE_CALL(cudaMalloc((void **)&d_cw32idx, mem_size));

    CUDA_SAFE_CALL(
        cudaMalloc((void **)&d_cindex, num_blocks * sizeof(unsigned int)));
    CUDA_SAFE_CALL(
        cudaMalloc((void **)&d_cindex2, num_blocks * sizeof(unsigned int)));

    CUDA_SAFE_CALL(
        cudaMemcpy(d_sourceData, sourceData, mem_size, cudaMemcpyHostToDevice));
    CUDA_SAFE_CALL(cudaMemcpy(d_codewords, codewords,
                              NUM_SYMBOLS * symbol_type_size,
                              cudaMemcpyHostToDevice));
    CUDA_SAFE_CALL(cudaMemcpy(d_codewordlens, codewordlens,
                              NUM_SYMBOLS * symbol_type_size,
                              cudaMemcpyHostToDevice));
    CUDA_SAFE_CALL(
        cudaMemcpy(d_destData, destData, mem_size, cudaMemcpyHostToDevice));

    dim3 grid_size(num_blocks, 1, 1);
    dim3 block_size(num_block_threads, 1, 1);
    unsigned int sm_size;

    unsigned int NT = 10; // number of runs for each execution time

    //////////////////* CPU ENCODER *///////////////////////////////////
    unsigned int refbytesize;
    long long timer = get_time();
    cpu_vlc_encode((unsigned int *)sourceData, num_elements,
                   (unsigned int *)crefData, &refbytesize, codewords,
                   codewordlens);
    float msec = (float)((get_time() - timer) / 1000.0);
    printf("CPU Encoding time (CPU): %f (ms)\n", msec);
    printf("CPU Encoded to %d [B]\n", refbytesize);
    unsigned int num_ints = refbytesize / 4 + ((refbytesize % 4 == 0) ? 0 : 1);
    //////////////////* END CPU *///////////////////////////////////

    //////////////////* SM64HUFF KERNEL *///////////////////////////////////
    grid_size.x = num_blocks;
    block_size.x = num_block_threads;
    sm_size = block_size.x * sizeof(unsigned int);
#ifdef CACHECWLUT
    sm_size =
        2 * NUM_SYMBOLS * sizeof(int) + block_size.x * sizeof(unsigned int);
#endif
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start, 0);
    for (int i = 0; i < NT; i++) {
        vlc_encode_kernel_sm64huff<<<grid_size, block_size, sm_size>>>(
            d_sourceData, d_codewords, d_codewordlens,
#ifdef TESTING
            d_cw32, d_cw32len, d_cw32idx,
#endif
            d_destData, d_cindex); // testedOK2
    }
    cudaThreadSynchronize();
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    float elapsedTime;
    cudaEventElapsedTime(&elapsedTime, start, stop);

    CUT_CHECK_ERROR("Kernel execution failed\n");
    printf("GPU Encoding time (SM64HUFF): %f (ms)\n", elapsedTime / NT);
    //////////////////* END KERNEL *///////////////////////////////////

#ifdef TESTING
    unsigned int num_scan_elements = grid_size.x;
    preallocBlockSums(num_scan_elements);
    cudaMemset(d_destDataPacked, 0, mem_size);
    printf("Num_blocks to be passed to scan is %d.\n", num_scan_elements);
    prescanArray(d_cindex2, d_cindex, num_scan_elements);

    pack2<<<num_scan_elements / 16, 16>>>(
        (unsigned int *)d_destData, d_cindex, d_cindex2,
        (unsigned int *)d_destDataPacked, num_elements / num_scan_elements);
    CUT_CHECK_ERROR("Pack2 Kernel execution failed\n");
    deallocBlockSums();

    CUDA_SAFE_CALL(cudaMemcpy(destData, d_destDataPacked, mem_size,
                              cudaMemcpyDeviceToHost));
    compare_vectors((unsigned int *)crefData, (unsigned int *)destData,
                    num_ints);
#endif

    free(sourceData);
    free(destData);
    free(codewords);
    free(codewordlens);
    free(cw32);
    free(cw32len);
    free(crefData);
    CUDA_SAFE_CALL(cudaFree(d_sourceData));
    CUDA_SAFE_CALL(cudaFree(d_destData));
    CUDA_SAFE_CALL(cudaFree(d_destDataPacked));
    CUDA_SAFE_CALL(cudaFree(d_codewords));
    CUDA_SAFE_CALL(cudaFree(d_codewordlens));
    CUDA_SAFE_CALL(cudaFree(d_cw32));
    CUDA_SAFE_CALL(cudaFree(d_cw32len));
    CUDA_SAFE_CALL(cudaFree(d_cw32idx));
    CUDA_SAFE_CALL(cudaFree(d_cindex));
    CUDA_SAFE_CALL(cudaFree(d_cindex2));
    free(cindex2);
}
