# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# compile C with /Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/toolchain_essentials/riscv/Darwin/bin/riscv64-unknown-elf-gcc
C_DEFINES = 

C_INCLUDES = -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/bsp/bsp_common/platform -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/bsp/board/bl702 -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/port/include -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common/include -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common/include/zephyr -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common/include/misc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common/include/toolchain -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/common/tinycrypt/include/tinycrypt -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/hci_onchip -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/bl_hci_wrapper -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/host -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/include/bluetooth -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/include/drivers/bluetooth -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/cli_cmds -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/ble_stack/services -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/ble/blecontroller/ble_inc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/include -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/freertos/portable/gcc/risc-v/bl702 -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/drivers/bl702_driver/hal_drv/inc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/drivers/bl702_driver/std_drv/inc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/drivers/bl702_driver/regs -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/drivers/bl702_driver/startup -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/drivers/bl702_driver -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/ring_buffer -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/soft_crc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/memheap -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/misc -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/list -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/device -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/partition -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/bl_math -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/pid -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/common/timestamp -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/library -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/include/psa -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/include -I/Volumes/Untitled/bootloader_source_debug_on_D0/build_essentials/components/mbedtls/bflb_port/inc

C_FLAGS = -march=rv32imafc -mabi=ilp32f -Os -g0 -fno-jump-tables -fshort-enums -fno-common -fms-extensions -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -ffast-math -Wall -Wshift-negative-value -Wchar-subscripts -Wformat -Wuninitialized -Winit-self -Wignored-qualifiers -Wunused -Wundef -msmall-data-limit=4 -Wtype-limits -DNO_MSG -Dbl702_xt -std=c99 -DCFG_FREERTOS -DARCH_RISCV -DBL702 -DCFG_BLE_ENABLE -DBFLB_BLE -DCFG_BLE -DCFG_SLEEP -DOPTIMIZE_DATA_EVT_FLOW_FROM_CONTROLLER -DBL_MCU_SDK -DCFG_CON=2 -DCFG_BLE_TX_BUFF_DATA=2 -DCONFIG_BT_ALLROLES -DCONFIG_BT_CENTRAL -DCONFIG_BT_OBSERVER -DCONFIG_BT_PERIPHERAL -DCONFIG_BT_BROADCASTER -DCONFIG_BT_L2CAP_DYNAMIC_CHANNEL -DCONFIG_BT_GATT_CLIENT -DCONFIG_BT_CONN -DCONFIG_BT_GATT_DIS_PNP -DCONFIG_BT_GATT_DIS_SERIAL_NUMBER -DCONFIG_BT_GATT_DIS_FW_REV -DCONFIG_BT_GATT_DIS_HW_REV -DCONFIG_BT_GATT_DIS_SW_REV -DCONFIG_BT_ECC -DCONFIG_BT_GATT_DYNAMIC_DB -DCONFIG_BT_GATT_SERVICE_CHANGED -DCONFIG_BT_KEYS_OVERWRITE_OLDEST -DCONFIG_BT_KEYS_SAVE_AGING_COUNTER_ON_PAIRING -DCONFIG_BT_GAP_PERIPHERAL_PREF_PARAMS -DCONFIG_BT_BONDABLE -DCONFIG_BT_HCI_VS_EVT_USER -DCONFIG_BT_ASSERT -DCONFIG_BT_SMP -DCONFIG_BT_SIGNING -DCONFIG_BT_SETTINGS_CCC_LAZY_LOADING -DCONFIG_BT_SETTINGS_USE_PRINTK -DCFG_BLE_STACK_DBG_PRINT -DportasmHANDLE_INTERRUPT=FreeRTOS_Interrupt_Handler -DBFLB_USE_ROM_DRIVER -DBFLB_USE_HAL_DRIVER -DMBEDTLS_CONFIG_FILE=\"mbedtls_bflb_config.h\"

