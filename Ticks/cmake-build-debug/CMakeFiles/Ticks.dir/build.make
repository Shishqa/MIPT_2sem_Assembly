# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /var/lib/snapd/snap/clion/103/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /var/lib/snapd/snap/clion/103/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Ticks.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Ticks.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Ticks.dir/flags.make

CMakeFiles/Ticks.dir/main.c.o: CMakeFiles/Ticks.dir/flags.make
CMakeFiles/Ticks.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Ticks.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Ticks.dir/main.c.o   -c /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/main.c

CMakeFiles/Ticks.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Ticks.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/main.c > CMakeFiles/Ticks.dir/main.c.i

CMakeFiles/Ticks.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Ticks.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/main.c -o CMakeFiles/Ticks.dir/main.c.s

# Object files for target Ticks
Ticks_OBJECTS = \
"CMakeFiles/Ticks.dir/main.c.o"

# External object files for target Ticks
Ticks_EXTERNAL_OBJECTS =

Ticks: CMakeFiles/Ticks.dir/main.c.o
Ticks: CMakeFiles/Ticks.dir/build.make
Ticks: CMakeFiles/Ticks.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable Ticks"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Ticks.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Ticks.dir/build: Ticks

.PHONY : CMakeFiles/Ticks.dir/build

CMakeFiles/Ticks.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Ticks.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Ticks.dir/clean

CMakeFiles/Ticks.dir/depend:
	cd /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug /home/shishqa/Repositories/MIPT/2_semester/Assembly/Ticks/cmake-build-debug/CMakeFiles/Ticks.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Ticks.dir/depend
