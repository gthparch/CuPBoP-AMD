// includes, system
#include "srad.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// includes, project
#include <cuda.h>

// includes, kernels
__global__ void srad_cuda_1(float *E_C, float *W_C, float *N_C, float *S_C,
                            float *J_cuda, float *C_cuda, int cols, int rows,
                            float q0sqr) {

    // block id
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // thread id
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // indices
    int index = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + tx;
    int index_n = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + tx - cols;
    int index_s =
        cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE + tx;
    int index_w = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty - 1;
    int index_e =
        cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;

    float n, w, e, s, jc, g2, l, num, den, qsqr, c;

    // shared memory allocation
    __shared__ float temp[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float temp_result[BLOCK_SIZE][BLOCK_SIZE];

    __shared__ float north[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float south[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float east[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float west[BLOCK_SIZE][BLOCK_SIZE];

    // load data to shared memory
    north[ty][tx] = J_cuda[index_n];
    south[ty][tx] = J_cuda[index_s];
    if (by == 0) {
        north[ty][tx] = J_cuda[BLOCK_SIZE * bx + tx];
    } else if (by == gridDim.y - 1) {
        south[ty][tx] = J_cuda[cols * BLOCK_SIZE * (gridDim.y - 1) +
                               BLOCK_SIZE * bx + cols * (BLOCK_SIZE - 1) + tx];
    }
    __syncthreads();

    west[ty][tx] = J_cuda[index_w];
    east[ty][tx] = J_cuda[index_e];

    if (bx == 0) {
        west[ty][tx] = J_cuda[cols * BLOCK_SIZE * by + cols * ty];
    } else if (bx == gridDim.x - 1) {
        east[ty][tx] =
            J_cuda[cols * BLOCK_SIZE * by + BLOCK_SIZE * (gridDim.x - 1) +
                   cols * ty + BLOCK_SIZE - 1];
    }

    __syncthreads();

    temp[ty][tx] = J_cuda[index];

    __syncthreads();

    jc = temp[ty][tx];

    if (ty == 0 && tx == 0) { // nw
        n = north[ty][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = west[ty][tx] - jc;
        e = temp[ty][tx + 1] - jc;
    } else if (ty == 0 && tx == BLOCK_SIZE - 1) { // ne
        n = north[ty][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = east[ty][tx] - jc;
    } else if (ty == BLOCK_SIZE - 1 && tx == BLOCK_SIZE - 1) { // se
        n = temp[ty - 1][tx] - jc;
        s = south[ty][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = east[ty][tx] - jc;
    } else if (ty == BLOCK_SIZE - 1 && tx == 0) { // sw
        n = temp[ty - 1][tx] - jc;
        s = south[ty][tx] - jc;
        w = west[ty][tx] - jc;
        e = temp[ty][tx + 1] - jc;
    }

    else if (ty == 0) { // n
        n = north[ty][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = temp[ty][tx + 1] - jc;
    } else if (tx == BLOCK_SIZE - 1) { // e
        n = temp[ty - 1][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = east[ty][tx] - jc;
    } else if (ty == BLOCK_SIZE - 1) { // s
        n = temp[ty - 1][tx] - jc;
        s = south[ty][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = temp[ty][tx + 1] - jc;
    } else if (tx == 0) { // w
        n = temp[ty - 1][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = west[ty][tx] - jc;
        e = temp[ty][tx + 1] - jc;
    } else { // the data elements which are not on the borders
        n = temp[ty - 1][tx] - jc;
        s = temp[ty + 1][tx] - jc;
        w = temp[ty][tx - 1] - jc;
        e = temp[ty][tx + 1] - jc;
    }

    g2 = (n * n + s * s + w * w + e * e) / (jc * jc);

    l = (n + s + w + e) / jc;

    num = (0.5 * g2) - ((1.0 / 16.0) * (l * l));
    den = 1 + (.25 * l);
    qsqr = num / (den * den);

    // diffusion coefficent (equ 33)
    den = (qsqr - q0sqr) / (q0sqr * (1 + q0sqr));
    c = 1.0 / (1.0 + den);

    // saturate diffusion coefficent
    if (c < 0) {
        temp_result[ty][tx] = 0;
    } else if (c > 1) {
        temp_result[ty][tx] = 1;
    } else {
        temp_result[ty][tx] = c;
    }

    __syncthreads();

    C_cuda[index] = temp_result[ty][tx];
    E_C[index] = e;
    W_C[index] = w;
    S_C[index] = s;
    N_C[index] = n;
}

__global__ void srad_cuda_2(float *E_C, float *W_C, float *N_C, float *S_C,
                            float *J_cuda, float *C_cuda, int cols, int rows,
                            float lambda, float q0sqr) {
    // block id
    int bx = blockIdx.x;
    int by = blockIdx.y;

    // thread id
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // indices
    int index = cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + tx;
    int index_s =
        cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * BLOCK_SIZE + tx;
    int index_e =
        cols * BLOCK_SIZE * by + BLOCK_SIZE * bx + cols * ty + BLOCK_SIZE;
    float cc, cn, cs, ce, cw, d_sum;

    // shared memory allocation
    __shared__ float south_c[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float east_c[BLOCK_SIZE][BLOCK_SIZE];

    __shared__ float c_cuda_temp[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float c_cuda_result[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ float temp[BLOCK_SIZE][BLOCK_SIZE];

    // load data to shared memory
    temp[ty][tx] = J_cuda[index];

    __syncthreads();

    south_c[ty][tx] = C_cuda[index_s];

    if (by == gridDim.y - 1) {
        south_c[ty][tx] =
            C_cuda[cols * BLOCK_SIZE * (gridDim.y - 1) + BLOCK_SIZE * bx +
                   cols * (BLOCK_SIZE - 1) + tx];
    }
    __syncthreads();

    east_c[ty][tx] = C_cuda[index_e];

    if (bx == gridDim.x - 1) {
        east_c[ty][tx] =
            C_cuda[cols * BLOCK_SIZE * by + BLOCK_SIZE * (gridDim.x - 1) +
                   cols * ty + BLOCK_SIZE - 1];
    }

    __syncthreads();

    c_cuda_temp[ty][tx] = C_cuda[index];

    __syncthreads();

    cc = c_cuda_temp[ty][tx];

    if (ty == BLOCK_SIZE - 1 && tx == BLOCK_SIZE - 1) { // se
        cn = cc;
        cs = south_c[ty][tx];
        cw = cc;
        ce = east_c[ty][tx];
    } else if (tx == BLOCK_SIZE - 1) { // e
        cn = cc;
        cs = c_cuda_temp[ty + 1][tx];
        cw = cc;
        ce = east_c[ty][tx];
    } else if (ty == BLOCK_SIZE - 1) { // s
        cn = cc;
        cs = south_c[ty][tx];
        cw = cc;
        ce = c_cuda_temp[ty][tx + 1];
    } else { // the data elements which are not on the borders
        cn = cc;
        cs = c_cuda_temp[ty + 1][tx];
        cw = cc;
        ce = c_cuda_temp[ty][tx + 1];
    }

    // divergence (equ 58)
    d_sum =
        cn * N_C[index] + cs * S_C[index] + cw * W_C[index] + ce * E_C[index];

    // image update (equ 61)
    c_cuda_result[ty][tx] = temp[ty][tx] + 0.25 * lambda * d_sum;

    __syncthreads();

    J_cuda[index] = c_cuda_result[ty][tx];
}

void random_matrix(float *I, int rows, int cols);
void runTest(int argc, char **argv);
void usage(int argc, char **argv) {
    fprintf(
        stderr,
        "Usage: %s <rows> <cols> <y1> <y2> <x1> <x2> <lamda> <no. of iter>\n",
        argv[0]);
    fprintf(stderr, "\t<rows>   - number of rows\n");
    fprintf(stderr, "\t<cols>    - number of cols\n");
    fprintf(stderr, "\t<y1> 	 - y1 value of the speckle\n");
    fprintf(stderr, "\t<y2>      - y2 value of the speckle\n");
    fprintf(stderr, "\t<x1>       - x1 value of the speckle\n");
    fprintf(stderr, "\t<x2>       - x2 value of the speckle\n");
    fprintf(stderr, "\t<lamda>   - lambda (0,1)\n");
    fprintf(stderr, "\t<no. of iter>   - number of iterations\n");

    exit(1);
}
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {
    printf("WG size of kernel = %d X %d\n", BLOCK_SIZE, BLOCK_SIZE);
    runTest(argc, argv);

    return EXIT_SUCCESS;
}

void runTest(int argc, char **argv) {
    int rows, cols, size_I, size_R, niter = 10, iter;
    float *I, *J, lambda, q0sqr, sum, sum2, tmp, meanROI, varROI;

#ifdef CPU
    float Jc, G2, L, num, den, qsqr;
    int *iN, *iS, *jE, *jW, k;
    float *dN, *dS, *dW, *dE;
    float cN, cS, cW, cE, D;
#endif

#ifdef GPU

    float *J_cuda;
    float *C_cuda;
    float *E_C, *W_C, *N_C, *S_C;

#endif

    unsigned int r1, r2, c1, c2;
    float *c;

    if (argc == 9) {
        rows = atoi(argv[1]); // number of rows in the domain
        cols = atoi(argv[2]); // number of cols in the domain
        if ((rows % 16 != 0) || (cols % 16 != 0)) {
            fprintf(stderr, "rows and cols must be multiples of 16\n");
            exit(1);
        }
        r1 = atoi(argv[3]);     // y1 position of the speckle
        r2 = atoi(argv[4]);     // y2 position of the speckle
        c1 = atoi(argv[5]);     // x1 position of the speckle
        c2 = atoi(argv[6]);     // x2 position of the speckle
        lambda = atof(argv[7]); // Lambda value
        niter = atoi(argv[8]);  // number of iterations

    } else {
        usage(argc, argv);
    }

    size_I = cols * rows;
    size_R = (r2 - r1 + 1) * (c2 - c1 + 1);

    I = (float *)malloc(size_I * sizeof(float));
    J = (float *)malloc(size_I * sizeof(float));
    c = (float *)malloc(sizeof(float) * size_I);

#ifdef CPU

    iN = (int *)malloc(sizeof(unsigned int *) * rows);
    iS = (int *)malloc(sizeof(unsigned int *) * rows);
    jW = (int *)malloc(sizeof(unsigned int *) * cols);
    jE = (int *)malloc(sizeof(unsigned int *) * cols);

    dN = (float *)malloc(sizeof(float) * size_I);
    dS = (float *)malloc(sizeof(float) * size_I);
    dW = (float *)malloc(sizeof(float) * size_I);
    dE = (float *)malloc(sizeof(float) * size_I);

    for (int i = 0; i < rows; i++) {
        iN[i] = i - 1;
        iS[i] = i + 1;
    }
    for (int j = 0; j < cols; j++) {
        jW[j] = j - 1;
        jE[j] = j + 1;
    }
    iN[0] = 0;
    iS[rows - 1] = rows - 1;
    jW[0] = 0;
    jE[cols - 1] = cols - 1;

#endif

#ifdef GPU

    // Allocate device memory
    cudaMalloc((void **)&J_cuda, sizeof(float) * size_I);
    cudaMalloc((void **)&C_cuda, sizeof(float) * size_I);
    cudaMalloc((void **)&E_C, sizeof(float) * size_I);
    cudaMalloc((void **)&W_C, sizeof(float) * size_I);
    cudaMalloc((void **)&S_C, sizeof(float) * size_I);
    cudaMalloc((void **)&N_C, sizeof(float) * size_I);

#endif

    printf("Randomizing the input matrix\n");
    // Generate a random matrix
    random_matrix(I, rows, cols);

    for (int k = 0; k < size_I; k++) {
        J[k] = (float)exp(I[k]);
    }
    printf("Start the SRAD main loop\n");
    for (iter = 0; iter < niter; iter++) {
        sum = 0;
        sum2 = 0;
        for (int i = r1; i <= r2; i++) {
            for (int j = c1; j <= c2; j++) {
                tmp = J[i * cols + j];
                sum += tmp;
                sum2 += tmp * tmp;
            }
        }
        meanROI = sum / size_R;
        varROI = (sum2 / size_R) - meanROI * meanROI;
        q0sqr = varROI / (meanROI * meanROI);

#ifdef CPU

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {

                k = i * cols + j;
                Jc = J[k];

                // directional derivates
                dN[k] = J[iN[i] * cols + j] - Jc;
                dS[k] = J[iS[i] * cols + j] - Jc;
                dW[k] = J[i * cols + jW[j]] - Jc;
                dE[k] = J[i * cols + jE[j]] - Jc;

                G2 = (dN[k] * dN[k] + dS[k] * dS[k] + dW[k] * dW[k] +
                      dE[k] * dE[k]) /
                     (Jc * Jc);

                L = (dN[k] + dS[k] + dW[k] + dE[k]) / Jc;

                num = (0.5 * G2) - ((1.0 / 16.0) * (L * L));
                den = 1 + (.25 * L);
                qsqr = num / (den * den);

                // diffusion coefficent (equ 33)
                den = (qsqr - q0sqr) / (q0sqr * (1 + q0sqr));
                c[k] = 1.0 / (1.0 + den);

                // saturate diffusion coefficent
                if (c[k] < 0) {
                    c[k] = 0;
                } else if (c[k] > 1) {
                    c[k] = 1;
                }
            }
        }
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {

                // current index
                k = i * cols + j;

                // diffusion coefficent
                cN = c[k];
                cS = c[iS[i] * cols + j];
                cW = c[k];
                cE = c[i * cols + jE[j]];

                // divergence (equ 58)
                D = cN * dN[k] + cS * dS[k] + cW * dW[k] + cE * dE[k];

                // image update (equ 61)
                J[k] = J[k] + 0.25 * lambda * D;
            }
        }

#endif // CPU

#ifdef GPU

        // Currently the input size must be divided by 16 - the block size
        int block_x = cols / BLOCK_SIZE;
        int block_y = rows / BLOCK_SIZE;

        dim3 dimBlock(BLOCK_SIZE, BLOCK_SIZE);
        dim3 dimGrid(block_x, block_y);

        // Copy data from main memory to device memory
        cudaMemcpy(J_cuda, J, sizeof(float) * size_I, cudaMemcpyHostToDevice);

        // Run kernels
        srad_cuda_1<<<dimGrid, dimBlock>>>(E_C, W_C, N_C, S_C, J_cuda, C_cuda,
                                           cols, rows, q0sqr);
        srad_cuda_2<<<dimGrid, dimBlock>>>(E_C, W_C, N_C, S_C, J_cuda, C_cuda,
                                           cols, rows, lambda, q0sqr);

        // Copy data from device memory to main memory
        cudaMemcpy(J, J_cuda, sizeof(float) * size_I, cudaMemcpyDeviceToHost);

#endif
    }

    cudaThreadSynchronize();

#ifdef OUTPUT
    // Printing output
    printf("Printing Output:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%.5f ", J[i * cols + j]);
        }
        printf("\n");
    }
#endif

    printf("Computation Done\n");

    free(I);
    free(J);
#ifdef CPU
    free(iN);
    free(iS);
    free(jW);
    free(jE);
    free(dN);
    free(dS);
    free(dW);
    free(dE);
#endif
#ifdef GPU
    cudaFree(C_cuda);
    cudaFree(J_cuda);
    cudaFree(E_C);
    cudaFree(W_C);
    cudaFree(N_C);
    cudaFree(S_C);
#endif
    free(c);
}

void random_matrix(float *I, int rows, int cols) {

    srand(7);

    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            I[i * cols + j] = rand() / (float)RAND_MAX;
        }
    }
}
