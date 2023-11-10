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

cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

project(CuPBoP-AMD)
set(CMAKE_PROJECT_DESCRIPTION "Executing CUDA on AMD architecture.")
set(CMAKE_CXX_STANDARD 20)
set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(VERSION_STRING ${MAJOR_VERSION}.${MINOR_VERSION})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Find LLVM & Clang
find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})
find_package(Clang REQUIRED CONFIG HINTS ${LLVM_DIR}/../clang)

include(CuPBoPDoxygen)

# Find HIP and ROCm
include(ROCmDependencies)
locate_rocm_dependencies()

# Device library generator
include(GenerateBitcode)

# Options for compiling the translators
set(CUPBOP_LINKED_LLVM_LIBS ${LLVM_AVAILABLE_LIBS})
set(CUPBOP_LDFLAGS "")
set(CUPBOP_CXXFLAGS "-fno-rtti")

include_directories(include)
add_subdirectory(device-libs)
add_subdirectory(compilation)
add_subdirectory(runtime)

cupbop_generate_docs()
