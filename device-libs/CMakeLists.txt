# Copyright © 2023
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
