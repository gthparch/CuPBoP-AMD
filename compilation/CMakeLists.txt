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

add_compile_options(${CUPBOP_CXXFLAGS})
add_link_options(${CUPBOP_LDFLAGS})
cupbop_document_sources(NAME cupbop-translators DIRS .)

include_directories(./kernel/include/)
add_subdirectory(kernel)
add_executable(kernelTranslator KernelTranslation.cpp)
target_link_libraries(kernelTranslator cupbop-amd-kernel ${CUPBOP_LINKED_LLVM_LIBS})

include_directories(./host/include/)
add_subdirectory(host)
add_executable(hostTranslator HostTranslation.cpp)
target_link_libraries(hostTranslator cupbop-amd-host ${CUPBOP_LINKED_LLVM_LIBS})
