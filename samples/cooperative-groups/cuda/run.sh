#!/bin/bash

rm -f *.ll
../../../scripts/amdcuda -i main.cu
./main.translated
