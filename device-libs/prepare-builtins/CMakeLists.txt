add_compile_options(${CUPBOP_CXXFLAGS})
add_link_options(${CUPBOP_LDFLAGS})
add_executable(prepare-builtins prepare-builtins.cpp)
target_link_libraries(prepare-builtins ${CUPBOP_LINKED_LLVM_LIBS})
