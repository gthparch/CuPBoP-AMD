cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CudaOnAMD)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA on AMD architecture.")
set(CMAKE_CXX_STANDARD "17")
set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(VERSION_STRING ${MAJOR_VERSION}.${MINOR_VERSION})
set(CMAKE_VERBOSE_MAKEFILE on)

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

include_directories(include)
add_subdirectory(compilation)
add_subdirectory(runtime)

