# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /nethome/jchen706/coding/amdcuda

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /nethome/jchen706/coding/amdcuda/build

# Utility rule file for intrinsics_gen.

# Include any custom commands dependencies for this target.
include CMakeFiles/intrinsics_gen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/intrinsics_gen.dir/progress.make

intrinsics_gen: CMakeFiles/intrinsics_gen.dir/build.make
.PHONY : intrinsics_gen

# Rule to build all files generated by this target.
CMakeFiles/intrinsics_gen.dir/build: intrinsics_gen
.PHONY : CMakeFiles/intrinsics_gen.dir/build

CMakeFiles/intrinsics_gen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/intrinsics_gen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/intrinsics_gen.dir/clean

CMakeFiles/intrinsics_gen.dir/depend:
	cd /nethome/jchen706/coding/amdcuda/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /nethome/jchen706/coding/amdcuda /nethome/jchen706/coding/amdcuda /nethome/jchen706/coding/amdcuda/build /nethome/jchen706/coding/amdcuda/build /nethome/jchen706/coding/amdcuda/build/CMakeFiles/intrinsics_gen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/intrinsics_gen.dir/depend

