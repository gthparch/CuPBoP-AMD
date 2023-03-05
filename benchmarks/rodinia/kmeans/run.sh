#!/bin/bash

set -e
AMDCUDA_DIR=`realpath ../../..`
RODINIA_PATH=`realpath ..`

# "$AMDCUDA_DIR/scripts/amdcuda" -o "kmeans.cupbop" \
#     kmeans_cuda.cu \
#     cluster.c \
#     kmeans_clustering.c \
#     kmeans.c \
#     rmse.c

# AMD_LOG_LEVEL=2 LD_LIBRARY_PATH="$AMDCUDA_DIR/build/runtime:$LD_LIBRARY_PATH" ./kmeans.cupbop -o -i \
#     file "$RODINIA_PATH/rodinia-data/kmeans/kdd_cup"

# clang++ cluster.c kmeans.c kmeans_cuda.cu kmeans_clustering.c rmse.c -c --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -fPIC -ldl -lrt -pthread -save-temps -v
# llvm-dis  kmeans_cuda-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis  kmeans_cuda-host-x86_64-unknown-linux-gnu.bc

# /nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator  kmeans_cuda-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis  kmeans_cuda-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc

#  "/nethome/jchen706/opt/llvm/bin/llvm-link" -o kmeans_link.bc kmeans_cuda-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc /nethome/jchen706/coding/code2/amdcuda/bitcode/textureFloat1DReadMode.ll

#  "/nethome/jchen706/opt/llvm/bin/llvm-link" -o kmeans_link1.bc kmeans_link.bc /nethome/jchen706/coding/code2/amdcuda/bitcode/cudaamd-gridblock-size.ll

#  "/nethome/jchen706/opt/llvm/bin/llvm-link" -o kmeans_link2.bc kmeans_link1.bc /nethome/jchen706/coding/code2/amdcuda/bitcode/ockl.ll

#  "/nethome/jchen706/opt/llvm/bin/llvm-link" -o kmeans_link2.bc kmeans_link1.bc /nethome/jchen706/coding/code2/amdcuda/bitcode/reqd-work-group-size.ll



#  "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1 -v -triple amdgcn-amd-amdhsa -aux-triple x86_64-unknown-linux-gnu -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name empty.cpp -mrelocation-model pic -pic-level 1 -fhalf-no-semantic-interposition -mframe-pointer=none -fno-rounding-math -mconstructor-aliases -aux-target-cpu x86-64 -fcuda-is-device -mllvm -amdgpu-internalize-symbols -fcuda-allow-variadic-functions -fvisibility=hidden -fapply-global-visibility-to-externs  -target-cpu gfx90a -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fno-autolink -fdebug-compilation-dir=/nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/kmeans -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -o empty-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.s -x ir kmeans_link1.bc

# COVERT TO .O

# "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1as -triple amdgcn-amd-amdhsa -filetype obj -main-file-name empty.cpp -target-cpu gfx90a -fdebug-compilation-dir=/nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/kmeans -dwarf-version=5 -mrelocation-model pic --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o empty-hip-amdgcn-amd-amdhsa-gfx90a.o empty-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.s

# GET STATIC CLANG


# "/nethome/jchen706/opt/llvm/bin/clang-offload-bundler" -unbundle -type=a -input=/nethome/jchen706/opt/llvm/bin/../lib/clang/16.0.0/lib/x86_64-unknown-linux-gnu/libclang_rt.builtins.a -targets=hip-amdgcn-amd-amdhsa-gfx90a -output=/tmp/libbc-clang_rt.builtins-amdgcn-gfx90a-f680d0.a -allow-missing-bundles -hip-openmp-compatible

# LINK STATIC CLANG WITH .O

# "/nethome/jchen706/opt/llvm/bin/lld" -flavor gnu --no-undefined -shared -plugin-opt=-amdgpu-internalize-symbols -plugin-opt=mcpu=gfx90a -plugin-opt=O3 -plugin-opt=-amdgpu-early-inline-all=true -plugin-opt=-amdgpu-function-calls=false -save-temps -o empty-hip-amdgcn-amd-amdhsa-gfx90a.out empty-hip-amdgcn-amd-amdhsa-gfx90a.o /tmp/libbc-clang_rt.builtins-amdgcn-gfx90a-f680d0.a

