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
