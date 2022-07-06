/**
  ******************************************************************************
  * @file    blsp_eflash_loader_ble.c
  * @version V1.2
  * @date
  * @brief   This file is the peripheral case header file
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
#include "bflb_eflash_loader.h"
#include "bflb_platform.h"
#include "blsp_port.h"
#include "blsp_common.h"
#include "partition.h"
#include "hal_uart.h"
#include "drv_device.h"
#include "hal_boot2.h"
#include <FreeRTOS.h>
#include <task.h>

#include "bluetooth.h"
#include "conn.h"
#include "gatt.h"
#include "hci_core.h"
#include "hci_driver.h"
#include "ble_lib_api.h"
#include "bl702_sec_eng.h"

static struct bt_conn *ble_bl_conn = NULL;
static volatile uint8_t is_rcv_msg = 0;
static struct bt_gatt_exchange_params exchg_mtu;

void bflb_eflash_loader_ble_if_enable_int(void)
{

}

void bflb_eflash_loader_ble_if_send(uint8_t *data, uint32_t len)
{

}

int32_t bflb_eflash_loader_ble_if_wait_tx_idle(uint32_t timeout)
{
    return 0;
}

static int ble_blf_recv(struct bt_conn *conn,
              const struct bt_gatt_attr *attr, const void *buf,
              u16_t len, u16_t offset, u8_t flags)
{
    uint8_t *ble_buf = (uint8_t *)buf;
    uint8_t *rcv_buf = g_eflash_loader_readbuf[0];

    if (g_rx_buf_len >= BFLB_EFLASH_LOADER_BLE_READBUF_SIZE) {
        g_rx_buf_len = 0;
    }

    arch_memcpy(&rcv_buf[g_rx_buf_len], &ble_buf[1], len - 1);
    g_rx_buf_len += len - 1;

    if (!ble_buf[0]) {
        is_rcv_msg = 1;
    }
    
    return 0;
}

static void ble_cfg_changed(const struct bt_gatt_attr *attr, u16_t vblfue)
{
    if(vblfue == BT_GATT_CCC_NOTIFY) {
        
     MSG("enable notify.\n");
  
    } else {
        MSG("disable notify.\n");
    }
}

static void ble_tx_mtu_size(struct bt_conn *conn, u8_t err,
                               struct bt_gatt_exchange_params *params)
{

}

static void bl_connected(struct bt_conn *conn, uint8_t err)
{
    int tx_octets = 0x00fb;
    int tx_time = 0x0848;
    struct bt_le_conn_param param;

    param.interval_max=0x28;
    param.interval_min=0x18;
    param.latency=0;
    param.timeout=400;

     MSG("%s err %d\n", __FUNCTION__, err);

	if (err) {

	} else {
        ble_bl_conn = conn;
        bt_conn_le_param_update(conn, &param);

        if (!bt_le_set_data_len(ble_bl_conn, tx_octets, tx_time)) {
            exchg_mtu.func = ble_tx_mtu_size;
            //exchange mtu size after connected.
            bt_gatt_exchange_mtu(ble_bl_conn, &exchg_mtu);
        }

        if (!g_eflash_loader_readbuf[0])
        {
            g_eflash_loader_readbuf[0] = pvPortMalloc(BFLB_EFLASH_LOADER_BLE_READBUF_SIZE);
            arch_memset(g_eflash_loader_readbuf[0], 0, BFLB_EFLASH_LOADER_BLE_READBUF_SIZE);
        } else {
            vPortFree(g_eflash_loader_readbuf[0]);
            vPortFree(g_eflash_loader_readbuf[1]);

            g_eflash_loader_readbuf[0] = pvPortMalloc(BFLB_EFLASH_LOADER_BLE_READBUF_SIZE);
            arch_memset(g_eflash_loader_readbuf[0], 0, BFLB_EFLASH_LOADER_BLE_READBUF_SIZE);
        }
        
        bflb_eflash_loader_if_set(BFLB_EFLASH_LOADER_IF_BLE);
	}
}

static void bl_disconnected(struct bt_conn *conn, uint8_t reason)
{
    MSG("%s reason %d\n", __FUNCTION__, reason);
    if (!g_eflash_loader_readbuf[0])
    {
        vPortFree(g_eflash_loader_readbuf[0]);
    }

    ble_bl_conn = NULL;

    bflb_eflash_loader_if_set(BFLB_EFLASH_LOADER_IF_UART);
}

static const struct bt_data ad[] = {
	BT_DATA_BYTES(BT_DATA_FLAGS, (BT_LE_AD_GENERAL | BT_LE_AD_NO_BREDR)),
	BT_DATA(BT_DATA_NAME_COMPLETE, "BL_702_Boot2", sizeof("BL_702_Boot2")),
    BT_DATA(BT_DATA_MANUFACTURER_DATA, "BL_702", 6),
    
};
static struct bt_gatt_attr blattrs[]= {
    BT_GATT_PRIMARY_SERVICE(BT_UUID_DECLARE_16(0xFFF0)),

    BT_GATT_CHARACTERISTIC(BT_UUID_DECLARE_128(BT_UUID_128_ENCODE(0x00070001, 0x0745, 0x4650, 0x8d93, 0xdf59be2fc10a)),
                            BT_GATT_CHRC_READ | BT_GATT_CHRC_NOTIFY,
                            BT_GATT_PERM_READ,
                            NULL,
                            NULL,
                            NULL),

    BT_GATT_CCC(ble_cfg_changed, BT_GATT_PERM_READ | BT_GATT_PERM_WRITE),

    BT_GATT_CHARACTERISTIC(BT_UUID_DECLARE_128(BT_UUID_128_ENCODE(0x00070002, 0x0745, 0x4650, 0x8d93, 0xdf59be2fc10a)),
                            BT_GATT_CHRC_WRITE_WITHOUT_RESP,
                            BT_GATT_PERM_WRITE,
                            NULL,
                            ble_blf_recv,
                            NULL)
};

static struct bt_gatt_service ble_bl_server = BT_GATT_SERVICE(blattrs);

static struct bt_conn_cb conn_callbacks = {
	.connected = bl_connected,
	.disconnected = bl_disconnected,
};

void bt_enable_cb(int err)
{
    uint8_t data[32];
    char str[100] = {0};
    
    if (!err) {
        Sec_Eng_Trng_Read(data);
        sprintf(str, "blf702_boot_%02X%02X", data[30], data[31]);
        
        bt_set_name(str);

        bt_conn_cb_register(&conn_callbacks);
        bt_gatt_service_register(&ble_bl_server);
        bt_le_adv_start(BT_LE_ADV_CONN_NAME, ad, ARRAY_SIZE(ad), NULL, 0);
    }
}

int32_t bflb_eflash_loader_ble_init()
{
    GLB_Set_EM_Sel(GLB_EM_8KB);
    ble_controller_init(configMAX_PRIORITIES - 1);
    // Initialize BLE Host stack
    hci_driver_init();

    bt_enable(bt_enable_cb);

    return BFLB_EFLASH_LOADER_SUCCESS;
}

int32_t bflb_eflash_loader_ble_handshake_poll(uint32_t timeout)
{
    if (ble_bl_conn) {
        return 0;
    }
    return -1;
}

uint32_t *bflb_eflash_loader_ble_recv(uint32_t *recv_len, uint32_t maxlen, uint32_t timeout)
{
    uint32_t *rcv_buf = NULL;

    if (ble_bl_conn) {
        while(timeout) {
            if (is_rcv_msg) {
                *recv_len = g_rx_buf_len;
                g_rx_buf_len = 0;
                is_rcv_msg = 0;
                rcv_buf = (uint32_t *)g_eflash_loader_readbuf[0];
                break;
            }

            timeout -= 100;
            vTaskDelay(pdMS_TO_TICKS(100));
        }
        return rcv_buf;
    }
    return rcv_buf;
}

int32_t bflb_eflash_loader_ble_send(uint32_t *data, uint32_t len)
{
    MSG("%s len %u\n", __FUNCTION__, len);

    if (ble_bl_conn) {
        return bt_gatt_notify(ble_bl_conn, &blattrs[1], (const void*)data, (uint16_t)len);
    }
    
    return -1;
}

int32_t bflb_eflash_loader_ble_wait_tx_idle(uint32_t timeout)
{
    return BFLB_EFLASH_LOADER_SUCCESS;
}

int32_t bflb_eflash_loader_ble_change_rate(uint32_t oldval, uint32_t newval)
{
    return BFLB_EFLASH_LOADER_SUCCESS;
}

int32_t bflb_eflash_loader_ble_deinit()
{
    return BFLB_EFLASH_LOADER_SUCCESS;
}

void bflb_eflash_loader_ble_stop(void)
{
    if (ble_bl_conn) {
        bt_conn_disconnect(ble_bl_conn, BT_HCI_ERR_REMOTE_USER_TERM_CONN);
    }
    bt_le_adv_stop();
    bt_disable();
    // ble_controller_deinit();
}
