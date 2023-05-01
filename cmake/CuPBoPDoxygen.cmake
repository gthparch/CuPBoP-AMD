# Options to disable documentation generation
option(GENERATE_DOCS "Generate documentations" ON)

set_property(GLOBAL PROPERTY CUPBOP_DOCS_SOURCES)

set(CUPBOP_DOCS_SOURCES_ROOT ${CMAKE_SOURCE_DIR})
set(CUPBOP_DOCS_DIR ${CUPBOP_DOCS_SOURCES_ROOT}/docs)

message(STATUS "Doxygen docs dir is ${CUPBOP_DOCS_DIR}")

# Called with NAME: the name of the target
#             SOURCES: sources to be documented
macro(cupbop_document_sources)
    set(parse_options)
    set(one_value_args NAME)
    set(multi_value_args DIRS)

    cmake_parse_arguments(CUPBOP_DOCUMENT_SOURCES "${parse_options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    set(target_name ${CUPBOP_DOCUMENT_SOURCES_NAME})
    set(target_sources_dir ${CUPBOP_DOCUMENT_SOURCES_DIRS})

    get_property(current_sources_list GLOBAL PROPERTY CUPBOP_DOCS_SOURCES)
    foreach(source_dir ${target_sources_dir})
        get_filename_component(source_abs_path ${source_dir} ABSOLUTE)
        set(current_sources_list "${current_sources_list} ${source_abs_path}")
        message(STATUS "Added directory ${source_abs_path} to documentation sources")
    endforeach()
    set_property(GLOBAL PROPERTY CUPBOP_DOCS_SOURCES ${current_sources_list})
endmacro()

macro(cupbop_generate_docs)
    if (GENERATE_DOCS)
        # Generate CuPBoP documentations with doxygen
        find_package(Doxygen)

        # Docs directory is always at the /docs folder of the top level CMakeLists.txt
        set(CUPBOP_DOCS_DIR ${CMAKE_SOURCE_DIR}/docs)

        if (DOXYGEN_FOUND)
            set(DOXYGEN_IN ${CUPBOP_DOCS_DIR}/Doxyfile.in)
            set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

            get_property(CUPBOP_DOCS_SOURCES GLOBAL PROPERTY CUPBOP_DOCS_SOURCES)
            message(STATUS "Generating documentations")
            message(STATUS "Input source files: ${CUPBOP_DOCS_SOURCES}")
            configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
            add_custom_target(generate-docs ALL
                    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
                    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                    COMMENT "Generating API documentation with Doxygen"
                    VERBATIM)
        else (DOXYGEN_FOUND)
            message(WARNING "Doxygen need to be installed to generate the doxygen documentation. Alternatively, disable documentation generation by setting GENERATE_DOCS to OFF.")
        endif (DOXYGEN_FOUND)
    endif (GENERATE_DOCS)
endmacro()
