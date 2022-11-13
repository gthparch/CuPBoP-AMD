cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  AMDCompilation
  DESCRIPTION "Compilation Translation to AMDKernel"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME AMDCompilation)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_TYPE Debug)
find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

include_directories(./include)

add_subdirectory(kernel)

add_executable(kernelTranslator KernelTranslation.cpp)

target_link_libraries(kernelTranslator cupbop-amd-kernel
                      ${GCC_COVERAGE_LINK_FLAGS})