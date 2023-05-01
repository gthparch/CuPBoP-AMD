file(GLOB CUPBOP_KERNEL_SOURCES "src/*.cpp")
add_library(cupbop-amd-kernel SHARED ${CUPBOP_KERNEL_SOURCES})
cupbop_document_sources(NAME kernel-translator-lib DIRS src include)
