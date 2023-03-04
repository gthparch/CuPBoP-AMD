AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../..)
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-g -O0

# Objects required for compilation
OBJS=huffman_main.o
CXXOBJS=cpuencode.o stats_logger.o
BENCHMARK_NAME=huffman

HIPIFY_OBJS=$(OBJS:.o=.hipify.o)
CUPBOP_OBJS=$(OBJS:.o=.cupbop.o)

%.hipify.cpp: %.cu
	$(HIPIFY) $< -o $@

.SECONDARY:
%.hipify.o: %.hipify.cpp
	$(HIPCC) $(CXXFLAGS) -c $< -o $@

%.cupbop.o: %.cu
	$(CUPBOPCC) $(CXXFLAGS) -o $@ -c $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

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
	rm -f $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify *.o *.hipify.cpp

$(BENCHMARK_NAME).cupbop: $(CUPBOP_OBJS) $(CXXOBJS)
	$(CUPBOPCC) -o $@ $^

$(BENCHMARK_NAME).hipify: $(HIPIFY_OBJS) $(CXXOBJS)
	$(HIPCC) $(CXXFLAGS) -L/opt/rocm/llvm/lib/clang/14.0.0/lib/linux -o $@ $^
