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

#include "dispatch.h"

/// Return whether the current lane is part of the high 32 threads in a
/// (possibly) 64-thread-wide wavefront.
static inline bool __cupbop_is_high_lane() {
    return __builtin_amdgcn_mbcnt_lo(~0u, 0u) == 32;
}

/// Returns the lane ID of the current thread within the current
/// (possibly half of the) wavefront.
uint cupbop_laneid() {
    uint laneid = __builtin_amdgcn_mbcnt_lo(~0u, 0u);

    // Lower bitmask accumulates to 32, meaning all 32 bits were set.
    // So we must be running with wavefront 64.
    if (laneid == 32u)
        laneid = __builtin_amdgcn_mbcnt_hi(~0u, 0u);

    return laneid;
}

/// Equivalent to calling the __lanemask_lt() function. Returns the mask
/// of all lanes with a lower lane ID than the current lane.
uint cupbop_lanemask_lt() {
    return (1u << cupbop_laneid()) - 1u;
}

/// Returns the active lane mask for the current part of the wavefront.
uint cupbop_activemask() {
    if (__cupbop_is_high_lane()) {
        return __builtin_amdgcn_read_exec_hi();
    } else {
        return __builtin_amdgcn_read_exec_lo();
    }
}
