#!/bin/bash

set -e
rm -f *.ll
../../../scripts/amdcuda -v -i main.cu
./main.translated
