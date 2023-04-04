AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../..)
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-O3 -IAVI
LDFLAGS=-LAVI -lavi

# Objects required for compilation
OBJS=main.o
BENCHMARK_NAME=heartwall

HIPIFY_OBJS=$(OBJS:.o=.hipify.o)
CUPBOP_OBJS=$(OBJS:.o=.cupbop.o)

%.hipify.cpp: %.cu
	$(HIPIFY) $< -o $@

.SECONDARY:
%.hipify.o: %.hipify.cpp
	$(HIPCC) $(CXXFLAGS) -c $< -o $@

%.cupbop.o: %.cu
	$(CUPBOPCC) $(CXXFLAGS) -o $@ -c $<

.PHONY: clean all
all: $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify
	@echo ------- CUDA is at: $(CUDA_PATH)
	@echo - CuPBoP-AMD is at: $(AMDCUDA_DIR)
	@echo -- CuPBoP-CC is at: $(CUPBOPCC)
	@echo --------- CC is at: $(CC)
	@echo -------- CXX is at: $(CXX)
	@echo ----- HIPIFY is at: $(HIPIFY)
	@echo ------ HIPCC is at: $(HIPCC)

clean: dep-avilib-clean
	rm -f $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify $(HIPIFY_OBJS) $(CUPBOP_OBJS) $(OBJS:.o=.hipify.cpp)

$(BENCHMARK_NAME).cupbop: $(CUPBOP_OBJS) dep-avilib-all
	$(CUPBOPCC) $(LDFLAGS) -o $@ $(CUPBOP_OBJS)

$(BENCHMARK_NAME).hipify: $(HIPIFY_OBJS) dep-avilib-all
	$(HIPCC) $(HIPIFY_OBJS) $(LDFLAGS) -L/opt/rocm/llvm/lib/clang/14.0.0/lib/linux -o $@

.PHONY: dep-avilib-all
dep-avilib-all:
	$(MAKE) -C AVI all

.PHONY: dep-avilib-clean
dep-avilib-clean:
	$(MAKE) -C AVI clean
