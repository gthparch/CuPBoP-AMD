#pragma once

#include "macros.h"

// Defined by ockl
ATTR size_t __ockl_get_local_id(uint);
#define cbThreadIdx_x (__ockl_get_local_id(0))
#define cbThreadIdx_y (__ockl_get_local_id(1))
#define cbThreadIdx_z (__ockl_get_local_id(2))

ATTR size_t __ockl_get_group_id(uint);
#define cbBlockIdx_x (__ockl_get_group_id(0))
#define cbBlockIdx_y (__ockl_get_group_id(1))
#define cbBlockIdx_z (__ockl_get_group_id(2))

ATTR size_t __ockl_get_local_size(uint);
#define cbBlockDim_x (__ockl_get_local_size(0))
#define cbBlockDim_y (__ockl_get_local_size(1))
#define cbBlockDim_z (__ockl_get_local_size(2))

ATTR size_t __ockl_get_num_groups(uint);
#define cbGridDim_x (__ockl_get_num_groups(0))
#define cbGridDim_y (__ockl_get_num_groups(1))
#define cbGridDim_z (__ockl_get_num_groups(2))
