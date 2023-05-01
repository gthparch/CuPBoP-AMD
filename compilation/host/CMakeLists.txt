file(GLOB CUPBOP_HOST_SOURCES "src/*.cpp")
add_library(cupbop-amd-host SHARED ${CUPBOP_HOST_SOURCES})
cupbop_document_sources(NAME host-translator-lib DIRS src include)
