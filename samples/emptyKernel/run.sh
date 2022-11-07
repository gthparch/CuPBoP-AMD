ROCM_PATH="/nethome/jchen706/opt"
HIP_PATH="/nethome/jchen706/opt/hip"

# export LD_LIBRARY_PATH=/nethome/jchen706/opt/lib:/nethome/jchen706/opt/hip/lib:/nethome/jchen706/coding/amdcuda/runtime/build:$LD_LIBRARY_PATH

g++ -o test -g main.cpp -L/nethome/jchen706/coding/amdcuda/runtime/build \
-I/nethome/jchen706/coding/amdcuda/runtime/include -lcudaonamd -lc
# -L$HIP_PATH/lib -lamdhip64 -L$ROCM_PATH/lib -lhsa-runtime64 -ldl -lnuma




