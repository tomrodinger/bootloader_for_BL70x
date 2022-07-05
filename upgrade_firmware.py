#!/usr/bin/env python3

import sys
import argparse
import serial
from serial.serialutil import to_bytes
import serial.tools.list_ports
import time
import binascii
import struct
import random
import os
import subprocess
import pathlib
import configparser
import hashlib
import asyncio
import signal
from bleak import BleakScanner
from bleak import BleakClient
from queue import Queue

BFLB_EFLASH_LOADER_CMD_RESET=b'\x21'
BFLB_EFLASH_LOADER_CMD_FLASH_ERASE=b'\x30'
BFLB_EFLASH_LOADER_CMD_FLASH_WRITE=b'\x31'
BFLB_EFLASH_LOADER_CMD_FLASH_READ=b'\x32'
BFLB_EFLASH_LOADER_CMD_FLASH_BOOT=b'\x33'
BFLB_EFLASH_LOADER_CMD_FLASH_WRITE_CHECK=b'\x3A'
BFLB_EFLASH_LOADER_CMD_FLASH_SET_PARA=b'\x3B'
BFLB_EFLASH_LOADER_CMD_FLASH_CHIPERASE=b'\x3C'
BFLB_EFLASH_LOADER_CMD_FLASH_READSHA=b'\x3D'
BFLB_EFLASH_LOADER_CMD_FLASH_XIP_READSHA=b'\x3E'

FLASH_START_ADDRESS=0x3F000
FLASH_TOTAL_SIZE=0xba000
FLASH_END_ADDRESS=FLASH_START_ADDRESS + FLASH_TOTAL_SIZE
FLASH_PAGE_SIZE=4096
HANDSHAKE_CMD=b'\x55\x55\x55\x55'
FLASH_OFFSET=0x2000
BOOT_ENTRY=0x0000

BLE_READ_CHARACTERISTIC_UUID = "00070001-0745-4650-8d93-df59be2fc10a"
BLE_WRITE_CHARACTERISTIC_UUID = "00070002-0745-4650-8d93-df59be2fc10a "

def print_data(data):
    print(data)
    for d in data:
        print("0x%02X %d" % (d, d))


def print_usage():
    print("Usage: %s firmware-file.bin" % (sys.argv[0]))
    exit(1)


def read_binary(filename):
    print("Reading firmware file from:", filename)
    with open(filename, "rb") as fh:
        data = fh.read()
    # firmware_data_size = len(data) - MODEL_CODE_LENGTH - FIRMWARE_COMPATIBILITY_CODE_LENGTH
    # if firmware_data_size < MINIMUM_FIRWARE_SIZE:
    #     print("Error: the firmware size (%d) is less than one page of flash memory (%d)" % (firmware_size, FLASH_PAGE_SIZE))
    #     exit(1)
    # print("The firmware file, including the header contents, has size:", len(data))
    # model_code = data[0 : MODEL_CODE_LENGTH]
    # firmware_compatibility_code = int.from_bytes(data[MODEL_CODE_LENGTH : MODEL_CODE_LENGTH + FIRMWARE_COMPATIBILITY_CODE_LENGTH], byteorder = 'little')
    # firmware_data = data[MODEL_CODE_LENGTH + FIRMWARE_COMPATIBILITY_CODE_LENGTH : ]
    # return model_code, firmware_compatibility_code, firmware_data
    return data

def create_payload(command, data):
    checksum = 0

    for item in data:
        checksum = checksum + item

    checksum = checksum + len(data) & 0xFF
    checksum = checksum + ((len(data) >> 8) & 0xFF)
    checksum = checksum & 0xFF

    payload = command + checksum.to_bytes(1, "little") + len(data).to_bytes(2, "little") + data

    return payload


def get_response(ser):
    response = ser.read(1)
    
    if len(response) != 1:
        print("Error: didn't receive enough bytes in the response")
        exit(1)

    print("Received a response: ", response)

    if response[0] != 0x4F:
        print("Error: response NACK or unknown response")
        exit(1)
    
    ser.read(1)


def program_one_page(ser, data):
    data = int(0).to_bytes(4, "little") + data

    command = create_payload(BFLB_EFLASH_LOADER_CMD_FLASH_WRITE, data)

#    print_data(command)

    # write the bytes in three shots with a time delay betwoen, otherwise there is a strange bug where bytes get dropped
    ser.write(command)

    get_response(ser)

#    payload = get_response(ser)
#    if len(payload) != 0:
#        print("Error: didn't receive a payload with zero length")
#        exit(1)