# GENERATE FAT BINARY

# "/nethome/jchen706/opt/llvm/bin/clang-offload-bundler" -type=o -bundle-align=4096 -targets=host-x86_64-unknown-linux,hipv4-amdgcn-amd-amdhsa--gfx90a -input=/dev/null -input=empty-hip-amdgcn-amd-amdhsa-gfx90a.out -output=empty.cpp-hip-amdgcn-amd-amdhsa.hipfb

# hostTranslator

# /nethome/jchen706/coding/code2/amdcuda/build/compilation/hostTranslator kmeans_cuda-host-x86_64-unknown-linux-gnu.bc empty.cpp-hip-amdgcn-amd-amdhsa.hipfb

llvm-dis kmeans_cuda-host-x86_64-unknown-linux-gnu.bc.translated_test.bc
# llvm-as  .ll


# COVERT HOST TO ASSEMBLY (S)

 "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name empty.cpp -mrelocation-model pic -pic-level 2 -pic-is-pie -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -fcoverage-compilation-dir=/nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/kmeans -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fdebug-compilation-dir=/nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/kmeans -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o empty-host-x86_64-unknown-linux-gnu-test.s -x ir kmeans_cuda-host-x86_64-unknown-linux-gnu.bc.translated_test.bc

# COVERT HOST TO .O

 "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1as -triple x86_64-unknown-linux-gnu -filetype obj -main-file-name empty.cpp -target-cpu x86-64 -fdebug-compilation-dir=/nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/kmeans -dwarf-version=5 -mrelocation-model pic --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o empty-host-x86_64-unknown-linux-gnu-test.o empty-host-x86_64-unknown-linux-gnu-test.s

export LD_LIBRARY_PATH=/nethome/jchen706/coding/code2/amdcuda/build/runtime:$LD_LIBRARY_PATH

# LINK TO EXECUTABLE 

if [[ -z "$LLVM_PREFIX" ]]; then
    LLVM_PREFIX="$(dirname "$(dirname "$(which clang)")")"
fi

AMDCUDA_CLANG="$LLVM_PREFIX/bin/clang"

AMDCUDA_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )
AMDCUDA_RT_DIR="$AMDCUDA_DIR/build/runtime"

"$AMDCUDA_CLANG" \
        -o test \
        -L"$AMDCUDA_RT_DIR" \
        -L"$ROCM_PATH/lib" \
        -L"$HIP_PATH/lib" \
        -L"$AMDCUDA_DIR/build/runtime" \
        -L/nethome/jchen706/coding/code2/amdcuda/build/runtime \
        -Wl,-rpath="$AMDCUDA_RT_DIR:$HIP_PATH/lib:$ROCM_PATH/lib",--enable-new-dtags \
        -lcudaonamd \
        -lpthread \
        -lamdhip64 \
        -lstdc++ \
        -lrt \
        -lm \
        -lgcc_s \
        -lgcc \
        -lc \
        -lgcc_s \
        -lgcc \
        -lstdc++ \
        cluster.o rmse.o kmeans_clustering.o kmeans.o \
        empty-host-x86_64-unknown-linux-gnu-test.o \
        

# ld -pie --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o empty_test /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/Scrt1.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crti.o /usr/lib/gcc/x86_64-redhat-linux/8/crtbeginS.o -L/nethome/jchen706/opt/hip/lib -L/nethome/jchen706/opt/llvm/bin/../lib/clang/16.0.0/lib/x86_64-unknown-linux-gnu -L/nethome/jchen706/opt/llvm/bin/../lib/x86_64-unknown-linux-gnu -L/usr/lib/gcc/x86_64-redhat-linux/8 -L/usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64 -L/lib/../lib64 -L/usr/lib/../lib64 -L/lib -L/usr/lib -lgcc_s -lgcc -lpthread -lm -lrt cluster.o rmse.o kmeans_clustering.o kmeans.o empty-host-x86_64-unknown-linux-gnu-test.o -rpath=/nethome/jchen706/opt/hip/lib:/nethome/jchen706/opt/lib -lamdhip64 -lclang_rt.builtins -lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc/x86_64-redhat-linux/8/crtendS.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crtn.o -L/nethome/jchen706/coding/code2/amdcuda/build/runtime \
# -lcudaonamd

# ./empty_test
