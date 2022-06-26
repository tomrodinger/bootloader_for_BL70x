if((${CHIP} STREQUAL "bl702"))
    set(BSP_COMMON_DIR ${CMAKE_SOURCE_DIR}/bsp/bsp_common)
endif()


set(TARGET_REQUIRED_LIBS xz freertos ble mbedtls)
list(APPEND TARGET_REQUIRED_SRCS blsp_common.c blsp_media_boot.c )
list(APPEND TARGET_REQUIRED_SRCS blsp_boot_parser.c blsp_boot_decompress.c blsp_port.c )
list(APPEND TARGET_REQUIRED_SRCS bflb_eflash_loader_uart.c  ) #bflb_eflash_loader_gpio.c
list(APPEND TARGET_REQUIRED_SRCS bflb_eflash_loader_ble.c  )
list(APPEND TARGET_REQUIRED_SRCS bflb_eflash_loader_cmds.c )

list(APPEND TARGET_REQUIRED_SRCS bflb_eflash_loader_interface.c )
SET(LINKER_SCRIPT ${BOOT2_LINKER_SCRIPT})  

list(APPEND GLOBAL_C_FLAGS -DNO_MSG)

set(mains main.c)
generate_bin()