def erase_flash(ser, size):
    print("Erase flash")

    size = size + FLASH_START_ADDRESS

    data = FLASH_START_ADDRESS.to_bytes(4, "little") + size.to_bytes(4, "little")

    command = create_payload(BFLB_EFLASH_LOADER_CMD_FLASH_ERASE, data)

    ser.timeout = 5

#    print_data(command)

    # write the bytes in three shots with a time delay betwoen, otherwise there is a strange bug where bytes get dropped
    ser.write(command)

    get_response(ser)

def handshake(ser):
    print("Handshake with device")

    ser.timeout = 0.1

    while True :
        repeat = 7
        command = HANDSHAKE_CMD
        while repeat > 0:
            command = command + HANDSHAKE_CMD
            repeat = repeat - 1

        # write the bytes in three shots with a time delay betwoen, otherwise there is a strange bug where bytes get dropped
        ser.write(command)

        response = ser.read(2)
        if len(response) == 2 and response[0] == ord('O') and response[1] == ord('K'):
            print("Handshake successfully")
            break

def system_reset_command(ser):
    print("Resettting the newly programmed device...")

    data = int(0).to_bytes(1, "little")

    command = create_payload(BFLB_EFLASH_LOADER_CMD_RESET, data)

    ser.write(command)

    get_response(ser)

def add_boot_header(data, config):
    # BOOT HEADER
    header = int(config.get('BOOTHEADER_CFG', 'magic_code'), 16).to_bytes(4, "little")
    header = header + int(config.get('BOOTHEADER_CFG', 'revision'), 16).to_bytes(4, "little")
    # Flash configuration
    flash_cfg = int(config.get('BOOTHEADER_CFG', 'io_mode'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'cont_read_support').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'sfctrl_clk_delay').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'sfctrl_clk_invert'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reset_en_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reset_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'exit_contread_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'exit_contread_cmd_size').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'jedecid_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'jedecid_cmd_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'qpi_jedecid_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qpi_jedecid_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'sector_size').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'mfg_id'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'page_size').to_bytes(2, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'chip_erase_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'sector_erase_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'blk32k_erase_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'blk64k_erase_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'write_enable_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'page_prog_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'qpage_prog_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qual_page_prog_addr_mode').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'fast_read_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'fast_read_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'qpi_fast_read_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qpi_fast_read_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'fast_read_do_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'fast_read_do_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'fast_read_dio_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'fast_read_dio_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'fast_read_qo_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'fast_read_qo_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'fast_read_qio_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'fast_read_qio_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'qpi_fast_read_qio_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qpi_fast_read_qio_dmy_clk').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'qpi_page_prog_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'write_vreg_enable_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'wel_reg_index').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qe_reg_index').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'busy_reg_index').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'wel_bit_pos').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qe_bit_pos').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'busy_bit_pos').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'wel_reg_write_len').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'wel_reg_read_len').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qe_reg_write_len').to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'qe_reg_read_len').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'release_power_down'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'busy_reg_read_len').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reg_read_cmd0'), 16).to_bytes(2, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reg_read_cmd1'), 16).to_bytes(2, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reg_write_cmd0'), 16).to_bytes(2, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'reg_write_cmd1'), 16).to_bytes(2, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'enter_qpi_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'exit_qpi_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'cont_read_code'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'cont_read_exit_code'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'burst_wrap_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'burst_wrap_dmy_clk'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'burst_wrap_data_mode').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'burst_wrap_code'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'de_burst_wrap_cmd'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'de_burst_wrap_cmd_dmy_clk'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'de_burst_wrap_code_mode').to_bytes(1, "little")
    flash_cfg = flash_cfg + int(config.get('BOOTHEADER_CFG', 'de_burst_wrap_code'), 16).to_bytes(1, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'sector_erase_time').to_bytes(2, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'blk32k_erase_time').to_bytes(2, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'blk64k_erase_time').to_bytes(2, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'page_prog_time').to_bytes(2, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'chip_erase_time').to_bytes(2, "little")
    flash_cfg = flash_cfg + config.getint('BOOTHEADER_CFG', 'power_down_delay').to_bytes(2, "little")
    flash_cfg = int(config.get('BOOTHEADER_CFG', 'flashcfg_magic_code'), 16).to_bytes(4, "little") + flash_cfg + binascii.crc32(flash_cfg).to_bytes(4, "little")
    # Clock configuration
    clock_cfg = config.getint('BOOTHEADER_CFG', 'xtal_type').to_bytes(1, "little")
    clock_cfg = clock_cfg + config.getint('BOOTHEADER_CFG', 'pll_clk').to_bytes(1, "little")
    clock_cfg = clock_cfg + config.getint('BOOTHEADER_CFG', 'hclk_div').to_bytes(1, "little")
    clock_cfg = clock_cfg + config.getint('BOOTHEADER_CFG', 'bclk_div').to_bytes(1, "little")
    clock_cfg = clock_cfg + config.getint('BOOTHEADER_CFG', 'flash_clk_type').to_bytes(2, "little")
    clock_cfg = clock_cfg + config.getint('BOOTHEADER_CFG', 'flash_clk_div').to_bytes(2, "little")
    clock_cfg = int(config.get('BOOTHEADER_CFG', 'clkcfg_magic_code'), 16).to_bytes(4, "little") + clock_cfg + binascii.crc32(clock_cfg).to_bytes(4, "little")
    # Boot configuration
    boot_cfg = (config.getint('BOOTHEADER_CFG', 'sign') | (config.getint('BOOTHEADER_CFG', 'encrypt_type') << 2) |
                (config.getint('BOOTHEADER_CFG', 'key_sel') << 4) | (config.getint('BOOTHEADER_CFG', 'no_segment') << 8) |
                (config.getint('BOOTHEADER_CFG', 'cache_enable') << 9) | (config.getint('BOOTHEADER_CFG', 'notload_in_bootrom') << 10) |
                (config.getint('BOOTHEADER_CFG', 'aes_region_lock') << 11) | (int(config.get('BOOTHEADER_CFG', 'cache_way_disable'), 16) << 12) |
                (config.getint('BOOTHEADER_CFG', 'crc_ignore') << 16) | (config.getint('BOOTHEADER_CFG', 'hash_ignore') << 17) |
                (config.getint('BOOTHEADER_CFG', 'boot2_enable') << 19)).to_bytes(4, "little")
    # Image configuration
    image_cfg = len(data).to_bytes(4, "little")
    image_cfg = image_cfg + config.getint('BOOTHEADER_CFG', 'bootentry').to_bytes(4, "little")
    image_cfg = image_cfg + int(config.get('BOOTHEADER_CFG', 'img_start'), 16).to_bytes(4, "little")

    sha256 = hashlib.sha256()

    sha256.update(data)

    image_cfg = image_cfg + sha256.digest()
    image_cfg = image_cfg + int(config.get('BOOTHEADER_CFG', 'boot2_pt_table_0'), 16).to_bytes(4, "little")
    image_cfg = image_cfg + int(config.get('BOOTHEADER_CFG', 'boot2_pt_table_1'), 16).to_bytes(4, "little")

    header = header + flash_cfg + clock_cfg + boot_cfg + image_cfg
    header = header + binascii.crc32(header).to_bytes(4, "little")

    while len(header) < 0x1000:
        header = header + b'\xFF'

    return header + data

