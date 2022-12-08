#!/bin/bash








# kernelTranslator
# /nethome/jchen706/coding/amdcuda/build/compilation/kernelTranslator empty-cuda-nvptx64-nvidia-cuda-sm_35.ll




# hostTranslator

# /nethome/jchen706/coding/amdcuda/newbuild/compilation/hostTranslator empty-host-x86_64-unknown-linux-gnu.ll empty.cu-hip-amdgcn-amd-amdhsa.hipfb


# llvm-as  .ll

# llc --relocation-model=pic --filetype=obj  kernel.bc


# COVERT HOST TO ASSEMBLY (S)

#  "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name empty.cpp -mrelocation-model pic -pic-level 2 -pic-is-pie -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -fcoverage-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/emptyKernel/cuda -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/emptyKernel/cuda -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o empty-host-x86_64-unknown-linux-gnu.s -x ir empty-host-x86_64-unknown-linux-gnu.ll.translated_test.bc

# COVERT HOST TO .O

#  "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1as -triple x86_64-unknown-linux-gnu -filetype obj -main-file-name empty.cpp -target-cpu x86-64 -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/emptyKernel/cuda -dwarf-version=5 -mrelocation-model pic --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o empty-host-x86_64-unknown-linux-gnu.o empty-host-x86_64-unknown-linux-gnu.s


# export LD_LIBRARY_PATH=/nethome/jchen706/coding/amdcuda/newbuild/runtime:$LD_LIBRARY_PATH

# LINK TO EXECUTABLE 

ld -pie --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o empty_test /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/Scrt1.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crti.o /usr/lib/gcc/x86_64-redhat-linux/8/crtbeginS.o -L/nethome/jchen706/opt/hip/lib -L/nethome/jchen706/opt/llvm/bin/../lib/clang/16.0.0/lib/x86_64-unknown-linux-gnu -L/nethome/jchen706/opt/llvm/bin/../lib/x86_64-unknown-linux-gnu -L/usr/lib/gcc/x86_64-redhat-linux/8 -L/usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64 -L/lib/../lib64 -L/usr/lib/../lib64 -L/lib -L/usr/lib -lgcc_s -lgcc -lpthread -lm -lrt empty-host-x86_64-unknown-linux-gnu.o -rpath=/nethome/jchen706/opt/hip/lib:/nethome/jchen706/opt/lib -lamdhip64 -lclang_rt.builtins -lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc/x86_64-redhat-linux/8/crtendS.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crtn.o -L/nethome/jchen706/coding/amdcuda/newbuild/runtime \
-lcudaonamd

# -I/nethome/jchen706/coding/amdcuda/runtime/include

chmod +x empty_test

./empty_test























