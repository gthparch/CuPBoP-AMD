# clang++ vecAdd.cu -c  --cuda-path=/nethome/jchen706/cuda-11.5 -L/nethome/jchen706/cuda-11.5/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-dis vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc
# llvm-dis vecAdd-host-x86_64-unknown-linux-gnu.bc


# valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose /nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc
/nethome/jchen706/coding/code2/amdcuda/build/compilation/kernelTranslator vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc

llvm-dis vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc



# #COVERT TO .S

# # "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1 -triple amdgcn-amd-amdhsa -aux-triple x86_64-unknown-linux-gnu -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vecAdd.cpp -mrelocation-model pic -pic-level 1 -fhalf-no-semantic-interposition -mframe-pointer=none -fno-rounding-math -mconstructor-aliases -aux-target-cpu x86-64 -fcuda-is-device -mllvm -amdgpu-internalize-symbols -fcuda-allow-variadic-functions -fvisibility=hidden -fapply-global-visibility-to-externs -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/hip.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/ocml.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/ockl.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_daz_opt_off.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_unsafe_math_off.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_finite_only_off.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_correctly_rounded_sqrt_on.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_wavefrontsize64_on.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_isa_version_90a.bc -mlink-builtin-bitcode /nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/oclc_abi_version_400.bc -target-cpu gfx90a -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fno-autolink -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/cuda -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -o vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.s -x ir vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.bc

# # llvm-as vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.ll


/nethome/jchen706/opt/llvm/bin/clang-16 -cc1 -v -triple amdgcn-amd-amdhsa -aux-triple x86_64-unknown-linux-gnu -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vecAdd.cpp -mrelocation-model pic -pic-level 1 -fhalf-no-semantic-interposition -mframe-pointer=none -fno-rounding-math -mconstructor-aliases -aux-target-cpu x86-64 -fcuda-is-device -mllvm -amdgpu-internalize-symbols -fcuda-allow-variadic-functions -fvisibility=hidden -fapply-global-visibility-to-externs  -target-cpu gfx90a -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fno-autolink -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/cuda -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -o vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.s -x ir vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc

# COVERT TO .O

"/nethome/jchen706/opt/llvm/bin/clang-16" -cc1as -triple amdgcn-amd-amdhsa -filetype obj -main-file-name vecAdd.cpp -target-cpu gfx90a -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/attemptHip -dwarf-version=5 -mrelocation-model pic --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o vecAdd-hip-amdgcn-amd-amdhsa-gfx90a.o vecAdd-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated.s

# GET STATIC CLANG


"/nethome/jchen706/opt/llvm/bin/clang-offload-bundler" -unbundle -type=a -input=/nethome/jchen706/opt/llvm/bin/../lib/clang/16.0.0/lib/x86_64-unknown-linux-gnu/libclang_rt.builtins.a -targets=hip-amdgcn-amd-amdhsa-gfx90a -output=/tmp/libbc-clang_rt.builtins-amdgcn-gfx90a-f680d0.a -allow-missing-bundles -hip-openmp-compatible

# LINK STATIC CLANG WITH .O

"/nethome/jchen706/opt/llvm/bin/lld" -flavor gnu --no-undefined -shared -plugin-opt=-amdgpu-internalize-symbols -plugin-opt=mcpu=gfx90a -plugin-opt=O3 -plugin-opt=-amdgpu-early-inline-all=true -plugin-opt=-amdgpu-function-calls=false -save-temps -o vecAdd-hip-amdgcn-amd-amdhsa-gfx90a.out vecAdd-hip-amdgcn-amd-amdhsa-gfx90a.o /tmp/libbc-clang_rt.builtins-amdgcn-gfx90a-f680d0.a

# GENERATE FAT BINARY

"/nethome/jchen706/opt/llvm/bin/clang-offload-bundler" -type=o -bundle-align=4096 -targets=host-x86_64-unknown-linux,hipv4-amdgcn-amd-amdhsa--gfx90a -input=/dev/null -input=vecAdd-hip-amdgcn-amd-amdhsa-gfx90a.out -output=vecAdd.cpp-hip-amdgcn-amd-amdhsa.hipfb

