# Must points to the root of the AMDCUDA repository
# - Depending on where the benchmark is relative to the root of the repository,
#	you may or may not need to change this.
# - Defaults to 3 directories up from the current directory
AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../..)

# Linker flags
# - LDFLAGS are passed to the linker, and are used to link the CUDA objects with
#	other objects
LDFLAGS=

# Objects required for compilation
# - Objects declared here are translated and compiled with both CuPBoP-CC and HIPIFY
#
# Example:
# - OBJS=foo.o bar.o # will compile foo.cu and bar.cu with CuPBoP-CC, then
#					 # translate foo.cu and bar.cu with HIPIFY and compile with HIPCC	
OBJS=main.o bucketsort.o mergesort.o histogram1024_kernel.o

# Non-CUDA objects for compilation
# - Objects declared here are compiled with CXX and linked with the CUDA objects
#
# Example:
# - CXXOBJS=foo.o bar.o # will compile foo.c and bar.c with CXX and link with
#	CuPBoP-CC and HIPCC
CXXOBJS=

# Benchmark name, used for output binaries
# - Hipify binary will be named BENCHMARK_NAME.hipify
# - CuPBoP-CC binary will be named BENCHMARK_NAME.cupbop
BENCHMARK_NAME=hybridsort

# Additional CuPBoP-CC flags
# - Run `amdcuda -h` to see the full list of options supported by the script.
#
# Example:
# - C3FLAGS=-i 		# Tell CuPBoP-CC to produce human-redable IRs every step along the
#			   		# translation pipeline.
# - C3FLAGS=-v 		# Tell CuPBoP-CC to be more verbose
# - C3FLAGS=-v -t 	# Tell CuPBoP-CC to be verbose and don't delete any temporary files
C3FLAGS=-i -v

# Other flags that you probably don't need to change
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-g -O0 -I/opt/rocm/llvm/include/ -openmp

HIPIFY_OBJS=$(OBJS:.o=.hipify.o)
CUPBOP_OBJS=$(OBJS:.o=.cupbop.o)

%.hipify.cpp: %.cu
	$(HIPIFY) $< -o $@

.SECONDARY:
%.hipify.o: %.hipify.cpp
	$(HIPCC) $(CXXFLAGS) -c $< -o $@

%.cupbop.o: %.cu
	$(CUPBOPCC) $(C3FLAGS) $(CXXFLAGS) -o $@ -c $<

%.o: %.c
	$(CXX) -openmp $(CXXFLAGS) -c $< -o $@

.PHONY: clean all
all: $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify
	@echo ------- CUDA is at: $(CUDA_PATH)
	@echo - CuPBoP-AMD is at: $(AMDCUDA_DIR)
	@echo -- CuPBoP-CC is at: $(CUPBOPCC)
	@echo --------- CC is at: $(CC)
	@echo -------- CXX is at: $(CXX)
	@echo ----- HIPIFY is at: $(HIPIFY)
	@echo ------ HIPCC is at: $(HIPCC)

clean:
	rm -f $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify $(HIPIFY_OBJS) $(CUPBOP_OBJS) $(OBJS:.o=.hipify.cpp) $(CXXOBJS) *.ll

.PHONY:external_deps
external_deps:

$(BENCHMARK_NAME).cupbop: $(CXXOBJS) $(CUPBOP_OBJS) external_deps
	$(CUPBOPCC) $(C3FLAGS) -o $@ $(LDFLAGS) $(CUPBOP_OBJS) $(CXXOBJS)

$(BENCHMARK_NAME).hipify: $(CXXOBJS) $(HIPIFY_OBJS) external_deps
	$(HIPCC) $(CXXFLAGS) -o $@ $(HIPIFY_OBJS) $(CXXOBJS) $(LDFLAGS)
