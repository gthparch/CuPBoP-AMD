#!/bin/bash

set -e

export AMD_LOG_LEVEL=4
rm -f *.ll
../../../scripts/amdcuda -v -i main.cu
./main.translated
