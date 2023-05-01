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
