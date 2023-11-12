# CuPBoP-AMD: Extending CUDA to AMD Platforms

> Copyright © 2023
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at
>
> http://www.apache.org/licenses/LICENSE-2.0
>
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.

## Introduction

[CuPBoP-AMD (Extending CUDA to AMD Platforms)](https://doi.org/10.1145/3624062.3624185) is a extension of the framework of CuPBoP following similar architecture. However,  CuPBoP-AMD has its over version of kernerl and host translators and runtime implementation.
CuPBoP-AMD currently supports many of the Rodinia benchmarks and more support than AMD HIPIFY.

* [SC23-W - CuPBoP-AMD: Extending CUDA to AMD Platforms](https://doi.org/10.1145/3624062.3624185)
* https://doi.org/10.1145/3624062.3624185

## Install

### Prerequisites

- Linux system
- [LLVM 14.0.1](https://github.com/llvm/llvm-project/releases/tag/llvmorg-14.0.1)
- CUDA Toolkit

### Installation

1. Clone from github

   ```bash
   git clone --recursive git@github.com:gthparch/CuPBoP-AMD.git
   cd CuPBoP-AMD
   ```

2. Build LLVM using the `llvm-16-init` branch and the ROCm suites

   Edit the `build-rocm.sh` script under the `scripts/` folder, replace `BUILD_LLVM=0` with `BUILD_LLVM=1`.

   ```bash
   ./scripts/build-rocm.sh
   ```

   Ensure the compiled LLVM binaries are in the `PATH` variable.

3. Build CuPBoP-AMD

   ```bash
   mkdir build && cd build
   cmake .. \
      -DLLVM_CONFIG_PATH=`which llvm-config` \
      -DCUDA_PATH=$CUDA_PATH
   cmake --build . -j$(nproc)
   ```

4. Set the environment variables

   ```bash
   export ROCM_PATH="<path_to_rocm>"
   export HIP_PATH="$ROCM_PATH/hip"
   export DEVICE_LIB_PATH="$ROCM_PATH/amdgcn/bitcode"
   export HIP_DEVICE_LIB_PATH="$ROCM_PATH/amdgcn/bitcode"
   export HIP_CLANG_PATH="<path_to_compiled_llvm>"
   export HIPCC_COMPILE_FLAGS_APPEND="--rocm-path=$ROCM_PATH"
   export CMAKE_PREFIX_PATH="$ROCM_PATH/hip:$ROCM_PATH:$CMAKE_PREFIX_PATH"
   export ROCMINFO_PATH="$ROCM_PATH"
   export LD_LIBRARY_PATH="$ROCM_PATH/lib64:$ROCM_PATH/lib:$LD_LIBRARY_PATH"
   export PATH="<path_to_compiled_binaries>:$PATH"
   ```

## Run Rodinia Benchmark example

In this section, we provide an example of how to use CuPBoP-AMD to execute a CUDA program.

```bash
# Run rodinia benchmarks. Ensure all environment variables are set.
$ cd benchmarks/rodinia

# Download Rodinia benchmark dataset
# This script automatically downloads the dataset required to run the rodinia
# suite of benchmarks to the rodinia-data folder
$ ./download-data.sh

# Take the `bfs` benchmark for an example
$ cd bfs && ./run.sh
```

## How to contribute?

Any kinds of contributions are welcome.
Please refer to [Contribution.md](./CONTRIBUTING.md) for more detail.

## Related publications

If you want to refer CuPBoP in your projects, please cite the related
papers:

- [CuPBoP-AMD: Extending CUDA to AMD Platforms](https://doi.org/10.1145/3624062.3624185)
- [CuPBoP: CUDA for Parallelized and Broad-range Processors](https://arxiv.org/abs/2206.07896)

## Contributors

- [Xule Zhou](https://marcuszhou.com/)
- [Jun Chen](https://junchen.me)
- John Lu
- [Hyesoon Kim](https://faculty.cc.gatech.edu/~hyesoon/)

## Acknowledgements

- This research was partially supported by AMD. We also want to thank John Lu, Ruobing Han, and Jaewon Lee
for their support and expertise.
- [CuPBoP: CUDA for Parallelized and Broad-range Processors](https://arxiv.org/abs/2206.07896)
- [Rodinia Benchmark](https://github.com/yuhc/gpu-rodinia)
