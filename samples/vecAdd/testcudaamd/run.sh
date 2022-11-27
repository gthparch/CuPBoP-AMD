# clang++ vecAdd.cpp -target amdgcn--amdhsa -mcpu=gfx900 --save-temps -c


# hipcc vecAdd.cpp -c --save-temps
# hipcc vecAdd.cu -c --save-temps


# command run by hipcc
# /nethome/jchen706/opt/llvm/bin/clang++  -isystem /nethome/jchen706/opt/hsa/include -isystem "/nethome/jchen706/opt/include" --offload-arch=gfx90a --offload-arch=gfx90a -O3 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false --hip-device-lib-path="/nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/"  -x hip vecAdd.cpp -c --save-temps
# /nethome/jchen706/opt/llvm/bin/clang++  -isystem /nethome/jchen706/opt/hsa/include -isystem "/nethome/jchen706/opt/include" --offload-arch=gfx90a --offload-arch=gfx90a -O3 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false --hip-device-lib-path="/nethome/jchen706/ROCm-Device-Libs/install/amdgcn/bitcode/"  -x hip vecAdd.cpp -c --save-temps