#pragma once

// Defined by ockl
extern size_t __ockl_get_local_id(uint) __attribute__((const));
#define cbThreadIdx_x (__ockl_get_local_id(0))
#define cbThreadIdx_y (__ockl_get_local_id(1))
#define cbThreadIdx_z (__ockl_get_local_id(2))

extern size_t __ockl_get_group_id(uint) __attribute__((const));
#define cbBlockIdx_x (__ockl_get_group_id(0))
#define cbBlockIdx_y (__ockl_get_group_id(1))
#define cbBlockIdx_z (__ockl_get_group_id(2))

extern size_t __ockl_get_local_size(uint) __attribute__((const));
#define cbBlockDim_x (__ockl_get_local_size(0))
#define cbBlockDim_y (__ockl_get_local_size(1))
#define cbBlockDim_z (__ockl_get_local_size(2))

extern size_t __ockl_get_num_groups(uint) __attribute__((const));
#define cbGridDim_x (__ockl_get_num_groups(0))
#define cbGridDim_y (__ockl_get_num_groups(1))
#define cbGridDim_z (__ockl_get_num_groups(2))

// Exported by CuPBoP
//
// Because AMD uses 64 wavefronts instead of CUDA's traditional 32, we split
// the mask returned by ockl into two 32-bit integers, one for the mask of the
// first 32 threads, and one for the second 32 threads. Depending on the
// current thread's index, we return either the first or second mask.
//
// The functions below dynamically returns thread masks and IDs based on the
// part of the wavefront that the current thread is. Any interpolations should
// use these functions instead of from AMD's device library.

uint cupbop_activemask();
uint cupbop_laneid() __attribute__((const));
uint cupbop_lanemask_lt() __attribute__((const));
