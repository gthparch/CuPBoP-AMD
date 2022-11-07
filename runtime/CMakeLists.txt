cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CudaOnAMD)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA runtime on AMD architecture.")
set(CMAKE_CXX_STANDARD "17")
set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(VERSION_STRING ${MAJOR_VERSION}.${MINOR_VERSION})
set(CMAKE_VERBOSE_MAKEFILE on)

# find_package(LLVM REQUIRED CONFIG)
# add_definitions(${LLVM_DEFINITIONS})
# include_directories(${LLVM_INCLUDE_DIRS})
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_TYPE Debug)
set(LIB_NAME cudaonamd)

if(NOT DEFINED HIP_PATH)
    if(NOT DEFINED ENV{HIP_PATH})
        set(HIP_PATH "/nethome/jchen706/opt/hip" CACHE PATH "Path to which HIP has been installed")
    else()
        set(HIP_PATH $ENV{HIP_PATH} CACHE PATH "Path to which HIP has been installed")
    endif()
endif()
set(CMAKE_MODULE_PATH "/nethome/jchen706/opt/hip/cmake" ${CMAKE_MODULE_PATH})
find_package(HIP)
message(HIP: " ${HIP_PATH}")

include_directories(./include)
set(HIP_COMMON_INCLUDE_DIR ${HIP_PATH}/include)
# include_directories(HIP_COMMON_INCLUDE_DIR)

set(HIP_COMMON_BIN_DIR ${HIP_PATH}/bin)
set(__HIPCONFIG_EXECUTABLE__ ${HIP_PATH}/bin/hipconfig)
set(ROCM_PATH "/nethome/jchen706/opt")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__HIP_PLATFORM_AMD__ -L${HIP_PATH}/lib -lamdhip64 -L${ROCM_PATH}/lib -lhsa-runtime64 -ldl -lnuma")

file(GLOB proj_SOURCES "./src/*.cpp")

# Add core library.
add_library(${LIB_NAME} SHARED ${proj_SOURCES})
target_include_directories(${LIB_NAME} PRIVATE ${HIP_COMMON_INCLUDE_DIR})



# add_subdirectory(src)
# add_subdirectory(runtime)

