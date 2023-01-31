#!/bin/bash
../../../scripts/amdcuda main.cu
LD_LIBRARY_PATH=../../../build/runtime ./main.translated
