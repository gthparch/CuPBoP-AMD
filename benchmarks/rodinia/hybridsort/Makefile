AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../..)
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-g -O0 -I/opt/rocm-5.2.0/llvm/include/
CC_FLAGS = -g -O0 -Wall 


# Objects required for compilation
OBJS=main.o  bucketsort.o bucketsort_kernel.o histogram1024_kernel.o mergesort.o mergesort_kernel.o
CXXOBJS=
BENCHMARK_NAME=hybridsort

# Additional CuPBoP-CC flags, add -i to inspect IRs
C3FLAGS=-i

# reference variables with $() 
HIPIFY_OBJS=$(OBJS:.o=.hipify.o)
CUPBOP_OBJS=$(OBJS:.o=.cupbop.o)

# @ mean multiple targets , % means wildcard
# <  means 
%.hipify.cpp: %.cu
	$(HIPIFY) $< -o $@

.SECONDARY:
%.hipify.o: %.hipify.cpp
	$(HIPCC) $(CXXFLAGS) -c $< -o $@

%.cupbop.o: %.cu
	$(CUPBOPCC) $(C3FLAGS) $(CXXFLAGS) -o $@ -c $<

%.o: %.c
	$(CC) -lm -openmp $(CXXFLAGS) -c $< -o $@

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
	rm -f $(BENCHMARK_NAME).cupbop $(BENCHMARK_NAME).hipify $(HIPIFY_OBJS) $(CUPBOP_OBJS) $(OBJS:.o=.hipify.cpp) *.ll

$(BENCHMARK_NAME).cupbop: $(CXXOBJS) $(CUPBOP_OBJS)
	$(CUPBOPCC) $(C3FLAGS) -o $@ $^

$(BENCHMARK_NAME).hipify: $(CXXOBJS) $(HIPIFY_OBJS)
	$(HIPCC) $(CXXFLAGS) -L/opt/rocm/llvm/lib/clang/14.0.0/lib/linux -o $@ $^


# hybridsort: main.cu  bucketsort.cu bucketsort.cuh bucketsort_kernel.cu histogram1024_kernel.cu  mergesort.cu mergesort.cuh mergesort_kernel.cu
# 	$(CC) $(CC_FLAGS) $(VERIFY) $(OUTPUT) $(TIMER) $(HISTO_WG_SIZE_0) $(BUCKET_WG_SIZE_0) $(BUCKET_WG_SIZE_1) $(MERGE_WG_SIZE_0) $(MERGE_WG_SIZE_1) bucketsort.cu mergesort.cu main.cu -o hybridsort


clean:
	rm	*.o hybridsort
