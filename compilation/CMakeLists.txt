cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
project(
  AMDCompilation
  DESCRIPTION "Compilation Translation to AMDKernel"
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME AMDCompilation)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Debug)
find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

llvm_map_components_to_libnames(llvm_libs support core irreader passes analysis)


set(GCC_COVERAGE_LINK_FLAGS
    "-L${LLVM_LIB_PATH} ${LLVM_LINK_FLAG} -lz -lrt -ldl -lpthread -lm")

include_directories(./kernel/include/)
add_subdirectory(kernel)
include_directories(./host/include/)
add_subdirectory(host)


add_executable(kernelTranslator KernelTranslation.cpp)
add_executable(hostTranslator HostTranslation.cpp)


target_link_libraries(kernelTranslator cupbop-amd-kernel ${llvm_libs}
                      ${GCC_COVERAGE_LINK_FLAGS})

target_link_libraries(hostTranslator cupbop-amd-host ${llvm_libs}
                      ${GCC_COVERAGE_LINK_FLAGS})