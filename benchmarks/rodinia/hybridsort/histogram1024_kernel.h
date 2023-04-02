#pragma once
#ifndef __HISTOGRAM
#define __HISTOGRAM
void initHistogram1024(void);
void closeHistogram1024(void);
void histogram1024GPU(
    unsigned int *h_Result,
    float *d_Data,
	float minimum,
	float maximum,
    int dataN);
#endif