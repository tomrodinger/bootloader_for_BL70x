#!/usr/bin/env bash

#automatically determine the location of the compiler
#TOOLCHAIN_BIN_LOCATION=${PWD}/$(find ./toolchain_essentials/ -name "riscv64-unknown-elf-gcc")
PWD=$(pwd)
TOOLCHAIN_BIN_LOCATION=${PWD}/toolchain_essentials/riscv/Darwin/bin
echo "The toolchain bin directory is expected to be at: ${TOOLCHAIN_BIN_LOCATION}"
GCC_LOCATION=${TOOLCHAIN_BIN_LOCATION}/riscv64-unknown-elf-gcc
echo "The gcc location is expected to be at: ${GCC_LOCATION}"
#check if the file called "riscv64-unknown-elf-gcc" exists in the toolchain bin directory
if [ ! -f "${GCC_LOCATION}" ]; then
    echo "Error: Toolchain not found"
    exit 1
fi

#add the path of the compiler to the PATH variable
PATH=$PATH:${TOOLCHAIN_BIN_LOCATION}

make APP=boot2_custom BOARD=bl702_xt
# chek if make succeeded
if [ $? -ne 0 ]; then
    echo "make failed"
    exit 1
fi

mkdir -p ../bootloader_bin_file_releases
# check if the above command succeeded
if [ $? -ne 0 ]; then
    echo "mkdir failed"
    exit 1
fi

FINAL_BIN_FILE=../bootloader_bin_file_releases/boot2_custom_bl702_latest.bin
cp ./out/examples/boot2_custom/boot2_custom_bl702.bin ${FINAL_BIN_FILE}
# check if the obove copy command succeeded
if [ $? -ne 0 ]; then
    echo "copy failed"
    exit 1
fi

echo The compiled bin file is ready in ${FINAL_BIN_FILE}
echo "* * * SUCCESS * * *"