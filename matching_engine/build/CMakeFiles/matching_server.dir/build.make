# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/carlostrujillo/Desktop/matching_engine

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/carlostrujillo/Desktop/matching_engine/build

# Include any dependencies generated for this target.
include CMakeFiles/matching_server.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/matching_server.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/matching_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/matching_server.dir/flags.make

CMakeFiles/matching_server.dir/codegen:
.PHONY : CMakeFiles/matching_server.dir/codegen

CMakeFiles/matching_server.dir/src/server.cpp.o: CMakeFiles/matching_server.dir/flags.make
CMakeFiles/matching_server.dir/src/server.cpp.o: /Users/carlostrujillo/Desktop/matching_engine/src/server.cpp
CMakeFiles/matching_server.dir/src/server.cpp.o: CMakeFiles/matching_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/carlostrujillo/Desktop/matching_engine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/matching_server.dir/src/server.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/matching_server.dir/src/server.cpp.o -MF CMakeFiles/matching_server.dir/src/server.cpp.o.d -o CMakeFiles/matching_server.dir/src/server.cpp.o -c /Users/carlostrujillo/Desktop/matching_engine/src/server.cpp

CMakeFiles/matching_server.dir/src/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/matching_server.dir/src/server.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/carlostrujillo/Desktop/matching_engine/src/server.cpp > CMakeFiles/matching_server.dir/src/server.cpp.i

CMakeFiles/matching_server.dir/src/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/matching_server.dir/src/server.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/carlostrujillo/Desktop/matching_engine/src/server.cpp -o CMakeFiles/matching_server.dir/src/server.cpp.s

CMakeFiles/matching_server.dir/src/order_book.cpp.o: CMakeFiles/matching_server.dir/flags.make
CMakeFiles/matching_server.dir/src/order_book.cpp.o: /Users/carlostrujillo/Desktop/matching_engine/src/order_book.cpp
CMakeFiles/matching_server.dir/src/order_book.cpp.o: CMakeFiles/matching_server.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/carlostrujillo/Desktop/matching_engine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/matching_server.dir/src/order_book.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/matching_server.dir/src/order_book.cpp.o -MF CMakeFiles/matching_server.dir/src/order_book.cpp.o.d -o CMakeFiles/matching_server.dir/src/order_book.cpp.o -c /Users/carlostrujillo/Desktop/matching_engine/src/order_book.cpp

CMakeFiles/matching_server.dir/src/order_book.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/matching_server.dir/src/order_book.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/carlostrujillo/Desktop/matching_engine/src/order_book.cpp > CMakeFiles/matching_server.dir/src/order_book.cpp.i

CMakeFiles/matching_server.dir/src/order_book.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/matching_server.dir/src/order_book.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/carlostrujillo/Desktop/matching_engine/src/order_book.cpp -o CMakeFiles/matching_server.dir/src/order_book.cpp.s

# Object files for target matching_server
matching_server_OBJECTS = \
"CMakeFiles/matching_server.dir/src/server.cpp.o" \
"CMakeFiles/matching_server.dir/src/order_book.cpp.o"

# External object files for target matching_server
matching_server_EXTERNAL_OBJECTS =

matching_server: CMakeFiles/matching_server.dir/src/server.cpp.o
matching_server: CMakeFiles/matching_server.dir/src/order_book.cpp.o
matching_server: CMakeFiles/matching_server.dir/build.make
matching_server: CMakeFiles/matching_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/carlostrujillo/Desktop/matching_engine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable matching_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matching_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/matching_server.dir/build: matching_server
.PHONY : CMakeFiles/matching_server.dir/build

CMakeFiles/matching_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/matching_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/matching_server.dir/clean

CMakeFiles/matching_server.dir/depend:
	cd /Users/carlostrujillo/Desktop/matching_engine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/carlostrujillo/Desktop/matching_engine /Users/carlostrujillo/Desktop/matching_engine /Users/carlostrujillo/Desktop/matching_engine/build /Users/carlostrujillo/Desktop/matching_engine/build /Users/carlostrujillo/Desktop/matching_engine/build/CMakeFiles/matching_server.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/matching_server.dir/depend