async def ble_process(fw_data, addr):
    write_handle = None
    read_handle = None
    rx_queue = Queue(maxsize = 1)

    def notification_handler(sender, data):
        rx_queue.put(data)
        
    async def get_response_ble(device):
        timeout = 10
        while rx_queue.empty():
            timeout = timeout - 1
            if timeout == 0:
                break
            await asyncio.sleep(1)
        
        if timeout == 0:
            print("Did not receive response from BLE device")
            await device.disconnect()
            return -1
        else:
            response = rx_queue.get()
        
        if len(response) != 2:
            print("Error: didn't receive enough bytes in the response")
            await device.disconnect()
            return -1

        print("Received a response: ", response)

        if response[0] != 0x4F:
            print("Error: response NACK or unknown response")
            await device.disconnect()
            return -1
        return 0

    async def write_data(device, buf):
        while len(buf) > 0:
            if len(buf) <= 20:
                data = int(0).to_bytes(1, "little") + buf[0 : 20]
            else:
                data = int(1).to_bytes(1, "little") + buf[0 : 20]
            
            await device.write_gatt_char(write_handle, data)
            
            buf = buf[20: ]

    async def program_one_page_ble(device, data):
        data = int(0).to_bytes(4, "little") + data

        command = create_payload(BFLB_EFLASH_LOADER_CMD_FLASH_WRITE, data)

    #    print_data(command)

        # write the bytes in three shots with a time delay betwoen, otherwise there is a strange bug where bytes get dropped
        await write_data(device, command)

        return (await get_response_ble(device))

    async def erase_flash_ble(device, size):
        print("Erase flash")

        size = size + FLASH_START_ADDRESS

        data = FLASH_START_ADDRESS.to_bytes(4, "little") + size.to_bytes(4, "little")

        command = create_payload(BFLB_EFLASH_LOADER_CMD_FLASH_ERASE, data)

    #    print_data(command)

        # write the bytes in three shots with a time delay betwoen, otherwise there is a strange bug where bytes get dropped
        await write_data(device, command)

        return (await get_response_ble(device))

    async def system_reset_command_ble(device):
        print("Resettting the newly programmed device...")

        data = int(0).to_bytes(1, "little")

        command = create_payload(BFLB_EFLASH_LOADER_CMD_RESET, data)

        await write_data(device, command)

    dev_addr = None
    if addr is None:
        device = None
        while device is None:
            devices = await BleakScanner.discover()
            for d in devices:
                if d.name is not None and "blf702_boot" in d.name:
                    print("Found device with information {}".format(d))
                    device = d
                    break
        if device:
            dev_addr = device.address
    else:
        dev_addr = addr
    if dev_addr:
        is_success = False
        for retry in range (0, 10):
            try: 
                async with BleakClient(dev_addr) as client:
                    for service in client.services:
                        for char in service.characteristics:
                            if char.uuid in BLE_WRITE_CHARACTERISTIC_UUID:
                                write_handle = char
                            if char.uuid in BLE_READ_CHARACTERISTIC_UUID:
                                read_handle = char
                    if write_handle is not None and read_handle is not None:
                        await client.start_notify(read_handle, notification_handler)
                        
                        ret = (await erase_flash_ble(client, len(fw_data)))
                        
                        if ret == 0:
                            FLASH_PAGE_SIZE = 4096
                            while len(fw_data) > 0:
                                print("Size left:", len(fw_data))
                                # if len(data) < FLASH_PAGE_SIZE:
                                #     data = data + bytearray([0]) * (FLASH_PAGE_SIZE - len(data))
                                #     print("Size left after append:", len(data))
                                # assert len(data) >= FLASH_PAGE_SIZE
                                ret = (await program_one_page_ble(client, fw_data[0 : FLASH_PAGE_SIZE]))
                                if ret != 0:
                                    break
                                fw_data = fw_data[FLASH_PAGE_SIZE:]
                            if ret == 0:
                                await system_reset_command_ble(client)
                                is_success = True

                    await client.disconnect()
            except Exception as e:
                print("Cannot connect device with error as {}".format(e))
            if is_success:
                break
            else:
                print("Upload failed, retry new transaction...")
                print("")

