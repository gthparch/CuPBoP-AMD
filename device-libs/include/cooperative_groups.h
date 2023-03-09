#pragma once

#include "macros.h"

// Structures that are ABI compatible with CUDA cooperative groups

typedef struct {
    // unsigned int _unused : 1;
    // unsigned int type : 7, : 0;
    uchar type;
} group_data;

typedef struct {
    uint wsSize;
    uint barrier;
} grid_workspace;

typedef struct {
    grid_workspace *gridWs;
} gg_data;

typedef struct {
    // unsigned int is_tiled : 1;
    // unsigned int type : 7;
    // unsigned int size : 24;
    uint is_tiled_type_size;
    // packed to 4b
    // unsigned int metaGroupSize : 16;
    // unsigned int metaGroupRank : 16;
    uint metaGroupSize_metaGroupRank;
    // packed to 8b
    unsigned int mask;
    // packed to 12b
    unsigned int _res;
} tg_data;

typedef struct  {
    // unsigned long long _unused : 1;
    // unsigned long long type    : 7;
    // unsigned long long handle  : 56;
    ulong type_handle;
    // const details::multi_grid::multi_grid_functions *functions;
    void *functions;
} mg_data;

typedef union __attribute__((aligned(8))) {
    group_data group;
    tg_data coalesced;
    gg_data grid;
    mg_data multi_grid;
} thread_group;

ATTR void cupbop_cg_coalesced_group_sync();
ATTR void cupbop_syncwarp(uint mask);
ATTR uint cupbop_cg_thread_block_thread_rank();
