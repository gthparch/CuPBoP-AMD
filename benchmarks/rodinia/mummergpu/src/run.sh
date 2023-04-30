

#  ./mummergpu.cupbop ../../rodinia-data/mummergpu/NC_003997.fna ../../rodinia-data/mummergpu/NC_003997_q100bp.fna > NC_00399_cuda.out

# ./mummergpu.hipify ../../rodinia-data/mummergpu/NC_003997.fna ../../rodinia-data/mummergpu/NC_003997_q100bp.fna > NC_00399_hip.out

# ./mummergpu.cupbop -l 2 ../data/shortref.fa ../data/shortqry.fa > alignments.mummergpu
#  
# ./mummergpu.hipify -l 2 ../data/shortref.fa ../data/shortqry.fa > alignments.mummergpu