//===============================================================================================================================================================================================================
//===============================================================================================================================================================================================================
//	KERNEL FUNCTION
//===============================================================================================================================================================================================================
//===============================================================================================================================================================================================================

__global__ void kernel() {

    //======================================================================================================================================================
    //	COMMON VARIABLES
    //======================================================================================================================================================

    fp *d_in;
    int rot_row;
    int rot_col;
    int in2_rowlow;
    int in2_collow;
    int ic;
    int jc;
    int jp1;
    int ja1, ja2;
    int ip1;
    int ia1, ia2;
    int ja, jb;
    int ia, ib;
    float s;
    int i;
    int j;
    int row;
    int col;
    int ori_row;
    int ori_col;
    int position;
    float sum;
    int pos_ori;
    float temp;
    float temp2;
    int location;
    int cent;
    int tMask_row;
    int tMask_col;
    float largest_value_current = 0;
    float largest_value = 0;
    int largest_coordinate_current = 0;
    int largest_coordinate = 0;
    float fin_max_val = 0;
    int fin_max_coo = 0;
    int largest_row;
    int largest_col;
    int offset_row;
    int offset_col;
    __shared__ float in_partial_sum[51];     // WATCH THIS !!! HARDCODED VALUE
    __shared__ float in_sqr_partial_sum[51]; // WATCH THIS !!! HARDCODED VALUE
    __shared__ float in_final_sum;
    __shared__ float in_sqr_final_sum;
    float mean;
    float mean_sqr;
    float variance;
    float deviation;
    __shared__ float denomT;
    __shared__ float par_max_val[131]; // WATCH THIS !!! HARDCODED VALUE
    __shared__ int par_max_coo[131];   // WATCH THIS !!! HARDCODED VALUE
    int pointer;
    __shared__ float d_in_mod_temp[2601];
    int ori_pointer;
    int loc_pointer;

    //======================================================================================================================================================
    //	THREAD PARAMETERS
    //======================================================================================================================================================

    int bx = blockIdx.x;  // get current horizontal block index (0-n)
    int tx = threadIdx.x; // get current horizontal thread index (0-n)
    int ei_new;

    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================
    //	GENERATE TEMPLATE
    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================

    // generate templates based on the first frame only
    if (d_common_change.frame_no == 0) {

        //======================================================================================================================================================
        // GET POINTER TO TEMPLATE FOR THE POINT
        //======================================================================================================================================================

        // pointers to: current template for current point
        d_in = &d_unique[bx].d_T[d_unique[bx].in_pointer];

        //======================================================================================================================================================
        //	UPDATE ROW LOC AND COL LOC
        //======================================================================================================================================================

        // uptade temporary endo/epi row/col coordinates (in each block
        // corresponding to point, narrow work to one thread)
        ei_new = tx;
        if (ei_new == 0) {

            // update temporary row/col coordinates
            pointer = d_unique[bx].point_no * d_common.no_frames +
                      d_common_change.frame_no;
            d_unique[bx].d_tRowLoc[pointer] =
                d_unique[bx].d_Row[d_unique[bx].point_no];
            d_unique[bx].d_tColLoc[pointer] =
                d_unique[bx].d_Col[d_unique[bx].point_no];
        }

        //======================================================================================================================================================
        //	CREATE TEMPLATES
        //======================================================================================================================================================

        // work
        ei_new = tx;
        // printf(" ei_new %d, d_in2 %d \n", ei_new, d_common.in_elem);

        while (ei_new < d_common.in_elem) {

            // printf("ei_new$$$000 %d \n", ei_new);

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in_rows == 0) {
                row = d_common.in_rows - 1;
                col = col - 1;
            }

            // figure out row/col location in corresponding new template area in
            // image and give to every thread (get top left corner and progress
            // down and right)
            ori_row = d_unique[bx].d_Row[d_unique[bx].point_no] - 25 + row - 1;
            ori_col = d_unique[bx].d_Col[d_unique[bx].point_no] - 25 + col - 1;
            ori_pointer = ori_col * d_common.frame_rows + ori_row;

            // update template
            d_in[col * d_common.in_rows + row] =
                d_common_change.d_frame[ori_pointer];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }
    }

    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================
    //	PROCESS POINTS
    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================

    // process points in all frames except for the first one
    if (d_common_change.frame_no != 0) {

        //======================================================================================================================================================
        //	SELECTION
        //======================================================================================================================================================

        in2_rowlow = d_unique[bx].d_Row[d_unique[bx].point_no] -
                     d_common.sSize; // (1 to n+1)
        in2_collow = d_unique[bx].d_Col[d_unique[bx].point_no] - d_common.sSize;

        // work
        ei_new = tx;

        // printf(" in2_rowlow  %d,  in2_collow %d, ei_new %d, d_in2 %d \n",
        // in2_rowlow ,  in2_collow, ei_new, d_common.in2_elem);

        // good

        while (ei_new < d_common.in2_elem) {
            // printf("ei_new### %d \n", ei_new);

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in2_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in2_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_rows == 0) {
                row = d_common.in2_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + in2_rowlow - 1;
            ori_col = col + in2_collow - 1;
            d_unique[bx].d_in2[ei_new] =
                d_common_change
                    .d_frame[ori_col * d_common.frame_rows + ori_row];

            // printf(" bx: %d  ei_new### %d   d_unique[bx].d_in2[ei_new] %f
            // \n",bx, ei_new, d_unique[bx].d_in2[ei_new]);

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        // check 1

        // if(bx == 0 && tx == 0) {

        // 	// d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row]; 	int
        // nextline = 0; 	for(int blockz = 0; blockz < 51; blockz++) { 		for(int
        // threadz = 0; threadz < 6551 ; threadz++) {
        // 			// printf(" bx: %d  ei_new### %d
        // d_unique[bx].d_in2[ei_new] %f \n",blockz, threadz,
        // d_unique[blockz].d_in2[threadz]);
        // 		}
        // 	}
        // }
        __syncthreads();

        //======================================================================================================================================================
        //	CONVOLUTION
        //======================================================================================================================================================

        //====================================================================================================
        //	ROTATION
        //====================================================================================================

        // variables
        d_in = &d_unique[bx].d_T[d_unique[bx].in_pointer];

        // work
        ei_new = tx;
        while (ei_new < d_common.in_elem) {

            // figure out row/col location in padded array
            row = (ei_new + 1) % d_common.in_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in_rows == 0) {
                row = d_common.in_rows - 1;
                col = col - 1;
            }

            // execution
            rot_row = (d_common.in_rows - 1) - row;
            rot_col = (d_common.in_rows - 1) - col;
            d_in_mod_temp[ei_new] = d_in[rot_col * d_common.in_rows + rot_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        // check 2
        // if(bx == 0 && tx == 0) {

        // 	// d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row]; 	int
        // nextline = 0; 	for(int inde = 0; inde < 2601; inde++) {
        // 		// for(int threadz = 0; threadz < 6551 ; threadz++) {
        // 			float te = d_in_mod_temp[inde];
        // 			printf(" inde: %d	d_in_mod_temp[inde]  %f \n",
        // inde,te);
        // 			// printf(" bx: %d  ei_new### %d
        // d_unique[bx].d_in2[ei_new] %f \n",blockz, threadz,
        // d_unique[blockz].d_in2[threadz]);
        // 		// }
        // 	}
        // }

        // __syncthreads();

        //====================================================================================================
        //	ACTUAL CONVOLUTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.conv_elem) {

            // figure out row/col location in array
            ic = (ei_new + 1) % d_common.conv_rows;     // (1-n)
            jc = (ei_new + 1) / d_common.conv_rows + 1; // (1-n)
            if ((ei_new + 1) % d_common.conv_rows == 0) {
                ic = d_common.conv_rows;
                jc = jc - 1;
            }

            //
            j = jc + d_common.joffset;
            jp1 = j + 1;
            if (d_common.in2_cols < jp1) {
                ja1 = jp1 - d_common.in2_cols;
            } else {
                ja1 = 1;
            }
            if (d_common.in_cols < j) {
                ja2 = d_common.in_cols;
            } else {
                ja2 = j;
            }

            i = ic + d_common.ioffset;
            ip1 = i + 1;

            if (d_common.in2_rows < ip1) {
                ia1 = ip1 - d_common.in2_rows;
            } else {
                ia1 = 1;
            }
            if (d_common.in_rows < i) {
                ia2 = d_common.in_rows;
            } else {
                ia2 = i;
            }

            s = 0;

            for (ja = ja1; ja <= ja2; ja++) {
                jb = jp1 - ja;
                for (ia = ia1; ia <= ia2; ia++) {
                    ib = ip1 - ia;
                    s = s +
                        d_in_mod_temp[d_common.in_rows * (ja - 1) + ia - 1] *
                            d_unique[bx]
                                .d_in2[d_common.in2_rows * (jb - 1) + ib - 1];
                }
            }

            // d_unique[bx].d_conv[d_common.conv_rows*(jc-1)+ic-1] = s;
            d_unique[bx].d_conv[ei_new] = s;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        // check 3

        // if(bx == 0 && tx == 0) {

        // 	// d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row]; 	int
        // nextline = 0; 	for(int blockz = 0; blockz < 51; blockz++) { 		for(int
        // threadz = 0; threadz < 6551 ; threadz++) { 			printf(" bx: %d  ei_new###
        // %d   d_unique[bx].d_in2[ei_new] %f \n",blockz, threadz,
        // d_unique[blockz].d_conv[threadz]);
        // 		}
        // 	}
        // }

        // __syncthreads();

        //======================================================================================================================================================
        //	CUMULATIVE SUM
        //======================================================================================================================================================

        //====================================================================================================
        //	PAD ARRAY, VERTICAL CUMULATIVE SUM
        //====================================================================================================

        //==================================================
        //	PADD ARRAY
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_elem) {

            // figure out row/col location in padded array
            row = (ei_new + 1) % d_common.in2_pad_cumv_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_pad_cumv_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_pad_cumv_rows == 0) {
                row = d_common.in2_pad_cumv_rows - 1;
                col = col - 1;
            }

            // execution
            if (row > (d_common.in2_pad_add_rows -
                       1) && // do if has numbers in original array
                row < (d_common.in2_pad_add_rows + d_common.in2_rows) &&
                col > (d_common.in2_pad_add_cols - 1) &&
                col < (d_common.in2_pad_add_cols + d_common.in2_cols)) {
                ori_row = row - d_common.in2_pad_add_rows;
                ori_col = col - d_common.in2_pad_add_cols;
                d_unique[bx].d_in2_pad_cumv[ei_new] =
                    d_unique[bx].d_in2[ori_col * d_common.in2_rows + ori_row];
            } else { // do if otherwise
                d_unique[bx].d_in2_pad_cumv[ei_new] = 0;
            }

            // 		if(ei_new == 10386  && bx == 21){
            // 		float fx =  	d_unique[bx].d_in2_pad_cumv[ei_new];
            // 	  // float tt = temp2;
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx);
            // 		// int sa = d_common.in2_sub_cumh_rows;
            // 		// printf(" %d , %d , %d ", ori_col, ori_row, sa);
            // }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        // check 4

        // if(bx == 0 && tx == 0) {

        // 	// d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row]; 	int
        // nextline = 0; 	for(int blockz = 0; blockz < 51; blockz++) { 		for(int
        // threadz = 0; threadz < 6551 ; threadz++) { 			printf(" bx: %d  ei_new###
        // %d   d_unique[bx].d_in2[ei_new] %f \n",blockz, threadz,
        // d_unique[blockz].d_in2_pad_cumv[threadz]);
        // 		}
        // 	}
        // }

        __syncthreads();

        //==================================================
        //	VERTICAL CUMULATIVE SUM
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_cols) {

            // figure out column position
            pos_ori = ei_new * d_common.in2_pad_cumv_rows;

            // variables
            sum = 0;

            // loop through all rows
            for (position = pos_ori;
                 position < pos_ori + d_common.in2_pad_cumv_rows;
                 position = position + 1) {
                d_unique[bx].d_in2_pad_cumv[position] =
                    d_unique[bx].d_in2_pad_cumv[position] + sum;
                sum = d_unique[bx].d_in2_pad_cumv[position];
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        // printstate
        // if(ei_new == 10386  && bx == 21){
        // 		float fx =
        // d_unique[bx].d_in2_sub_cumh[ori_col*d_common.in2_sub_cumh_rows+ori_row];
        // 	  // float tt = temp2;
        // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx);
        // 		// int sa = d_common.in2_sub_cumh_rows;
        // 		// printf(" %d , %d , %d ", ori_col, ori_row, sa);
        // }

        __syncthreads();

        //====================================================================================================
        //	SELECTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_sel_elem) {

            // figure out row/col location in new matrix
            row =
                (ei_new + 1) % d_common.in2_pad_cumv_sel_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_pad_cumv_sel_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_pad_cumv_sel_rows == 0) {
                row = d_common.in2_pad_cumv_sel_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_pad_cumv_sel_rowlow - 1;
            ori_col = col + d_common.in2_pad_cumv_sel_collow - 1;
            d_unique[bx].d_in2_pad_cumv_sel[ei_new] =
                d_unique[bx]
                    .d_in2_pad_cumv[ori_col * d_common.in2_pad_cumv_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION 2, SUBTRACTION, HORIZONTAL CUMULATIVE SUM
        //====================================================================================================

        //==================================================
        //	SELECTION 2
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_elem) {

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in2_sub_cumh_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub_cumh_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub_cumh_rows == 0) {
                row = d_common.in2_sub_cumh_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_pad_cumv_sel2_rowlow - 1;
            ori_col = col + d_common.in2_pad_cumv_sel2_collow - 1;
            d_unique[bx].d_in2_sub_cumh[ei_new] =
                d_unique[bx]
                    .d_in2_pad_cumv[ori_col * d_common.in2_pad_cumv_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	SUBTRACTION
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_elem) {

            // subtract
            d_unique[bx].d_in2_sub_cumh[ei_new] =
                d_unique[bx].d_in2_pad_cumv_sel[ei_new] -
                d_unique[bx].d_in2_sub_cumh[ei_new];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	HORIZONTAL CUMULATIVE SUM
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_rows) {

            // figure out row position
            pos_ori = ei_new;

            // variables
            sum = 0;

            // loop through all rows
            for (position = pos_ori;
                 position < pos_ori + d_common.in2_sub_cumh_elem;
                 position = position + d_common.in2_sub_cumh_rows) {
                d_unique[bx].d_in2_sub_cumh[position] =
                    d_unique[bx].d_in2_sub_cumh[position] + sum;
                sum = d_unique[bx].d_in2_sub_cumh[position];
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_sel_elem) {

            // figure out row/col location in new matrix
            row =
                (ei_new + 1) % d_common.in2_sub_cumh_sel_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub_cumh_sel_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub_cumh_sel_rows == 0) {
                row = d_common.in2_sub_cumh_sel_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_sub_cumh_sel_rowlow - 1;
            ori_col = col + d_common.in2_sub_cumh_sel_collow - 1;
            d_unique[bx].d_in2_sub_cumh_sel[ei_new] =
                d_unique[bx]
                    .d_in2_sub_cumh[ori_col * d_common.in2_sub_cumh_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION 2, SUBTRACTION
        //====================================================================================================

        //==================================================
        //	SELECTION 2
        //==================================================

        // work
        ei_new = tx;
        // 17161
        while (ei_new < d_common.in2_sub2_elem) {

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in2_sub2_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub2_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub2_rows == 0) {
                row = d_common.in2_sub2_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_sub_cumh_sel2_rowlow - 1;
            ori_col = col + d_common.in2_sub_cumh_sel2_collow - 1;
            d_unique[bx].d_in2_sub2[ei_new] =
                d_unique[bx]
                    .d_in2_sub_cumh[ori_col * d_common.in2_sub_cumh_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	SUBTRACTION
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {

            // subtract
            d_unique[bx].d_in2_sub2[ei_new] =
                d_unique[bx].d_in2_sub_cumh_sel[ei_new] -
                d_unique[bx].d_in2_sub2[ei_new];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        //======================================================================================================================================================
        //	CUMULATIVE SUM 2
        //======================================================================================================================================================

        //====================================================================================================
        //	MULTIPLICATION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sqr_elem) {

            temp = d_unique[bx].d_in2[ei_new];
            d_unique[bx].d_in2_sqr[ei_new] = temp * temp;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	PAD ARRAY, VERTICAL CUMULATIVE SUM
        //====================================================================================================

        //==================================================
        //	PAD ARRAY
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_elem) {

            // figure out row/col location in padded array
            row = (ei_new + 1) % d_common.in2_pad_cumv_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_pad_cumv_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_pad_cumv_rows == 0) {
                row = d_common.in2_pad_cumv_rows - 1;
                col = col - 1;
            }

            // execution
            if (row > (d_common.in2_pad_add_rows -
                       1) && // do if has numbers in original array
                row < (d_common.in2_pad_add_rows + d_common.in2_sqr_rows) &&
                col > (d_common.in2_pad_add_cols - 1) &&
                col < (d_common.in2_pad_add_cols + d_common.in2_sqr_cols)) {
                ori_row = row - d_common.in2_pad_add_rows;
                ori_col = col - d_common.in2_pad_add_cols;
                d_unique[bx].d_in2_pad_cumv[ei_new] =
                    d_unique[bx]
                        .d_in2_sqr[ori_col * d_common.in2_sqr_rows + ori_row];
            } else { // do if otherwise
                d_unique[bx].d_in2_pad_cumv[ei_new] = 0;
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	VERTICAL CUMULATIVE SUM
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_cols) {

            // figure out column position
            pos_ori = ei_new * d_common.in2_pad_cumv_rows;

            // variables
            sum = 0;

            // loop through all rows
            for (position = pos_ori;
                 position < pos_ori + d_common.in2_pad_cumv_rows;
                 position = position + 1) {
                d_unique[bx].d_in2_pad_cumv[position] =
                    d_unique[bx].d_in2_pad_cumv[position] + sum;
                sum = d_unique[bx].d_in2_pad_cumv[position];
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_pad_cumv_sel_elem) {

            // figure out row/col location in new matrix
            row =
                (ei_new + 1) % d_common.in2_pad_cumv_sel_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_pad_cumv_sel_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_pad_cumv_sel_rows == 0) {
                row = d_common.in2_pad_cumv_sel_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_pad_cumv_sel_rowlow - 1;
            ori_col = col + d_common.in2_pad_cumv_sel_collow - 1;
            d_unique[bx].d_in2_pad_cumv_sel[ei_new] =
                d_unique[bx]
                    .d_in2_pad_cumv[ori_col * d_common.in2_pad_cumv_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION 2, SUBTRACTION, HORIZONTAL CUMULATIVE SUM
        //====================================================================================================

        //==================================================
        //	SELECTION 2
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_elem) {

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in2_sub_cumh_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub_cumh_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub_cumh_rows == 0) {
                row = d_common.in2_sub_cumh_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_pad_cumv_sel2_rowlow - 1;
            ori_col = col + d_common.in2_pad_cumv_sel2_collow - 1;
            d_unique[bx].d_in2_sub_cumh[ei_new] =
                d_unique[bx]
                    .d_in2_pad_cumv[ori_col * d_common.in2_pad_cumv_rows +
                                    ori_row];
            if (ei_new == 10386 && bx == 21) {
                float fx1 = d_unique[bx].d_in2_sub_cumh[ei_new];
                // float tt1 = d_unique[bx].d_in2_pad_cumv_sel[ei_new];
                // float ft1 = d_unique[bx].d_in2_sub_cumh[ei_new];
                printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx1);
                // int sa = d_common.in2_sub_cumh_rows;
                // printf(" %d , %d , %d ", ori_col, ori_row, sa);
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	SUBTRACTION
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_elem) {

            /// negative value
            // subtract
            // if(ei_new == 10386  && bx == 21){
            // 		float fx = 	d_unique[bx].d_in2_sub_cumh[ei_new];
            // 	  float tt = d_unique[bx].d_in2_pad_cumv_sel[ei_new];
            // 		float ft = d_unique[bx].d_in2_sub_cumh[ei_new];
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  %f %f \n",
            // fx, tt, ft);
            // 		// int sa = d_common.in2_sub_cumh_rows;
            // 		// printf(" %d , %d , %d ", ori_col, ori_row, sa);
            // }
            d_unique[bx].d_in2_sub_cumh[ei_new] =
                d_unique[bx].d_in2_pad_cumv_sel[ei_new] -
                d_unique[bx].d_in2_sub_cumh[ei_new];

            // d_unique[bx].d_in2_sqr_sub2[ei_new]
            // 0  317917  0
            // 317917.000000  317917.000000 317917.000000
            // 895295.000000
            // -577378.000000  317917.000000 -577378.000000
            // if(ei_new == 10386  && bx == 21){
            // 		float fx1 = 	d_unique[bx].d_in2_sub_cumh[ei_new];
            // 	  float tt1 = d_unique[bx].d_in2_pad_cumv_sel[ei_new];
            // 		float ft1 = d_unique[bx].d_in2_sub_cumh[ei_new];
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  %f %f \n",
            // fx1, tt1, ft1);
            // 		// int sa = d_common.in2_sub_cumh_rows;
            // 		// printf(" %d , %d , %d ", ori_col, ori_row, sa);
            // }
            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	HORIZONTAL CUMULATIVE SUM
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_rows) {

            // figure out row position
            pos_ori = ei_new;

            // variables
            sum = 0;

            // loop through all rows
            for (position = pos_ori;
                 position < pos_ori + d_common.in2_sub_cumh_elem;
                 position = position + d_common.in2_sub_cumh_rows) {
                d_unique[bx].d_in2_sub_cumh[position] =
                    d_unique[bx].d_in2_sub_cumh[position] + sum;
                sum = d_unique[bx].d_in2_sub_cumh[position];
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub_cumh_sel_elem) {

            // figure out row/col location in new matrix
            row =
                (ei_new + 1) % d_common.in2_sub_cumh_sel_rows - 1; // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub_cumh_sel_rows + 1 -
                  1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub_cumh_sel_rows == 0) {
                row = d_common.in2_sub_cumh_sel_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_sub_cumh_sel_rowlow - 1;
            ori_col = col + d_common.in2_sub_cumh_sel_collow - 1;
            d_unique[bx].d_in2_sub_cumh_sel[ei_new] =
                d_unique[bx]
                    .d_in2_sub_cumh[ori_col * d_common.in2_sub_cumh_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	SELECTION 2, SUBTRACTION
        //====================================================================================================

        //==================================================
        //	SELECTION 2
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {

            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in2_sub2_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in2_sub2_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in2_sub2_rows == 0) {
                row = d_common.in2_sub2_rows - 1;
                col = col - 1;
            }

            // figure out corresponding location in old matrix and copy values
            // to new matrix
            ori_row = row + d_common.in2_sub_cumh_sel2_rowlow - 1;
            ori_col = col + d_common.in2_sub_cumh_sel2_collow - 1;

            // if(ei_new == 10386  && bx == 21){
            // 		float fx =
            // d_unique[bx].d_in2_sub_cumh[ori_col*d_common.in2_sub_cumh_rows+ori_row];
            // 	  // float tt = temp2;
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx);
            // 		// int sa = d_common.in2_sub_cumh_rows;
            // 		// printf(" %d , %d , %d ", ori_col, ori_row, sa);
            // }

            // maybe this line here
            d_unique[bx].d_in2_sqr_sub2[ei_new] =
                d_unique[bx]
                    .d_in2_sub_cumh[ori_col * d_common.in2_sub_cumh_rows +
                                    ori_row];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //==================================================
        //	SYNCHRONIZE THREADS
        //==================================================

        __syncthreads();

        //==================================================
        //	SUBTRACTION
        //==================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {
            // 	if(ei_new == 10386  && bx == 21){
            // 		float fx =  d_unique[bx].d_in2_sqr_sub2[ei_new];
            // 	  // float tt = temp2;
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx);
            // }

            // subtract
            d_unique[bx].d_in2_sqr_sub2[ei_new] =
                d_unique[bx].d_in2_sub_cumh_sel[ei_new] -
                d_unique[bx].d_in2_sqr_sub2[ei_new];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        //======================================================================================================================================================
        //	FINAL
        //======================================================================================================================================================

        //====================================================================================================
        //	DENOMINATOR A		SAVE RESULT IN CUMULATIVE SUM A2
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {

            temp = d_unique[bx].d_in2_sub2[ei_new];
            // if(ei_new == 10386  && bx == 21){
            // 		float fx =  d_unique[bx].d_in2_sqr_sub2[ei_new];
            // 	  // float tt = temp2;
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f  \n", fx);
            // }
            // d_in2_sqr_sub2 is negative here for cpu

            temp2 = d_unique[bx].d_in2_sqr_sub2[ei_new] -
                    (temp * temp / d_common.in_elem);
            if (temp2 < 0) {
                temp2 = 0;
            }
            d_unique[bx].d_in2_sqr_sub2[ei_new] = sqrt(temp2);
            // temp2 = 0;
            // if(ei_new == 10386  && bx == 21){
            // 		float fx =  d_unique[bx].d_in2_sqr_sub2[ei_new];
            // 	  float tt = temp2;
            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f %f \n", fx,
            // tt);
            // }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	MULTIPLICATION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in_sqr_elem) {

            temp = d_in[ei_new];
            d_unique[bx].d_in_sqr[ei_new] = temp * temp;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	IN SUM
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in_cols) {

            sum = 0;
            for (i = 0; i < d_common.in_rows; i++) {

                sum = sum + d_in[ei_new * d_common.in_rows + i];
            }
            in_partial_sum[ei_new] = sum;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	IN_SQR SUM
        //====================================================================================================

        ei_new = tx;
        while (ei_new < d_common.in_sqr_rows) {

            sum = 0;
            for (i = 0; i < d_common.in_sqr_cols; i++) {

                sum = sum +
                      d_unique[bx].d_in_sqr[ei_new + d_common.in_sqr_rows * i];
            }
            in_sqr_partial_sum[ei_new] = sum;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	FINAL SUMMATION
        //====================================================================================================

        if (tx == 0) {

            in_final_sum = 0;
            for (i = 0; i < d_common.in_cols; i++) {
                in_final_sum = in_final_sum + in_partial_sum[i];
            }

        } else if (tx == 1) {

            in_sqr_final_sum = 0;
            for (i = 0; i < d_common.in_sqr_cols; i++) {
                in_sqr_final_sum = in_sqr_final_sum + in_sqr_partial_sum[i];
            }
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	DENOMINATOR T
        //====================================================================================================

        if (tx == 0) {

            mean =
                in_final_sum /
                d_common.in_elem; // gets mean (average) value of element in ROI
            mean_sqr = mean * mean;
            variance = (in_sqr_final_sum / d_common.in_elem) -
                       mean_sqr;        // gets variance of ROI
            deviation = sqrt(variance); // gets standard deviation of ROI

            denomT = sqrt(float(d_common.in_elem - 1)) * deviation;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	DENOMINATOR		SAVE RESULT IN CUMULATIVE SUM A2
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {

            d_unique[bx].d_in2_sqr_sub2[ei_new] =
                d_unique[bx].d_in2_sqr_sub2[ei_new] * denomT;
            // 	if(ei_new == 10386  && bx == 21){
            // 		float fx =  d_unique[bx].d_in2_sqr_sub2[ei_new];

            // 	  printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f %f \n", fx,
            // dt);
            // }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	NUMERATOR	SAVE RESULT IN CONVOLUTION
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.conv_elem) {

            d_unique[bx].d_conv[ei_new] = d_unique[bx].d_conv[ei_new] -
                                          d_unique[bx].d_in2_sub2[ei_new] *
                                              in_final_sum / d_common.in_elem;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	CORRELATION	SAVE RESULT IN CUMULATIVE SUM A2
        //====================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.in2_sub2_elem) {

            // printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f \n",
            // d_unique[bx].d_in2_sqr_sub2[ei_new]); if
            // (d_unique[bx].d_in2_sqr_sub2[ei_new] == 0) { 	printf(" bx: %d
            // ei_new %d \n", bx, ei_new);
            // }
            // if(ei_new == 10386  && bx == 21){
            // 	printf(" d_unique[bx].d_in2_sqr_sub2[ei_new] %f \n",
            // d_unique[bx].d_in2_sqr_sub2[ei_new]);

            // }
            // cpu has a divide by 0
            d_unique[bx].d_in2_sqr_sub2[ei_new] =
                d_unique[bx].d_conv[ei_new] /
                d_unique[bx].d_in2_sqr_sub2[ei_new];

            // printf("  d_unique[bx].d_conv[ei_new] , ", )
            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        //======================================================================================================================================================
        //	TEMPLATE MASK CREATE
        //======================================================================================================================================================

        cent = d_common.sSize + d_common.tSize + 1;
        if (d_common_change.frame_no == 0) {
            tMask_row = cent + d_unique[bx].d_Row[d_unique[bx].point_no] -
                        d_unique[bx].d_Row[d_unique[bx].point_no] - 1;
            tMask_col = cent + d_unique[bx].d_Col[d_unique[bx].point_no] -
                        d_unique[bx].d_Col[d_unique[bx].point_no] - 1;
        } else {
            pointer = d_common_change.frame_no - 1 +
                      d_unique[bx].point_no * d_common.no_frames;
            tMask_row = cent + d_unique[bx].d_tRowLoc[pointer] -
                        d_unique[bx].d_Row[d_unique[bx].point_no] - 1;
            tMask_col = cent + d_unique[bx].d_tColLoc[pointer] -
                        d_unique[bx].d_Col[d_unique[bx].point_no] - 1;
        }

        // work
        ei_new = tx;
        while (ei_new < d_common.tMask_elem) {

            location = tMask_col * d_common.tMask_rows + tMask_row;

            if (ei_new == location) {
                d_unique[bx].d_tMask[ei_new] = 1;
            } else {
                d_unique[bx].d_tMask[ei_new] = 0;
            }

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        //======================================================================================================================================================
        //	MASK CONVOLUTION
        //======================================================================================================================================================

        // work
        ei_new = tx;
        while (ei_new < d_common.mask_conv_elem) {

            // figure out row/col location in array
            ic = (ei_new + 1) % d_common.mask_conv_rows;     // (1-n)
            jc = (ei_new + 1) / d_common.mask_conv_rows + 1; // (1-n)
            if ((ei_new + 1) % d_common.mask_conv_rows == 0) {
                ic = d_common.mask_conv_rows;
                jc = jc - 1;
            }

            //
            j = jc + d_common.mask_conv_joffset;
            jp1 = j + 1;
            if (d_common.mask_cols < jp1) {
                ja1 = jp1 - d_common.mask_cols;
            } else {
                ja1 = 1;
            }
            if (d_common.tMask_cols < j) {
                ja2 = d_common.tMask_cols;
            } else {
                ja2 = j;
            }

            i = ic + d_common.mask_conv_ioffset;
            ip1 = i + 1;

            if (d_common.mask_rows < ip1) {
                ia1 = ip1 - d_common.mask_rows;
            } else {
                ia1 = 1;
            }
            if (d_common.tMask_rows < i) {
                ia2 = d_common.tMask_rows;
            } else {
                ia2 = i;
            }

            s = 0;

            for (ja = ja1; ja <= ja2; ja++) {
                jb = jp1 - ja;
                for (ia = ia1; ia <= ia2; ia++) {
                    ib = ip1 - ia;
                    s = s +
                        d_unique[bx].d_tMask[d_common.tMask_rows * (ja - 1) +
                                             ia - 1] *
                            1;
                }
            }

            // //d_unique[bx].d_mask_conv[d_common.mask_conv_rows*(jc-1)+ic-1] =
            // s;
            d_unique[bx].d_mask_conv[ei_new] =
                d_unique[bx].d_in2_sqr_sub2[ei_new] * s;
            float xs = s;
            // s ===1 if not 0
            if (xs != 0) {

                // printf(" %.0Lf \n", d_unique[bx].d_in2_sqr_sub2[ei_new]);
            }
            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        //======================================================================================================================================================
        //	MAXIMUM VALUE
        //======================================================================================================================================================

        //====================================================================================================
        //	INITIAL SEARCH
        //====================================================================================================
        __syncthreads();

        // if(bx == 0 && tx == 0) {

        // d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row];
        int nextline = 0;
        // for(int blockz = 0; blockz < 51; blockz++) {
        ei_new = tx; // threadidx
        // d_common.mask_conv_rows = 131
        while (ei_new < d_common.mask_conv_rows) {

            for (int i = 0; i < d_common.mask_conv_cols; i++) {
                int lcc = ei_new * d_common.mask_conv_rows + i;
                if (d_unique[bx].d_mask_conv[lcc] != 0) {
                    if (d_unique[bx].d_mask_conv[lcc] > 0.808) {
                        // int fa = (int)(d_unique[bx].d_mask_conv[lcc]  << 4);
                        // printf("bx %d, ei_new %d , lcc %d  v  %lf , %d\n  " ,
                        // bx, ei_new, lcc,d_unique[bx].d_mask_conv[lcc], fa);
                    }
                }
            }
            ei_new = ei_new + NUMBER_THREADS;
            // printf("%d, NUMBER_THREADS \n", NUMBER_THREADS);
        }

        // for(int threadz = 0; threadz < 6551 ; threadz++) {
        // 	// printf(" bx: %d  ei_new### %d   d_unique[bx].d_in2[ei_new] %f
        // \n",blockz, threadz, d_unique[blockz].d_in2[threadz]);
        // }
        // }
        // }

        __syncthreads();

        // largest _coordinate check
        ei_new = tx;
        while (ei_new < d_common.mask_conv_rows) {

            for (i = 0; i < d_common.mask_conv_cols; i++) {
                largest_coordinate_current =
                    ei_new * d_common.mask_conv_rows + i;

                if (d_unique[bx].d_mask_conv[largest_coordinate_current] < 0) {
                    largest_value_current =
                        d_unique[bx].d_mask_conv[largest_coordinate_current] *
                        -1;
                } else {
                    if (d_unique[bx].d_mask_conv[largest_coordinate_current] ==
                        0) {
                        d_unique[bx].d_mask_conv[largest_coordinate_current] =
                            0;
                    } else {
                        largest_value_current =
                            d_unique[bx]
                                .d_mask_conv[largest_coordinate_current];
                    }
                }

                // printf("bx %d, ei_new %d   d_unique[bx] %f  l %f \n", bx,
                // ei_new ,
                // d_unique[bx].d_mask_conv[largest_coordinate_current],
                // largest_value_current);

                if (largest_value_current > largest_value) {
                    largest_coordinate = largest_coordinate_current;
                    largest_value = largest_value_current;
                }
            }
            /*
                    bx, 25 tx 60, largest_value, 0.893821 , 7926
                    bx, 25 tx 61, largest_value, 0.915945 , 8057
                    bx, 25 tx 62, largest_value, 0.941748 , 8187
                    bx, 25 tx 63, largest_value, 0.969220 , 8318

                    bx, 24 tx 60, largest_value, 0.892937 , 7926
                    bx, 24 tx 61, largest_value, 0.907867 , 8057
                    bx, 24 tx 62, largest_value, 0.925148 , 8187
                    bx, 24 tx 63, largest_value, 0.949295 , 8318
                    bx, 0 tx 64, largest_value, 0.778192 , 8449
                    bx, 0 tx 65, largest_value, 0.812116 , 8580
                    bx, 0 tx 66, largest_value, 0.778811 , 8711
                    bx, 0 tx 67, largest_value, 0.707729 , 8842
                    bx, 0 tx 68, largest_value, 0.631595 , 8973
                    bx, 0 tx 69, largest_value, 0.580690 , 9103
            */
            // printf("bx, %d tx %d, largest_value, %0.3f , %d \n ", bx, tx,
            // largest_value, largest_coordinate);

            par_max_coo[ei_new] = largest_coordinate;
            par_max_val[ei_new] = largest_value;

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }

        //====================================================================================================
        //	SYNCHRONIZE THREADS
        //====================================================================================================

        __syncthreads();

        //====================================================================================================
        //	FINAL SEARCH
        //====================================================================================================

        if (tx == 0) {
            // fin_max_val == inf

            for (int i = 0; i < d_common.mask_conv_rows; i++) {
                if (par_max_val[i] > fin_max_val) {
                    fin_max_val = par_max_val[i];
                    fin_max_coo = par_max_coo[i];
                }
                float xval = fin_max_val;
                // printf("bx: %d  i: %d  , %d , %f \n", bx, i, fin_max_coo,
                // xval);
            }

            // convert coordinate to row/col form
            largest_row =
                (fin_max_coo + 1) % d_common.mask_conv_rows - 1; // (0-n) row
            largest_col =
                (fin_max_coo + 1) / d_common.mask_conv_rows; // (0-n) column
            if ((fin_max_coo + 1) % d_common.mask_conv_rows == 0) {
                largest_row = d_common.mask_conv_rows - 1;
                largest_col = largest_col - 1;
            }

            // calculate offset
            largest_row =
                largest_row + 1; // compensate to match MATLAB format (1-n)
            largest_col =
                largest_col + 1; // compensate to match MATLAB format (1-n)
            offset_row = largest_row - d_common.in_rows -
                         (d_common.sSize - d_common.tSize);
            offset_col = largest_col - d_common.in_cols -
                         (d_common.sSize - d_common.tSize);
            pointer = d_common_change.frame_no +
                      d_unique[bx].point_no * d_common.no_frames;
            d_unique[bx].d_tRowLoc[pointer] =
                d_unique[bx].d_Row[d_unique[bx].point_no] + offset_row;
            d_unique[bx].d_tColLoc[pointer] =
                d_unique[bx].d_Col[d_unique[bx].point_no] + offset_col;

            int dcinrows = d_common.in_rows;
            int dcssize = d_common.sSize;
            int dctsize = d_common.tSize;

            // largest row  and largest col and offset_row
            // printf(" bx: %d  pointer %d   d_unique[bx].d_tRowLoc[pointer] %d
            // ,  %d, offset %d,  largest_row %d, d_common.in_rows %d,
            // d_common.sSize %d, d_common.tSize %d \n", bx, pointer,
            // d_unique[bx].d_tRowLoc[pointer],
            // d_unique[bx].d_Row[d_unique[bx].point_no] , offset_row,
            // largest_row, dcinrows, dcssize , dctsize);
        }

        //======================================================================================================================================================
        //	SYNCHRONIZE THREADS
        //======================================================================================================================================================

        __syncthreads();

        // check end

        // if(bx == 0 && tx == 0) {

        // 	// d_unique[bx].d_in2[ei_new] =
        // d_common_change.d_frame[ori_col*d_common.frame_rows+ori_row]; 	int
        // nextline = 0; 	for(int blockz = 0; blockz < 51; blockz++) {
        // 		// for(int threadz = 0; threadz < 6551 ; threadz++) {

        // 			int poi = 1 + d_unique[blockz].point_no
        // *d_common.no_frames;

        // 			printf(" bx: %d  poi %d   d_unique[bx].d_tRowLoc[poi]
        // %d \n",blockz, poi, d_unique[blockz].d_tRowLoc[poi] );
        // 		// }
        // 	}
        // }

        __syncthreads();
    }

    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================
    //	COORDINATE AND TEMPLATE UPDATE
    //===============================================================================================================================================================================================================
    //===============================================================================================================================================================================================================

    // time19 = clock();

    // if the last frame in the bath, update template
    if (d_common_change.frame_no != 0 && (d_common_change.frame_no) % 10 == 0) {
        // update coordinate
        loc_pointer = d_unique[bx].point_no * d_common.no_frames +
                      d_common_change.frame_no;
        d_unique[bx].d_Row[d_unique[bx].point_no] =
            d_unique[bx].d_tRowLoc[loc_pointer];
        d_unique[bx].d_Col[d_unique[bx].point_no] =
            d_unique[bx].d_tColLoc[loc_pointer];

        // work
        ei_new = tx;
        while (ei_new < d_common.in_elem) {
            // figure out row/col location in new matrix
            row = (ei_new + 1) % d_common.in_rows - 1;     // (0-n) row
            col = (ei_new + 1) / d_common.in_rows + 1 - 1; // (0-n) column
            if ((ei_new + 1) % d_common.in_rows == 0) {
                row = d_common.in_rows - 1;
                col = col - 1;
            }

            // figure out row/col location in corresponding new template area in
            // image and give to every thread (get top left corner and progress
            // down and right)
            ori_row = d_unique[bx].d_Row[d_unique[bx].point_no] - 25 + row - 1;
            ori_col = d_unique[bx].d_Col[d_unique[bx].point_no] - 25 + col - 1;
            ori_pointer = ori_col * d_common.frame_rows + ori_row;

            // update template
            d_in[ei_new] =
                d_common.alpha * d_in[ei_new] +
                (1.00 - d_common.alpha) * d_common_change.d_frame[ori_pointer];

            // go for second round
            ei_new = ei_new + NUMBER_THREADS;
        }
    }
}

//===============================================================================================================================================================================================================
//===============================================================================================================================================================================================================
//	END OF FUNCTION
//===============================================================================================================================================================================================================
//===============================================================================================================================================================================================================
