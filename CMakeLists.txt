cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CudaOnAMD)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA on AMD architecture.")
set(CMAKE_CXX_STANDARD "14")
set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(VERSION_STRING ${MAJOR_VERSION}.${MINOR_VERSION})
set(CMAKE_VERBOSE_MAKEFILE on)
if(DEFINED LLVM_CONFIG_PATH)
  if(IS_ABSOLUTE "${LLVM_CONFIG_PATH}")
    if(EXISTS "${LLVM_CONFIG_PATH}")
      set(LLVM_CONFIG "${LLVM_CONFIG_PATH}")
    else()
      message(FATAL_ERROR "llvm-config is not found in ${LLVM_CONFIG_PATH}")
    endif()
    message(STATUS "Using llvm-config: ${LLVM_CONFIG}")
    execute_process(
      COMMAND "${LLVM_CONFIG}" "--cxxflags"
      OUTPUT_VARIABLE LLVM_CXX_FLAG
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(
      COMMAND "${LLVM_CONFIG}" "--libdir"
      OUTPUT_VARIABLE LLVM_LIB_PATH
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(
      COMMAND "${LLVM_CONFIG}" "--libs"
      OUTPUT_VARIABLE LLVM_LINK_FLAG
      OUTPUT_STRIP_TRAILING_WHITESPACE)
  endif()
else()
  message(FATAL_ERROR "llvm-config is required")
endif()

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
set(CMAKE_CXX_FLAGS "${LLVM_CXX_FLAG} ${CMAKE_CXX_FLAGS}")

# using-ltinfo Errors
set(GCC_COVERAGE_LINK_FLAGS
    "-L${LLVM_LIB_PATH} ${LLVM_LINK_FLAG} -lz -lrt -ldl -lpthread -lm -lzstd")

include_directories(include)
add_subdirectory(compilation)
add_subdirectory(runtime)

