#include "cupbop_cooperative_groups.h"
#include "dispatch.h"
#include "rocm/ockl/ockl.h"
#include "rocm/oclc.h"

void cupbop_cg_coalesced_group_sync() {
    __builtin_amdgcn_fence(__ATOMIC_ACQ_REL, "agent");
}

/// cooperative_groups::__v1::thread_block::thread_rank()
uint cupbop_cg_thread_block_thread_rank() {
    return ((uint)((cbThreadIdx_z * cbBlockDim_y * cbBlockDim_x) +
                   (cbThreadIdx_y * cbBlockDim_x) + (cbThreadIdx_x)));
}

/// cooperative_groups::__v1::grid_group::thread_rank() const
uint cupbop_cg_grid_group_thread_rank() {
    // Compute global id of the workgroup to which the current thread belongs to
    uint blkIdx = (uint)((cbBlockIdx_z * cbGridDim_y * cbGridDim_x) +
                         (cbBlockIdx_y * cbGridDim_x) + (cbBlockIdx_x));

    // Compute total number of threads being passed to reach current workgroup
    // within grid
    uint num_threads_till_current_workgroup =
        (uint)(blkIdx * (cbBlockDim_x * cbBlockDim_y * cbBlockDim_z));

    // Compute thread local rank within current workgroup
    uint local_thread_rank =
        (uint)((cbThreadIdx_z * cbBlockDim_y * cbBlockDim_x) +
               (cbThreadIdx_y * cbBlockDim_x) + (cbThreadIdx_x));

    return (num_threads_till_current_workgroup + local_thread_rank);
}

static inline size_t get_mg_info_arg(void) {
    if (__oclc_ABI_version < 500) {
        return ((__constant size_t *)__builtin_amdgcn_implicitarg_ptr())[6];
    } else {
        return ((__constant size_t *)__builtin_amdgcn_implicitarg_ptr())[11];
    }
}

/// cooperative_groups::__v1::grid_group::sync() const
void cupbop_cg_grid_group_sync(/* thread_group *ignored */) {
    __ockl_grid_sync();
    // __builtin_amdgcn_fence(__ATOMIC_SEQ_CST, "agent");
    // __builtin_amdgcn_s_barrier();
    // if (choose_one_workgroup_workitem()) {
    //     // if (AVOID_GWS()) {
    //     //     __global struct mg_info *mi =
    //     //         (__global struct mg_info *)get_mg_info_arg();
    //     //     single_grid_sync(&mi->sgs, mi->num_wg);
    //     // } else {
    //         uint nwm1 = (uint)__ockl_get_num_groups(0) *
    //                         (uint)__ockl_get_num_groups(1) *
    //                         (uint)__ockl_get_num_groups(2) -
    //                     1;
    //         __ockl_gws_barrier(nwm1, 0);
    //     // }
    // }
    // __builtin_amdgcn_s_barrier();
}

/// cooperative_groups::__v1::grid_group::size() const
uint cupbop_cg_grid_group_size() {
    return ((cbBlockDim_z * cbGridDim_z) * (cbBlockDim_y * cbGridDim_y) *
            (cbBlockDim_x * cbGridDim_x));
}

/// cooperative_groups::__v1::grid_group::is_valid() const
uint cupbop_cg_grid_group_is_valid() {
    return __ockl_grid_is_valid();
}
