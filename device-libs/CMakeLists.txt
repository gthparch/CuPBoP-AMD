file(GLOB device_lib_sources ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cl)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
opencl_bc_lib(
    NAME amdcuda
    SOURCES ${device_lib_sources})
