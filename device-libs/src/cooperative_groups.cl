#include "cooperative_groups.h"
#include "rocm/ockl/ockl.h"
#include "dispatch.h"

void cupbop_cg_coalesced_group_sync() {
    __builtin_amdgcn_fence(__ATOMIC_ACQ_REL, "agent");
}

/// AMDGCN doesn't seem to have an instruction that supports syncing warps with bitmasks.
/// So fencing the entire agent is the best we can do.
void cupbop_syncwarp(uint mask) {
    __builtin_amdgcn_fence(__ATOMIC_ACQ_REL, "agent");
}

/// cooperative_groups::__v1::thread_block::thread_rank()
uint cupbop_cg_thread_block_thread_rank() {
    return ((uint)((cbThreadIdx_z * cbBlockDim_y * cbBlockDim_x)
        + (cbThreadIdx_y * cbBlockDim_x) + (cbThreadIdx_x)));
}
