
hipcc main.cpp -c --save-temps -O3 
llvm-dis main-hip-amdgcn-amd-amdhsa-gfx90a.bc
llvm-dis main-host-x86_64-unknown-linux-gnu.bc 
