## CuPBoP-AMD Benchmarks

### Rodinia GPU

| Name | Working | Notes |
| ---- | ------- | ----- |
| B+Tree | :heavy_check_mark: ||
| B+Tree21 | :heavy_check_mark: ||
| backprop | :heavy_check_mark: ||
| bfs | :heavy_check_mark: ||
| cfd | :heavy_check_mark: ||
| dwt2d | :heavy_check_mark: ||
| gaussian | :heavy_check_mark: | Slow comparing to HIPIFY version. Requires further investigation. |
| heartwall | :heavy_check_mark: ||
| hotspot | :heavy_check_mark: ||
| hotspot3D | :heavy_check_mark: ||
| huffman | :x: | [WIP] Compiles with both CuPBoP-AMD and HIPIFY. Both produce mismatched vectors. |
| kmeans | :heavy_check_mark: | size *offset = NULL segfaults with HIPAMD but not CUDA |
| leukocyte | :heavy_check_mark: ||
| nn | :heavy_check_mark: | Nearest Neighbor |
| nw | :heavy_check_mark: ||
| particlefilter-float | :heavy_check_mark: ||
| particlefilter-naive | :heavy_check_mark: ||
| pathfinder | :x: ||
| srad-v2 | :x: | [WIP] Compiles with both CuPBoP-AMD and HIPIFY. Both segfaults. |
| streamcluster | :heavy_check_mark: ||
