// Copyright © 2023
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#pragma once

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

// Implicit arguments from kernel launch
struct mg_sync {
    uint w0;
    uint w1;
};

struct mg_info {
    __global struct mg_sync *mgs;
    uint grid_id;
    uint num_grids;
    ulong prev_sum;
    ulong all_sum;

    struct mg_sync sgs;
    uint num_wg;
};

void cupbop_cg_coalesced_group_sync();
void cupbop_syncwarp(uint mask);
uint cupbop_cg_thread_block_thread_rank() __attribute__((const));
uint cupbop_cg_grid_group_thread_rank() __attribute__((const));
void cupbop_cg_grid_group_sync();
uint cupbop_cg_grid_group_size() __attribute__((const));

// CG-related functions declared but not exposed by OCKL
extern void __ockl_gws_init(uint nwm1, uint rid);
extern void __ockl_gws_barrier(uint nwm1, uint rid);
extern void __ockl_grid_sync();
extern uint __ockl_lane_u32() __attribute__((const));
extern int __ockl_grid_is_valid(void) __attribute__((const));
extern void __ockl_grid_sync(void);
extern uint __ockl_multi_grid_num_grids() __attribute__((const));
extern uint __ockl_multi_grid_grid_rank() __attribute__((const));
extern uint __ockl_multi_grid_size() __attribute__((const));
extern uint __ockl_multi_grid_thread_rank() __attribute__((const));
extern int __ockl_multi_grid_is_valid() __attribute__((const));
extern void __ockl_multi_grid_sync();
