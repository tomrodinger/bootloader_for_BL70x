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
include libraries/freertos/CMakeFiles/freertos.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.make

# Include the progress variables for this target.
include libraries/freertos/CMakeFiles/freertos.dir/progress.make

# Include the compile flags for this target's objects.
include libraries/freertos/CMakeFiles/freertos.dir/flags.make

libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj: ../components/freertos/croutine.c
libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj -MF CMakeFiles/freertos.dir/croutine.c.obj.d -o CMakeFiles/freertos.dir/croutine.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/croutine.c

libraries/freertos/CMakeFiles/freertos.dir/croutine.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/croutine.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/croutine.c > CMakeFiles/freertos.dir/croutine.c.i

libraries/freertos/CMakeFiles/freertos.dir/croutine.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/croutine.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/croutine.c -o CMakeFiles/freertos.dir/croutine.c.s

libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj: ../components/freertos/event_groups.c
libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj -MF CMakeFiles/freertos.dir/event_groups.c.obj.d -o CMakeFiles/freertos.dir/event_groups.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/event_groups.c

libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/event_groups.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/event_groups.c > CMakeFiles/freertos.dir/event_groups.c.i

libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/event_groups.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/event_groups.c -o CMakeFiles/freertos.dir/event_groups.c.s

libraries/freertos/CMakeFiles/freertos.dir/list.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/list.c.obj: ../components/freertos/list.c
libraries/freertos/CMakeFiles/freertos.dir/list.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libraries/freertos/CMakeFiles/freertos.dir/list.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/list.c.obj -MF CMakeFiles/freertos.dir/list.c.obj.d -o CMakeFiles/freertos.dir/list.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/list.c

libraries/freertos/CMakeFiles/freertos.dir/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/list.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/list.c > CMakeFiles/freertos.dir/list.c.i

libraries/freertos/CMakeFiles/freertos.dir/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/list.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/list.c -o CMakeFiles/freertos.dir/list.c.s

libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj: ../components/freertos/portable/MemMang/heap_5.c
libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj -MF CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj.d -o CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/MemMang/heap_5.c

libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/MemMang/heap_5.c > CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.i

libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/MemMang/heap_5.c -o CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.s

libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj: ../components/freertos/queue.c
libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj -MF CMakeFiles/freertos.dir/queue.c.obj.d -o CMakeFiles/freertos.dir/queue.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/queue.c

libraries/freertos/CMakeFiles/freertos.dir/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/queue.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/queue.c > CMakeFiles/freertos.dir/queue.c.i

libraries/freertos/CMakeFiles/freertos.dir/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/queue.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/queue.c -o CMakeFiles/freertos.dir/queue.c.s

libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj: ../components/freertos/stream_buffer.c
libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj -MF CMakeFiles/freertos.dir/stream_buffer.c.obj.d -o CMakeFiles/freertos.dir/stream_buffer.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/stream_buffer.c

libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/stream_buffer.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/stream_buffer.c > CMakeFiles/freertos.dir/stream_buffer.c.i

libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/stream_buffer.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/stream_buffer.c -o CMakeFiles/freertos.dir/stream_buffer.c.s

libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj: ../components/freertos/tasks.c
libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj -MF CMakeFiles/freertos.dir/tasks.c.obj.d -o CMakeFiles/freertos.dir/tasks.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/tasks.c

libraries/freertos/CMakeFiles/freertos.dir/tasks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/tasks.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/tasks.c > CMakeFiles/freertos.dir/tasks.c.i

libraries/freertos/CMakeFiles/freertos.dir/tasks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/tasks.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/tasks.c -o CMakeFiles/freertos.dir/tasks.c.s

libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj: ../components/freertos/timers.c
libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj -MF CMakeFiles/freertos.dir/timers.c.obj.d -o CMakeFiles/freertos.dir/timers.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/timers.c

libraries/freertos/CMakeFiles/freertos.dir/timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/timers.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/timers.c > CMakeFiles/freertos.dir/timers.c.i

libraries/freertos/CMakeFiles/freertos.dir/timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/timers.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/timers.c -o CMakeFiles/freertos.dir/timers.c.s

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj: ../components/freertos/portable/gcc/risc-v/bl702/port.c
libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj: libraries/freertos/CMakeFiles/freertos.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj -MF CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj.d -o CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/port.c

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/port.c > CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.i

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/port.c -o CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.s

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj: libraries/freertos/CMakeFiles/freertos.dir/flags.make
libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj: ../components/freertos/portable/gcc/risc-v/bl702/portASM.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building ASM object libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj -c /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/portASM.S

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.i"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/portASM.S > CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.i

libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.s"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702/portASM.S -o CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.s

# Object files for target freertos
freertos_OBJECTS = \
"CMakeFiles/freertos.dir/croutine.c.obj" \
"CMakeFiles/freertos.dir/event_groups.c.obj" \
"CMakeFiles/freertos.dir/list.c.obj" \
"CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj" \
"CMakeFiles/freertos.dir/queue.c.obj" \
"CMakeFiles/freertos.dir/stream_buffer.c.obj" \
"CMakeFiles/freertos.dir/tasks.c.obj" \
"CMakeFiles/freertos.dir/timers.c.obj" \
"CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj" \
"CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj"

# External object files for target freertos
freertos_EXTERNAL_OBJECTS =

libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/croutine.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/event_groups.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/list.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/portable/MemMang/heap_5.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/queue.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/stream_buffer.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/tasks.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/timers.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/port.c.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/portable/gcc/risc-v/bl702/portASM.S.obj
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/build.make
libraries/freertos/libfreertos.a: libraries/freertos/CMakeFiles/freertos.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking C static library libfreertos.a"
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && $(CMAKE_COMMAND) -P CMakeFiles/freertos.dir/cmake_clean_target.cmake
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/freertos.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libraries/freertos/CMakeFiles/freertos.dir/build: libraries/freertos/libfreertos.a
.PHONY : libraries/freertos/CMakeFiles/freertos.dir/build

libraries/freertos/CMakeFiles/freertos.dir/clean:
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos && $(CMAKE_COMMAND) -P CMakeFiles/freertos.dir/cmake_clean.cmake
.PHONY : libraries/freertos/CMakeFiles/freertos.dir/clean

libraries/freertos/CMakeFiles/freertos.dir/depend:
	cd /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/build/libraries/freertos/CMakeFiles/freertos.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libraries/freertos/CMakeFiles/freertos.dir/depend
