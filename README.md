# bootloader_for_BL70x
This is a bootloader to load an application onto a BL702/BL704/BL706 chip over UART or BLE

**Guideline for how to use BL702 custom bootloader**

**1. Compilation:**

\- Install make, cmake

\- Download compiler tool using command:


\-git clone https://gitee.com/bouffalolab/toolchain_gcc_sifive_linux.git


\- Set PATH environment to bin folder of compiler tool.

\- Extract bl_mcu_sdk_boot_custom.zip file

\- Go to extracted folder and type as below for compilation:

make APP=boot2_custom BOARD=\<board_name\>

with board_name as :

bl702_iot: BL702 IOT board

bl702_rv: RV-Debugger-BL702 board

bl702_xt: XT-ZB1 Devkit

\- Output binary should be in
out/examples/boot2_custom/boot2_custom_bl702.bin

**2. Flashing:**

**2.1. Flash bootloader:**

\- For bl702_iot and bl702_rv, hold boot button and then plug in the USB
port to PC.

\- For XT-ZB1 Devkit board, if the COM port does not happen after above
steps. Insert a header to TX0, RX0 pins and connect a USB 2 COM device
to those pins. Then try to hold boot button and re-power the board, the
COM port should be happened after that.

\- After that, follow the guideline in "Bootloader_Guideline.doc" to
program the bootloader file except partition file should be
bl_mcu_sdk_boot_custom/examples/boot2_custom/partition_cfg_1M_boot2_ble.toml
instead of default file inside BLDevCube tool folder.

![](media/image1.png){width="5.0in" height="3.5625in"}\
\
**2.2. Flash application:**

**2.2.1 UART:**

\- Hardware setup:

\+ For bl702_rv: Connect TX and RX pins to a USB 2 COM device.

\+ For bl702_iot: Connect TXD and RXD pins to a USB 2 COM device.

\+ For XT-ZB1 Devkit: Connect TX0 and RX0 pins to a USB 2 COM device.

\- Software setup: Running python script in
bl_mcu_sdk_boot_custom/tools/boot_script/ with format as below:

upgrade_firmware.py -p \<**COM_port**\>
\<**path_to_application_binary_file**\> -i \<**path_to_ini_file**\>

**COM_port:** PC COM Port of USB 2 COM device

**path_to_application_binary_file:** Path to binary file of application

**path_to_ini_file:** Path to boot header configuration file if user
wants to use a custom configuration. (Optional, default file will be
bootheader_cfg.ini in same folder with python script)

**2.2.2 BLE:**

\- Hardware setup: Only need to turn on power of board.

\- Software setup:

\+ Install bleak library for python with command: python -m pip install
bleak

\+ Running python script in bl_mcu_sdk_boot_custom/tools/boot_script/
with format as below:

upgrade_firmware.py -b \<**path_to_application_binary_file**\> -i
\<**path_to_ini_file**\>

**path_to_application_binary_file:** Path to binary file of application

**path_to_ini_file:** Path to boot header configuration file if user
wants to use a custom configuration. (Optional, default file will be
bootheader_cfg.ini in same folder with python script)

**3. Linker file for application:**

\- Linker file for building application is at
bl_mcu_sdk_boot_custom/drivers/bl702_driver/bl702_flash.ld

## This is my-el

<my-el></my-el>

```js script
import { LitElement, html } from 'https://unpkg.com/lit-element?module';

class MyEl extends LitElement {
  render() {
    this.innerHTML = '<p style="color: red">I am alive</p>';
  }
}

customElements.define('my-el', MyEl);
```
