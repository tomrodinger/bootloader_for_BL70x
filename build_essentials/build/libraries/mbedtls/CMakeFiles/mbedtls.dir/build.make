# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.23.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build

# Include any dependencies generated for this target.
include libraries/mbedtls/CMakeFiles/mbedtls.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libraries/mbedtls/CMakeFiles/mbedtls.dir/compiler_depend.make

# Include the progress variables for this target.
include libraries/mbedtls/CMakeFiles/mbedtls.dir/progress.make

# Include the compile flags for this target's objects.
include libraries/mbedtls/CMakeFiles/mbedtls.dir/flags.make

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/flags.make
libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj: ../components/mbedtls/bflb_port/src/bflb_aes.c
libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj -MF CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj.d -o CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_aes.c

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_aes.c > CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.i

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_aes.c -o CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.s

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/flags.make
libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj: ../components/mbedtls/bflb_port/src/bflb_ccm.c
libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj -MF CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj.d -o CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_ccm.c

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_ccm.c > CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.i

libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/src/bflb_ccm.c -o CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.s

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/flags.make
libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj: ../components/mbedtls/library/sha256.c
libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj -MF CMakeFiles/mbedtls.dir/library/sha256.c.obj.d -o CMakeFiles/mbedtls.dir/library/sha256.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/sha256.c

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mbedtls.dir/library/sha256.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/sha256.c > CMakeFiles/mbedtls.dir/library/sha256.c.i

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mbedtls.dir/library/sha256.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/sha256.c -o CMakeFiles/mbedtls.dir/library/sha256.c.s

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/flags.make
libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj: ../components/mbedtls/library/platform_util.c
libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj: libraries/mbedtls/CMakeFiles/mbedtls.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj -MF CMakeFiles/mbedtls.dir/library/platform_util.c.obj.d -o CMakeFiles/mbedtls.dir/library/platform_util.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/platform_util.c

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mbedtls.dir/library/platform_util.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/platform_util.c > CMakeFiles/mbedtls.dir/library/platform_util.c.i

libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mbedtls.dir/library/platform_util.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library/platform_util.c -o CMakeFiles/mbedtls.dir/library/platform_util.c.s

# Object files for target mbedtls
mbedtls_OBJECTS = \
"CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj" \
"CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj" \
"CMakeFiles/mbedtls.dir/library/sha256.c.obj" \
"CMakeFiles/mbedtls.dir/library/platform_util.c.obj"

# External object files for target mbedtls
mbedtls_EXTERNAL_OBJECTS =

libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_aes.c.obj
libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/bflb_port/src/bflb_ccm.c.obj
libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/library/sha256.c.obj
libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/library/platform_util.c.obj
libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/build.make
libraries/mbedtls/libmbedtls.a: libraries/mbedtls/CMakeFiles/mbedtls.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C static library libmbedtls.a"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && $(CMAKE_COMMAND) -P CMakeFiles/mbedtls.dir/cmake_clean_target.cmake
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mbedtls.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libraries/mbedtls/CMakeFiles/mbedtls.dir/build: libraries/mbedtls/libmbedtls.a
.PHONY : libraries/mbedtls/CMakeFiles/mbedtls.dir/build

libraries/mbedtls/CMakeFiles/mbedtls.dir/clean:
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls && $(CMAKE_COMMAND) -P CMakeFiles/mbedtls.dir/cmake_clean.cmake
.PHONY : libraries/mbedtls/CMakeFiles/mbedtls.dir/clean

libraries/mbedtls/CMakeFiles/mbedtls.dir/depend:
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/mbedtls/CMakeFiles/mbedtls.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libraries/mbedtls/CMakeFiles/mbedtls.dir/depend

