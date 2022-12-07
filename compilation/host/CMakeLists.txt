cmake_minimum_required(VERSION 3.1)

# C project
project(
  cupbop-amd-host
  DESCRIPTION
    "Manipulate CUDA host to compitable AMD GPU runtime "
  LANGUAGES CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(LIB_NAME cupbop-amd-host)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Debug)
find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})


file(GLOB proj_HEADERS "include/*.h")
file(GLOB proj_SOURCES "src/*.cpp")


set(GCC_COVERAGE_LINK_FLAGS
    "-L${LLVM_LIB_PATH} ${LLVM_LINK_FLAG} -lz -lrt -ldl -ltinfo -lpthread -lm")

# Add core library.
add_library(${LIB_NAME} SHARED ${proj_HEADERS} ${proj_SOURCES})
