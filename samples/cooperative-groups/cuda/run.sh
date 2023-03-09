#!/bin/bash

set -e
rm -f *.ll
../../../scripts/amdcuda -v main.cu
./main.translated
