cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  cupbop-amd
  DESCRIPTION "Translate NVVM IR to LLVM IR for AMD"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)

llvm_map_components_to_libnames(LLVM_LIBS support core bitreader bitwriter irreader)

add_subdirectory(kernel)
add_executable(cupbop-amd main.cpp)
target_link_libraries(cupbop-amd cupbop-amd-kernel ${LLVM_LIBS})