# hostTranslator

/nethome/jchen706/coding/code2/amdcuda/build/compilation/hostTranslator vecAdd-host-x86_64-unknown-linux-gnu.ll vecAdd.cpp-hip-amdgcn-amd-amdhsa.hipfb

llvm-dis vecAdd-host-x86_64-unknown-linux-gnu.ll.translated_test.bc
# llvm-as  .ll


# llc --relocation-model=pic --filetype=obj  kernel.bc

# COVERT HOST TO ASSEMBLY (S)

 "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1 -triple x86_64-unknown-linux-gnu -aux-triple amdgcn-amd-amdhsa -S -save-temps=cwd -disable-free -clear-ast-before-backend -disable-llvm-verifier -discard-value-names -main-file-name vecAdd.cpp -mrelocation-model pic -pic-level 2 -pic-is-pie -mframe-pointer=none -fmath-errno -fno-rounding-math -mconstructor-aliases -funwind-tables=2 -target-cpu x86-64 -tune-cpu generic -mllvm -treat-scalable-fixed-error-as-warning -debugger-tuning=gdb -v -fcoverage-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/cuda -resource-dir /nethome/jchen706/opt/llvm/lib/clang/16.0.0 -O3 -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/cuda -ferror-limit 19 -fhip-new-launch-api -fgnuc-version=4.2.1 -fcolor-diagnostics -vectorize-loops -vectorize-slp -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -cuid=7426647a80c85315 -fcuda-allow-variadic-functions -faddrsig -D__GCC_HAVE_DWARF2_CFI_ASM=1 -o vecAdd-host-x86_64-unknown-linux-gnu-test.s -x ir vecAdd-host-x86_64-unknown-linux-gnu.ll.translated_test.bc

# COVERT HOST TO .O

 "/nethome/jchen706/opt/llvm/bin/clang-16" -cc1as -triple x86_64-unknown-linux-gnu -filetype obj -main-file-name vecAdd.cpp -target-cpu x86-64 -fdebug-compilation-dir=/nethome/jchen706/coding/amdcuda/samples/vecAddKernel/cuda -dwarf-version=5 -mrelocation-model pic --mrelax-relocations -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false -o vecAdd-host-x86_64-unknown-linux-gnu-test.o vecAdd-host-x86_64-unknown-linux-gnu-test.s

export LD_LIBRARY_PATH=/nethome/jchen706/coding/amdcuda/build/runtime:$LD_LIBRARY_PATH

# LINK TO EXECUTABLE 

ld -pie --hash-style=gnu --eh-frame-hdr -m elf_x86_64 -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o vecAdd_test /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/Scrt1.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crti.o /usr/lib/gcc/x86_64-redhat-linux/8/crtbeginS.o -L/nethome/jchen706/opt/hip/lib -L/nethome/jchen706/opt/llvm/bin/../lib/clang/16.0.0/lib/x86_64-unknown-linux-gnu -L/nethome/jchen706/opt/llvm/bin/../lib/x86_64-unknown-linux-gnu -L/usr/lib/gcc/x86_64-redhat-linux/8 -L/usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64 -L/lib/../lib64 -L/usr/lib/../lib64 -L/lib -L/usr/lib -lgcc_s -lgcc -lpthread -lm -lrt vecAdd-host-x86_64-unknown-linux-gnu-test.o -rpath=/nethome/jchen706/opt/hip/lib:/nethome/jchen706/opt/lib -lamdhip64 -lclang_rt.builtins -lstdc++ -lm -lgcc_s -lgcc -lc -lgcc_s -lgcc /usr/lib/gcc/x86_64-redhat-linux/8/crtendS.o /usr/lib/gcc/x86_64-redhat-linux/8/../../../../lib64/crtn.o -L/nethome/jchen706/coding/amdcuda/build/runtime \
-lcudaonamd

./vecAdd_test

