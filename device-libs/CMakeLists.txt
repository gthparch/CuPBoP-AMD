# Compile prepare-builtins if it doesn't exist
if (NOT PREPARE_BUILTINS)
  add_subdirectory(prepare-builtins)
  set(PREPARE_BUILTINS $<TARGET_FILE:prepare-builtins>)
endif()

# Compile and link device libs to a single bitcode library
file(GLOB device_lib_sources ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cl)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
opencl_bc_lib(
    NAME cupbop-amd-bitcode
    SOURCES ${device_lib_sources})    
cupbop_document_sources(NAME cupbop-device-libs DIRS include src prepare-builtins)
