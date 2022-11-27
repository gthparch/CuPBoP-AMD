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
CMAKE_SOURCE_DIR = /nethome/jlu393/amdcuda

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /nethome/jlu393/amdcuda/build

# Include any dependencies generated for this target.
include compilation/CMakeFiles/kernelTranslator.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include compilation/CMakeFiles/kernelTranslator.dir/compiler_depend.make

# Include the progress variables for this target.
include compilation/CMakeFiles/kernelTranslator.dir/progress.make

# Include the compile flags for this target's objects.
include compilation/CMakeFiles/kernelTranslator.dir/flags.make

compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o: compilation/CMakeFiles/kernelTranslator.dir/flags.make
compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o: ../compilation/KernelTranslation.cpp
compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o: compilation/CMakeFiles/kernelTranslator.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/nethome/jlu393/amdcuda/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o"
	cd /nethome/jlu393/amdcuda/build/compilation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o -MF CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o.d -o CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o -c /nethome/jlu393/amdcuda/compilation/KernelTranslation.cpp

compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.i"
	cd /nethome/jlu393/amdcuda/build/compilation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /nethome/jlu393/amdcuda/compilation/KernelTranslation.cpp > CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.i

compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.s"
	cd /nethome/jlu393/amdcuda/build/compilation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /nethome/jlu393/amdcuda/compilation/KernelTranslation.cpp -o CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.s

# Object files for target kernelTranslator
kernelTranslator_OBJECTS = \
"CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o"

# External object files for target kernelTranslator
kernelTranslator_EXTERNAL_OBJECTS =

compilation/kernelTranslator: compilation/CMakeFiles/kernelTranslator.dir/KernelTranslation.cpp.o
compilation/kernelTranslator: compilation/CMakeFiles/kernelTranslator.dir/build.make
compilation/kernelTranslator: compilation/kernel/libcupbop-amd-kernel.so
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMSupport.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMCore.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMIRReader.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMPasses.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMAnalysis.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMCoroutines.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMipo.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMBitWriter.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMFrontendOpenMP.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMLinker.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMObjCARCOpts.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMScalarOpts.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMAggressiveInstCombine.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMInstCombine.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMTarget.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMVectorize.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMInstrumentation.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMTransformUtils.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMAnalysis.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMProfileData.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMSymbolize.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMDebugInfoPDB.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMDebugInfoMSF.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMDebugInfoDWARF.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMObject.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMIRReader.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMAsmParser.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMBitReader.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMCore.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMRemarks.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMBitstreamReader.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMMCParser.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMTextAPI.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMMC.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMBinaryFormat.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMDebugInfoCodeView.a
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMSupport.a
compilation/kernelTranslator: /usr/lib64/libz.so
compilation/kernelTranslator: /usr/lib64/libzstd.so
compilation/kernelTranslator: /nethome/jlu393/opt/llvm/lib/libLLVMDemangle.a
compilation/kernelTranslator: compilation/CMakeFiles/kernelTranslator.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/nethome/jlu393/amdcuda/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable kernelTranslator"
	cd /nethome/jlu393/amdcuda/build/compilation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/kernelTranslator.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
compilation/CMakeFiles/kernelTranslator.dir/build: compilation/kernelTranslator
.PHONY : compilation/CMakeFiles/kernelTranslator.dir/build

compilation/CMakeFiles/kernelTranslator.dir/clean:
	cd /nethome/jlu393/amdcuda/build/compilation && $(CMAKE_COMMAND) -P CMakeFiles/kernelTranslator.dir/cmake_clean.cmake
.PHONY : compilation/CMakeFiles/kernelTranslator.dir/clean

compilation/CMakeFiles/kernelTranslator.dir/depend:
	cd /nethome/jlu393/amdcuda/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /nethome/jlu393/amdcuda /nethome/jlu393/amdcuda/compilation /nethome/jlu393/amdcuda/build /nethome/jlu393/amdcuda/build/compilation /nethome/jlu393/amdcuda/build/compilation/CMakeFiles/kernelTranslator.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : compilation/CMakeFiles/kernelTranslator.dir/depend

