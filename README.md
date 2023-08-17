# amdcuda



# Run Benchmarks Example


# Run Samples Example


# Build

```
mkdir build
cd build
cmake -DLLVM-CONFIG='which llvm-config' ..

```

You can just export PATH from the default ROCm on CRNCH or build from source.

# Paths necessary depends on builds

```
export PATH=$HOME/conda/bin:$PATH

export PYTHONPATH=$HOME/conda/lib/python3.9/site-packages:$PYTHONPATH

export ROCM_PATH=$HOME/opt

export PATH=$HOME/opt/llvm/bin:$HOME/opt/bin:$PATH

export CPLUS_INCLUDE_PATH=$HOME/prefix/usr/include

export CPLUS_INCLUDE_PATH=$ROCM_PATH/hsa/:$CPLUS_INCLUDE_PATH

export DEVICE_LIB_PATH=~/ROCm-Device-Libs/install/amdgcn/bitcode/

export HIP_PATH=$HOME/opt/hip

export CPATH=~/cuda-11.5/targets/x86_64-linux/include:$CPATH

```


# Runtime Build Path if building from source
```
Adding Python Stuff and using pip install
 
export PATH=$HOME/conda/bin:$PATH
export PYTHONPATH=$HOME/conda/lib/python3.9/site-packages:$PYTHONPATH
```

```
Final paths: 
export ROCM_PATH=$HOME/opt
export PATH=$HOME/opt/llvm/bin:$HOME/opt/bin:$PATH
export CPLUS_INCLUDE_PATH=$HOME/prefix/usr/include
export CPLUS_INCLUDE_PATH=$ROCM_PATH/hsa/:$CPLUS_INCLUDE_PATH
export DEVICE_LIB_PATH=~/ROCm-Device-Libs/install/amdgcn/bitcode/
export HIP_PATH=$HOME/opt/hip
```

HIP_PATH is from hipamd build install which generates the hip folder in the install folder.  DEVICE_LIB_PATH is from the ROCm-Device-Libs install folder from the build. $ROCM_PATH/hsa/ is copied from the root ROCm build in CRNCH which is /opt/rocm-5.2.0/hsa . $HOME/opt/llvm/bin is LLVM bin folder copied over from LLVM install bin folder after build. $HOME/opt/bin

$HOME/opt/bin executables is same as /opt/bin but some of the executables are build from source. Those that are not build from source are just copied over from /opt/rocm-5.2.0/bin

$HOME/opt/bin executables: 
```
hipcc                      hipcc.pl   hipconfig.pl    hip_embed_pch.sh  rocm_agent_enumerator      roc-obj    roc-obj-ls
hipcc_cmake_linker_helper  hipconfig  hipdemangleatp  hipvars.pm        rocminfo                   roc-obj-extract  rocprof
```

For runtime amdcuda build
```
export LD_LIBRARY_PATH=$HOME/coding/amdcuda/build/runtime:$LD_LIBRARY_PATH

```

## CRNCH

https://gt-crnch-rg.readthedocs.io/en/main/gpu/instinct-mi210.html

## Build from Source

HIP version 5.2.x has bugs in the hipcc so update to latest version for hipcc perl and bash scripts.
 
Get Python CppHeaderParser and argparse
 
```
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > Miniconda.sh 
bash Miniconda.sh -b -p ~/conda
 
export PATH=$HOME/conda/bin:$PATH
export PYTHONPATH=$HOME/conda/lib/python3.9/site-packages:$PYTHONPATH
 
pip install argparse
pip install CppHeaderParser

```
 

Create one folder for all the builds to be move into and called it ROCM_PATH. This folder will mimic the default /opt/rocm-5.2.0 folder.
```
mkdir $HOME/opt
export ROCM_PATH=$HOME/opt
```

Export the HIP_BRANCH or HIP version for all the builds, it can be rocm-x.y.z depending on the rocm version.

Export the HIP_PLATFORM to amd for the amd version.
```
export HIP_BRANCH=rocm-5.2.x
export HIP_PLATFORM=amd 
```
 
Get Ninja from Github binary Source which can be found by googling.


We are using Using LLVM 16 and rocm 5.2.x right now can be change to any version depending on HIP.
We Build LLVM from source.

We make the install path of llvm inside the $ROCM_PATH.
``` 
mkdir $ROCM_PATH/llvm 
``` 

We now clone the LLVM, build, and install.
```
git clone https://github.com/llvm/llvm-project
cd llvm-project
mkdir build
cd build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind" -DCMAKE_INSTALL_PREFIX=$ROCM_PATH/llvm -DLLVM_TARGETS_TO_BUILD="X86;NVPTX;AMDGPU" ../llvm/
 
ninja -j$(nproc)
ninja install
```

Export the LLVM bin
```
export PATH=$ROCM_PATH/llvm/bin:$PATH
```
 

Now, back to the $HOME directory. We clone and build all the HIP repositories.

``` 
git clone -b $HIP_BRANCH https://github.com/ROCm-Developer-Tools/HIP
git clone -b $HIP_BRANCH https://github.com/ROCm-Developer-Tools/hipamd.git
git clone -b $HIP_BRANCH https://github.com/ROCm-Developer-Tools/ROCclr.git
git clone -b $HIP_BRANCH https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime.git
```
 

We export the Path names for the installed directories. 
Depending, on the folder install from Github, it can be different names. 
``` 
export HIPAMD_DIR="$(readlink -f hipamd)"
export HIP_DIR="$(readlink -f HIP)"
export ROCclr_DIR="$(readlink -f ROCclr)"
export OPENCL_DIR="$(readlink -f ROCm-OpenCL-Runtime)"
``` 
 
