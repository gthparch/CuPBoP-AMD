AMDCUDA_DIR=$(realpath $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/../../../..)
HIPCC=hipcc
HIPIFY=$(AMDCUDA_DIR)/scripts/hipify-perl
CUPBOPCC=$(AMDCUDA_DIR)/scripts/amdcuda
CC=clang
CXX=clang++
LD=ld.lld
CXXFLAGS=-g -O0 -I/opt/rocm-5.2.0/llvm/include/ -I$(MATRIX_DIR)  -L$(MATRIX_DIR) -lm -openmp -lmeschach 
CC_FLAGS = -g -O0 -Wall -I$(MATRIX_DIR) -L$(MATRIX_DIR) -lmeschach -lm

# Matrix library path
MATRIX_DIR = /nethome/jchen706/coding/code2/amdcuda/benchmarks/rodinia/leukocyte/meschach_lib

# Objects required for compilation
OBJS=find_ellipse_kernel.o track_ellipse_kernel.o
CXXOBJS=detect_main.o avilib.o find_ellipse.o track_ellipse.o misc_math.o
BENCHMARK_NAME=leukocyte

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
	$(CUPBOPCC) $(C3FLAGS) -I$(MATRIX_DIR) -o $@ $^

$(BENCHMARK_NAME).hipify: $(CXXOBJS) $(HIPIFY_OBJS)
	$(HIPCC) $(CXXFLAGS) -I$(MATRIX_DIR) -L/opt/rocm/llvm/lib/clang/14.0.0/lib/linux -o $@ $^


# leukocyte: detect_main.o avilib.o find_ellipse.o find_ellipse_kernel.o track_ellipse.o track_ellipse_kernel.o misc_math.o $(MATRIX_DIR)/meschach.a
# 	$(CC) $(CC_FLAGS) -lm avilib.o find_ellipse.o find_ellipse_kernel.o track_ellipse.o track_ellipse_kernel.o misc_math.o detect_main.o -o leukocyte $(MATRIX_DIR)/meschach.a -L$(CUDA_LIB_DIR) -lm -lcuda -lcudart

# %.o: %.[ch]
# 	$(CC)  $(OUTPUT) $(CC_FLAGS) $< -c

# detect_main.o: detect_main.c find_ellipse.h track_ellipse.h avilib.h 
# 	$(CC) $(CXXFLAGS) -lm detect_main.c -c

# find_ellipse_kernel.o: find_ellipse_kernel.cu find_ellipse_kernel.h
# 	$(NVCC) $(NVCC_FLAGS) -c find_ellipse_kernel.cu

# track_ellipse_kernel.o: track_ellipse_kernel.cu track_ellipse_kernel.h
# 	$(NVCC) $(NVCC_FLAGS) -I$(MATRIX_DIR) -c track_ellipse_kernel.cu

find_ellipse.o: avilib.h

track_ellipse.o: find_ellipse.h avilib.h

$(MATRIX_DIR)/meschach.a:
	cd $(MATRIX_DIR); ./configure --with-all; make all; make clean

# clean:
# 	rm -f *.o *~ leukocyte *.linkinfo