# Define the arguments for this program. This program takes in an optional -p option to specify the serial port device
# and it also takes a mandatory firmware file name
parser = argparse.ArgumentParser(description='Upgrade the firmware on a device')
parser.add_argument('-p', '--port', help='serial port device', default=None)
parser.add_argument('-P', '--PORT', help='show all ports on the system and let the user select from a menu', action="store_true")
parser.add_argument('-i', '--ini', help='Bootheader configuration file', default=None)
parser.add_argument('-b', '--bluetooth', help='Update over bluetooth', action="store_true", default=False)
parser.add_argument('-a', '--addr', help='Bluetooth address of device', default=None)
parser.add_argument('firmware_filename', help='new firmware file to send to the device')
args = parser.parse_args()

if args.PORT == True:
    serial_port = "MENU"
else:
    serial_port = args.port
firmware_filename = args.firmware_filename

cur_dir = str(pathlib.Path(__file__).parent.resolve())

config = configparser.ConfigParser()

if args.ini:
    config.read(args.ini)
else:
    config.read(cur_dir + '/bootheader_cfg.ini')

data = read_binary(firmware_filename)

# pad 0x00 until the length of the data is divisable by 16
while len(data) % 0x10 != 0:
    data = data + b'\x00'

data = add_boot_header(data, config)

# pad 0x00 until the length of the data is divisable by 256
while len(data) & 0xFF != 0:
    data = data + b'\xFF'

if len(data) > FLASH_TOTAL_SIZE:
    print("Error: the firmware is too big to fit in the flash")
    exit(1)

if args.bluetooth == False:
    ser = serial.Serial(port=serial_port, baudrate=921600, timeout=1)
    handshake(ser)
    time.sleep(0.6)
    erase_flash(ser, len(data))

    ser.timeout = 0.2

    while len(data) > 0:
        # if page_number > LAST_FIRMWARE_PAGE_NUMBER:
        #     print("Error: the firmware is too big to fit in the flash")
        #     exit(1)
        print("Size left:", len(data))
        # if len(data) < FLASH_PAGE_SIZE:
        #     data = data + bytearray([0]) * (FLASH_PAGE_SIZE - len(data))
        #     print("Size left after append:", len(data))
        # assert len(data) >= FLASH_PAGE_SIZE
        program_one_page(ser, data[0 : FLASH_PAGE_SIZE])
        data = data[FLASH_PAGE_SIZE:]

    system_reset_command(ser)

    time.sleep(0.1)

    ser.close()
else:
    asyncio.run(ble_process(data, args.addr))