We need the mesa-libGLU-dev which can be download Marcus’s bash script mesa-libGLU-dev from here:
```
git clone  https://github.com/jchen706/RHEL-not-superuser
cd RHEL-not-superuser
sh download.sh
```
Export to include the new install mesa-libGLU-dev.
```
export CPLUS_INCLUDE_PATH=$HOME/prefix/usr/include
```



Since we are not building the HSA Runtime, we need to copy over HSA Runtime Build from /opt/rocm-5.2.0

From the $HOME directory path:

```
mkdir -p $ROCM_PATH/hsa
cp -r /opt/rocm/include/hsa $ROCM_PATH/hsa
export CPLUS_INCLUDE_PATH=$ROCM_PATH/hsa/:$CPLUS_INCLUDE_PATH
```

We need to create the lib and bin folder for $ROCM_PATH.
```
mkdir -p $ROCM_PATH/lib
mkdir $ROCM_PATH/bin
```

Copy all the lib* objects from /opt/hsa/hsa/.
```
cp /opt/hsa/hsa/lib* $ROCM_PATH/lib
```


Next need to build rocm_agent_enumerator and copied to $ROCM_PATH/bin.

``` 
git clone https://github.com/RadeonOpenCompute/rocminfo.git
cd rocminfo
git fetch --tags origin 
mkdir -p build
cd build 
cmake -DCMAKE_PREFIX_PATH=$ROCM_PATH ..
make -j$(nproc) 
cd ..
cp rocm_agent_enumerator $ROCM_PATH/bin
``` 
 
 
Next we install HIP AMD. From the $HOME directory.
```
cd hipamd 
Git checkout rocm-5.2.x
mkdir -p build
mkdir -p newinstall
cmake -DHIP_COMMON_DIR=$HIP_DIR -DAMD_OPENCL_PATH=$OPENCL_DIR -DROCCLR_PATH=$ROCCLR_DIR -DROCM_PATH=$ROCM_PATH CMAKE_PREFIX_PATH="/opt/rocm-5.2.0/" -DCMAKE_INSTALL_PREFIX=../newinstall .. 
make -j$(nproc)
make install
export PATH=$HOME/hipamd/newinstall/bin:$PATH
``` 

If we want to make $HOME/opt the one directory for all builds then we need to copy over all the folders in $HOME/hipamd/newinstall to the $HOME/opt.

Move or Copy items in the $HOME/hipamd/newinstall/bin to $HOME/opt/bin
```
cp -av $HOME/hipamd/newinstall/bin/* $HOME/opt/bin
```

Move or Copy the  $HOME/hipamd/newinstall/hip to $HOME/opt/hip.
```
cp -av -r $HOME/hipamd/newinstall/hip $HOME/opt/
```
Move or Copy items in the $HOME/hipamd/newinstall/lib to $HOME/opt/lib.
```
cp -av -r $HOME/hipamd/newinstall/lib/* $HOME/opt/lib
```

Move or Copy items in the $HOME/hipamd/newinstall/include to $HOME/opt/include.

```
cp -av -r $HOME/hipamd/newinstall/include/* $HOME/opt/include
```

Move or Copy items in the $HOME/hipamd/newinstall/share to $HOME/opt/share.

```
cp -av -r $HOME/hipamd/newinstall/share $HOME/opt/share
```



Next we need to install and build ROCm Device Libs.
 
```
git clone https://github.com/RadeonOpenCompute/ROCm-Device-Libs.git -b amd-stg-open 
mkdir build
mkdir install
cd build
cmake -DCMAKE_INSTALL_PREFIX=../install .. 
make -j$(nproc)
make install
export DEVICE_LIB_PATH=~/ROCm-Device-Libs/install/amdgcn/bitcode/
```

If we want to make $HOME/opt the one directory for all builds then we need to copy over all the folders in $HOME/ROCm-Device-Libs/install to the $HOME/opt.

```
cp -av -r $HOME/ROCm-Device-Libs/install/share/* $HOME/opt/share
```
Move or Copy items in the $HOME/ROCm-Device-Libs/install/lib64 to $HOME/opt/lib64.

```
cp -av -r $HOME/ROCm-Device-Libs/install/lib64/* $HOME/opt/lib64
```

Move or Copy amdgcn $HOME/ROCm-Device-Libs/install/amdgcn to $HOME/opt/amdgcn.
```
cp -av -r $HOME/ROCm-Device-Libs/install/amdgcn $HOME/opt/
```


We also may need to copy the HSA Runtimes or other missing files to $HOME/opt/.

```
cp -av /opt/rocm-5.2.0/lib/libhsa-runtime64.so* $HOME/opt/lib

cp -av -r /opt/rocm-5.2.0/lib64/* $HOME/opt/lib64

cp /opt/rocm-5.2.0/include/hsakmt* $HOME/opt/include

cp /opt/rocm-5.2.0/bin/rocminfo $HOME/opt/bin

cp -r -av /opt/rocm-5.2.0/amdgcn/ $HOME/opt

cp -av /opt/rocm-5.2.0/include/hip $HOME/opt/include/hip

```


The final paths will be the in the section "Runtime Build Path if building from source" from above.


Building RocProfiler 
```
export CMAKE_PREFIX_PATH=/opt/include/hsa:/opt/
mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=~/opt .. && make -j && make install
```

Building RocTracer
```
export CMAKE_PREFIX_PATH=/opt/include/hsa:/opt/
mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=~/opt .. && make -j && make install

```