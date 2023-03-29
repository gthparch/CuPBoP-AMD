AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../..)
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-g -O0 -I/opt/rocm-5.2.0/llvm/include/ -IAVI -Imeschach_lib -openmp
LDFLAGS=-LAVI -Lmeschach_lib -lmeschach -lavi

# Objects required for compilation
OBJS=find_ellipse_kernel.o track_ellipse_kernel.o
CXXOBJS=detect_main.o find_ellipse.o misc_math.o track_ellipse.o
BENCHMARK_NAME=leukocyte

# Additional CuPBoP-CC flags, add -i to inspect IRs
C3FLAGS=

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
	$(CC) -openmp $(CXXFLAGS) -c $< -o $@

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
	make -C AVI clean
	make -C meschach_lib cleanup

.PHONY: avilib meschach_lib external_deps
avilib:
	$(MAKE) -C AVI

meschach_lib:
	$(MAKE) -C meschach_lib

external_deps: avilib meschach_lib

$(BENCHMARK_NAME).cupbop: $(CXXOBJS) $(CUPBOP_OBJS) external_deps
	$(CUPBOPCC) $(C3FLAGS) -o $@ $(LDFLAGS) $(CUPBOP_OBJS) $(CXXOBJS)

$(BENCHMARK_NAME).hipify: $(CXXOBJS) $(HIPIFY_OBJS) external_deps
	$(HIPCC) $(CXXFLAGS) -L/opt/rocm/llvm/lib/clang/14.0.0/lib/linux -o $@ $(HIPIFY_OBJS) $(CXXOBJS) $(LDFLAGS)
