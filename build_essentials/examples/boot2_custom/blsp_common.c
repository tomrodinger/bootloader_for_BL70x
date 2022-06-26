/**
  ******************************************************************************
  * @file    blsp_common.c
  * @version V1.2
  * @date
  * @brief   This file is the peripheral case c file
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2018 Bouffalo Lab</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of Bouffalo Lab nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "blsp_port.h"
#include "bflb_platform.h"
#include "blsp_bootinfo.h"
#include "blsp_common.h"
#include "blsp_media_boot.h"
#include "hal_flash.h"
#include "hal_boot2.h"
#include "bflb_eflash_loader.h"
#include "hal_clock.h"
#include <FreeRTOS.h>
#include <task.h>
#include "bflb_eflash_loader_ble.h"

// uint8_t g_malloc_buf[BFLB_BOOT2_XZ_MALLOC_BUF_SIZE] __attribute__((section(".noinit_data")));

int32_t blsp_boot2_set_encrypt(uint8_t index, boot2_image_config *g_boot_img_cfg);

/****************************************************************************/ /**
 * @brief  Dump data
 *
 * @param  datain: Data pointer to dump
 * @param  len: Data length to dump
 *
 * @return None
 *
*******************************************************************************/
void blsp_dump_data(void *datain, int len)
{
    int i = 0;
    uint8_t *data = (uint8_t *)datain;
    data = data;

    for (i = 0; i < len; i++) {
        if (i % 16 == 0 && i != 0) {
            MSG("\r\n");
        }

        MSG("%02x ", data[i]);
    }

    MSG("\r\n");
}

/****************************************************************************/ /**
 * @brief  Media boot pre-jump
 *
 * @param  None
 *
 * @return BL_Err_Type
 *
*******************************************************************************/
int32_t blsp_mediaboot_pre_jump(void)
{
    /* Stop BLE */
    bflb_eflash_loader_ble_stop();

    /* Stop interrupts to avoid scheduler running */
    portDISABLE_INTERRUPTS();

    /* reinit mtimer clock */
    system_mtimer_clock_reinit();

    /* deinit uart */
    hal_boot2_debug_uart_gpio_deinit();

    /* Sec eng deinit*/
    hal_boot2_reset_sec_eng();

    /* Platform deinit */
    bflb_platform_deinit();

    /* Jump to entry */
    blsp_boot2_jump_entry();

    return BFLB_BOOT2_SUCCESS;
}

/****************************************************************************/ /**
 * @brief  Boot2 exit with error and will stay forever
 *
 * @param  None
 *
 * @return None
 *
*******************************************************************************/
void blsp_boot2_exit(void)
{
    hal_boot2_sboot_finish();

    /* Release other CPUs*/
    if (g_cpu_count != 1 && !g_boot_img_cfg[0].halt_cpu1) {
        blsp_boot2_releae_other_cpu();
    }

    /* Stay here */
    while (1) {
        /* Use soft delay only */
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}

/****************************************************************************/ /**
 * @brief  Boot2 jump to entry_point
 *
 * @param  None
 *
 * @return None
 *
*******************************************************************************/
void ATTR_TCM_SECTION blsp_boot2_jump_entry(void)
{
    pentry_t pentry;
    uint32_t i = 0;
    int32_t ret;

    hal_boot2_sboot_finish();

    /*Note:enable cache with flash offset, after this, should be no flash directl read,
      If need read, should take flash offset into consideration */
    if (0 != g_efuse_cfg.encrypted[0]) {
        /*for encrypted img, use none-continuos read*/
        ret = flash_set_cache(0, g_boot_img_cfg[0].cache_enable, g_boot_img_cfg[0].cache_way_disable, g_boot_img_cfg[0].img_start.flash_offset);
    } else {
        /*for unencrypted img, use continuos read*/
        ret = flash_set_cache(1, g_boot_img_cfg[0].cache_enable, g_boot_img_cfg[0].cache_way_disable, g_boot_img_cfg[0].img_start.flash_offset);
    }

    if (ret != BFLB_BOOT2_SUCCESS) {
        return;
    }

    /* Set decryption before read MSP and PC*/
    if (0 != g_efuse_cfg.encrypted[0]) {
        blsp_boot2_set_encrypt(0, &g_boot_img_cfg[0]);
        blsp_boot2_set_encrypt(1, &g_boot_img_cfg[1]);
        /* Get msp and pc value */
        for (i = 0; i < g_cpu_count; i++) {
            if (g_boot_img_cfg[i].img_valid) {
                //if(bootImgCfg[i].entryPoint==0){
#ifdef ARCH_ARM
                blsp_mediaboot_read(g_boot_img_cfg[i].img_start.flash_offset,
                                    (uint8_t *)&g_boot_img_cfg[i].msp_val, 4);
                blsp_mediaboot_read(bootImgCfg[i].imgStart.flashOffset + 4,
                                    (uint8_t *)&g_boot_img_cfg[i].entry_point, 4);
#endif
                //}
            }
        }
        if (blsp_boot2_get_feature_flag() == BLSP_BOOT2_CP_FLAG) {
            /*co-processor*/
            g_boot_img_cfg[1].img_start.flash_offset = g_boot_img_cfg[0].img_start.flash_offset;
            g_boot_img_cfg[1].msp_val = g_boot_img_cfg[0].msp_val;
            g_boot_img_cfg[1].entry_point = g_boot_img_cfg[0].entry_point;
            g_boot_img_cfg[1].cache_enable = g_boot_img_cfg[0].cache_enable;
            g_boot_img_cfg[1].img_valid = 1;
            g_boot_img_cfg[1].cache_way_disable = 0xf;
        }
    }

    /* Deal CPU0's entry point */
    if (g_boot_img_cfg[0].img_valid) {
        pentry = (pentry_t)g_boot_img_cfg[0].entry_point;

        if (g_boot_img_cfg[0].msp_val != 0) {
            __set_MSP(g_boot_img_cfg[0].msp_val);
        }

        /* Release other CPUs unless user halt it */
        if (g_cpu_count != 1 && !g_boot_img_cfg[0].halt_cpu1) {
            blsp_boot2_releae_other_cpu();
        }

        if (pentry != NULL) {
            pentry();
        }
    }

    /* Release other CPUs unless user halt it */
    if (g_cpu_count != 1 && !g_boot_img_cfg[0].halt_cpu1) {
        blsp_boot2_releae_other_cpu();
    }

    /* If cann't jump stay here */
    while (1) {
        /*use soft delay only */
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}
