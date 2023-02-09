#!/bin/bash

# install_pkg ninja-build
# install_pkg mesa-libGLU-devel

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BUILD_LLVM=0
# AMDCUDA_REPO_PATH=

# Locate amdcuda repo
if [[ ! -z "$AMDCUDA_REPO_PATH" ]]; then
    echo "[*] Using supplied AMDCUDA_REPO_PATH=${AMDCUDA_REPO_PATH}"
elif [[ -f "$SCRIPT_DIR/amdcuda" ]]; then
    AMDCUDA_REPO_PATH="$(realpath "$SCRIPT_DIR/..")"
elif [[ -d "$HOME/amdcuda" ]]; then
    AMDCUDA_REPO_PATH="$HOME/amdcuda"
fi

if [[ ! -z "$AMDCUDA_REPO_PATH" ]]; then
    echo "[*] CuPBoP-AMD is at $AMDCUDA_REPO_PATH"
else
    echo "[!] Don't know where AMDCUDA is. Patches to device libs won't be applied."
fi

mkdir -p "$HOME/prefix/opt"
pushd "$HOME/prefix/opt"
    SCRATCH_PATH="$HOME/scratch"
    [ -d "$SCRATCH_PATH" ] || mkdir -p "$SCRATCH_PATH"
    LOG_FILE="$SCRATCH_PATH/build-rocm.log"
    touch "$LOG_FILE"
    echo "[*] Log file is $LOG_FILE"

    export ROCM_PATH="$HOME/prefix/opt"
    export HIP_BRANCH=rocm-5.2.0
    export HIP_PLATFORM=amd

    # == build llvm
    if [[ "$BUILD_LLVM" = "1" ]]; then
        mkdir -p "$ROCM_PATH/llvm"
        echo "[*] Cloning LLVM in scratch..."
        pushd "$SCRATCH_PATH"
            rm -rf llvm-project
            git clone --recursive --depth=1 -b llvmorg-16-init https://github.com/llvm/llvm-project
            pushd llvm-project
                mkdir build
                pushd build
                    echo "[*] Building LLVM...logs are in $LOG_FILE"
                    cmake -G Ninja \
                        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
                        -DLLVM_ENABLE_PROJECTS="clang;lld;lldb;clang-tools-extra" \
                        -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind;libc" \
                        -DCMAKE_INSTALL_PREFIX="$ROCM_PATH/llvm" \
                        -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" \
                        ../llvm/ > "$LOG_FILE" 2>&1
                    ninja -j$(nproc) >> "$LOG_FILE" 2>&1
                    ninja install >> "$LOG_FILE" 2>&1
                    echo "[*] Done building LLVM! (logs are in $LOG_FILE)"
                popd
            popd
        popd

        if [[ ! "$(realpath "$(which clang 2>/dev/null || true)")" = "$(realpath "$ROCM_PATH/llvm/bin/clang" || true)" ]]; then
            export PATH="$ROCM_PATH/llvm/bin:$PATH"
        fi
    fi
    # == done llvm

    # == build rocm
    pushd "$SCRATCH_PATH"
        rm -rf HIP hipamd ROCclr ROCm-OpenCL-Runtime rocminfo ROCm-Device-Libs "$ROCM_PATH/HIP" "$ROCM_PATH/ROCclr" "$ROCM_PATH/ROCm-OpenCL-Runtime"
        ln -s "$ROCM_PATH/ROCm-OpenCL-Runtime" "ROCm-OpenCL-Runtime"

        git clone -b "$HIP_BRANCH" https://github.com/ROCm-Developer-Tools/HIP "$ROCM_PATH/HIP"
        ln -s "$ROCM_PATH/HIP" "HIP"

        git clone -b "$HIP_BRANCH" https://github.com/ROCm-Developer-Tools/ROCclr "$ROCM_PATH/ROCclr"
        ln -s "$ROCM_PATH/ROCclr" "ROCclr"

        git clone -b "$HIP_BRANCH" https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime "$ROCM_PATH/ROCm-OpenCL-Runtime"
        ln -s "$ROCM_PATH/ROCm-OpenCL-Runtime" "ROCm-OpenCL-Runtime"

        export HIPAMD_DIR="$(readlink -f hipamd)"
        export HIP_DIR="$(readlink -f HIP)"
        export ROCclr_DIR="$(readlink -f ROCclr)"
        export OPENCL_DIR="$(readlink -f ROCm-OpenCL-Runtime)"

        export CC="$(which clang)"
        export CXX="$(which clang++)"

        mkdir -p "$ROCM_PATH/hsa"
        cp -r /opt/rocm/include/hsa "$ROCM_PATH/hsa"
        export CPLUS_INCLUDE_PATH="$ROCM_PATH/hsa:$CPLUS_INCLUDE_PATH"

        # not building hsa. copy it from system
        mkdir -p $ROCM_PATH/lib
        mkdir -p $ROCM_PATH/bin
        rsync -aLK /opt/rocm/hsa/ $ROCM_PATH

        # build rocm_agent_enumerator
        echo "[*] Fetching rocminfo..."
        git clone https://github.com/RadeonOpenCompute/rocminfo.git
        pushd rocminfo
            git fetch --tags origin 
            mkdir -p build
            pushd build
                echo "[*] Building rocminfo"
                cmake -DCMAKE_PREFIX_PATH="$ROCM_PATH" .. # >> "$LOG_FILE" 2>&1
                make -j$(nproc) >> "$LOG_FILE" 2>&1
            popd
            
            rm -f "$ROCM_PATH/bin/rocm_agent_enumerator"
            cp rocm_agent_enumerator "$ROCM_PATH/bin/"
        popd

        # build hipamd
        echo "[*] Fetching hipamd..."
        git clone -b "$HIP_BRANCH" https://github.com/ROCm-Developer-Tools/hipamd
        pushd hipamd
            mkdir -p build
            pushd build
                echo "[*] Configuring hipamd...logs are in $LOG_FILE"
                cmake \
                    -DHIP_COMMON_DIR=$HIP_DIR \
                    -DAMD_OPENCL_PATH=$OPENCL_DIR \
                    -DROCCLR_PATH=$ROCclr_DIR \
                    -DROCM_PATH=$ROCM_PATH \
                    -DCMAKE_INSTALL_PREFIX="$ROCM_PATH" \
                    -DCMAKE_BUILD_TYPE="Debug" \
                    -DCMAKE_PREFIX_PATH="$ROCM_PATH;/opt/rocm-5.2.0" \
                    .. >> "$LOG_FILE" 2>&1
                    # -DCLANG_INSTALL_PREFIX="$HOME/prefix/opt/llvm" \
                echo "[*] Compiling hipamd..."
                make -j$(nproc) >> "$LOG_FILE" 2>&1
                echo "[*] Installing hipamd to $ROCM_PATH..."
                make install >> "$LOG_FILE" 2>&1
            popd
        popd

        # build rocm device libs
        echo "[*] Fetching device libs..."
        git clone https://github.com/RadeonOpenCompute/ROCm-Device-Libs.git -b "$HIP_BRANCH"
        pushd ROCm-Device-Libs
            # need to change this to where the amdcuda repo is
            git apply "$AMDCUDA_REPO_PATH/patches/enable-cuda2gcn.patch"
            mkdir -p build
            pushd build
                echo "[*] Configuring device libs...logs are in $LOG_FILE"
                cmake \
                    -DHIP_COMMON_DIR=$HIP_DIR \
                    -DAMD_OPENCL_PATH=$OPENCL_DIR \
                    -DROCCLR_PATH=$ROCclr_DIR \
                    -DROCM_PATH=$ROCM_PATH \
                    -DCMAKE_INSTALL_PREFIX="$ROCM_PATH" \
                    -DCMAKE_PREFIX_PATH="$ROCM_PATH" \
                    -DCMAKE_BUILD_TYPE="Release" \
                    -DCMAKE_FIND_DEBUG_MODE=TRUE \
                    .. >> "$LOG_FILE" 2>&1
                echo "[*] Compiling device libs..."
                make -j$(nproc) >> "$LOG_FILE" 2>&1
                echo "[*] Installing device libs to $ROCM_PATH..."
                make install >> "$LOG_FILE" 2>&1
                echo "[*] Done building device libs. Add the following code to your .bashrc to properly configure the device lib."
                echo
                echo "    export DEVICE_LIB_PATH=\"$ROCM_PATH/amdgcn/bitcode\""
                echo
            popd
        popd
    popd
    # == done rocm
# Finish
popd
