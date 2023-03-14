#include "rocm/ockl/ockl.h"
#include "dispatch.h"

/// AMDGCN doesn't seem to have an instruction that supports syncing warps with bitmasks.
/// So fencing the entire agent is the best we can do.
void cupbop_syncwarp(uint mask) {
    __builtin_amdgcn_fence(__ATOMIC_ACQ_REL, "agent");
}
