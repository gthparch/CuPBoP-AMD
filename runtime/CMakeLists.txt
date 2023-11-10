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

file(GLOB RUNTIME_SOURCES "./src/*.cpp")
add_library(cudaonamd SHARED ${RUNTIME_SOURCES})
configure_target_linking_rocm(cudaonamd)
target_include_directories(cudaonamd PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_directories(cudaonamd PRIVATE hsa-runtime64)
cupbop_document_sources(NAME cupbop-amd-runtime DIRS src include)
