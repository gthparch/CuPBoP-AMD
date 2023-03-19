#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "define.h"

void myocyte_write(const char *filename, fp *input, int data_rows, int data_cols, int major,
           int data_range);

void myocyte_read(const char *filename, fp *input, int data_rows, int data_cols, int major);

#ifdef __cplusplus
}
#endif
