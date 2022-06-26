#include "bflb_eflash_loader.h"
#include "partition.h"
#include "blsp_common.h"
#include "xz_config.h"
#include "blsp_port.h"
#include "hal_boot2.h"
#include "bflb_platform.h"

uint8_t *g_eflash_loader_readbuf[2] = {NULL, NULL};
volatile uint32_t g_rx_buf_index = 0;
volatile uint32_t g_rx_buf_len = 0;
uint32_t g_eflash_loader_cmd_ack_buf[16];


static eflash_loader_if_cfg_t eflash_loader_if_cfg;
static volatile eflash_loader_if_type_t eflash_loader_if;

eflash_loader_if_cfg_t * bflb_eflash_loader_if_set(eflash_loader_if_type_t type)
{
	switch(type){
        case BFLB_EFLASH_LOADER_IF_UART:
            eflash_loader_if_cfg.if_type=(uint8_t)BFLB_EFLASH_LOADER_IF_UART;
            eflash_loader_if_cfg.if_type_onfail=(uint8_t)BFLB_EFLASH_LOADER_IF_JLINK;
            eflash_loader_if_cfg.disabled=0;
            eflash_loader_if_cfg.maxlen=BFLB_EFLASH_LOADER_READBUF_SIZE;
            eflash_loader_if_cfg.timeout=BFLB_EFLASH_LOADER_IF_UART_RX_TIMEOUT;
            eflash_loader_if_cfg.boot_if_init=bflb_eflash_loader_uart_init;
            eflash_loader_if_cfg.boot_if_handshake_poll=bflb_eflash_loader_uart_handshake_poll;
            eflash_loader_if_cfg.boot_if_recv=bflb_eflash_loader_uart_recv;
            eflash_loader_if_cfg.boot_if_send=bflb_eflash_loader_uart_send;
            eflash_loader_if_cfg.boot_if_wait_tx_idle=bflb_eflash_loader_usart_wait_tx_idle;
            eflash_loader_if_cfg.boot_if_deinit=bflb_eflash_loader_uart_deinit;
            //eflash_loader_if_cfg.boot_if_changerate=bflb_eflash_loader_uart_change_rate;

            return &eflash_loader_if_cfg;
        case BFLB_EFLASH_LOADER_IF_BLE:
            eflash_loader_if_cfg.if_type=(uint8_t)BFLB_EFLASH_LOADER_IF_BLE;
            eflash_loader_if_cfg.if_type_onfail=(uint8_t)BFLB_EFLASH_LOADER_IF_JLINK;
            eflash_loader_if_cfg.disabled=0;
            eflash_loader_if_cfg.maxlen=BFLB_EFLASH_LOADER_BLE_READBUF_SIZE;
            eflash_loader_if_cfg.timeout=BFLB_EFLASH_LOADER_IF_BLE_RX_TIMEOUT;
            eflash_loader_if_cfg.boot_if_init=bflb_eflash_loader_ble_init;
            eflash_loader_if_cfg.boot_if_handshake_poll=bflb_eflash_loader_ble_handshake_poll;
            eflash_loader_if_cfg.boot_if_recv=bflb_eflash_loader_ble_recv;
            eflash_loader_if_cfg.boot_if_send=bflb_eflash_loader_ble_send;
            eflash_loader_if_cfg.boot_if_wait_tx_idle=bflb_eflash_loader_ble_wait_tx_idle;
            eflash_loader_if_cfg.boot_if_deinit=bflb_eflash_loader_ble_deinit;
            //eflash_loader_if_cfg.boot_if_changerate=bflb_eflash_loader_uart_change_rate;

            return &eflash_loader_if_cfg;
        default:
            break;
	}

    eflash_loader_if = type;

	return NULL;
}

eflash_loader_if_type_t bflb_eflash_loader_if_get(void)
{
    return eflash_loader_if;
}

int32_t bflb_eflash_loader_if_init()
{
	return eflash_loader_if_cfg.boot_if_init();
}

int32_t bflb_eflash_loader_if_handshake_poll(uint32_t timeout)
{
	return eflash_loader_if_cfg.boot_if_handshake_poll(timeout);
}

uint32_t *bflb_eflash_loader_if_read(uint32_t *read_len)
{
	return eflash_loader_if_cfg.boot_if_recv(read_len,eflash_loader_if_cfg.maxlen,eflash_loader_if_cfg.timeout);
}

int32_t bflb_eflash_loader_if_write(uint32_t *data,uint32_t len)
{
	return eflash_loader_if_cfg.boot_if_send(data,len);
}

int32_t bflb_eflash_loader_if_wait_tx_idle(uint32_t timeout)
{
	return eflash_loader_if_cfg.boot_if_wait_tx_idle(timeout);
}

int32_t bflb_eflash_loader_if_deinit()
{
	return eflash_loader_if_cfg.boot_if_deinit();
}


int32_t bflb_eflash_loader_main()
{
    int32_t ret;
    uint32_t total_len;
    uint32_t i, tmp, cmd_len;
    uint8_t *recv_buf = NULL;
    uint8_t err_cnt = 0;
    uint8_t to_cnt = 0;
    uint8_t is_break_err = 0;

    MSG("bflb_eflash_loader_main\r\n");
    pt_table_dump();
    ret = pt_table_get_iap_para(&p_iap_param);
    if(0 != ret){
        MSG("no valid partition table\r\n");
        return -1;
    }

    while (1) {
        to_cnt = 0;
        total_len = 0;

        do {
            total_len = 0;
            recv_buf = (uint8_t *)bflb_eflash_loader_if_read(&total_len);

            if (total_len <= 0) {
                to_cnt++;
            }
        } while (to_cnt < 2 && total_len <= 0);

        if (to_cnt >= 2 || total_len <= 0) {
            is_break_err = 1;
            MSG("rcv err break\r\n");
            break;
        }

        MSG("Recv\r\n");
        //eflash_loader_dump_data(recv_buf,total_len);
        cmd_len = recv_buf[2] + (recv_buf[3] << 8);

        /* Check checksum*/
        if (recv_buf[1] != 0) {
            tmp = 0;

            for (i = 2; i < cmd_len + 4; i++) {
                tmp += recv_buf[i];
            }

            if ((tmp & 0xff) != recv_buf[1]) {
                /* FL+Error code(2bytes) */
                MSG("Checksum error %02x\r\n", tmp & 0xff);
                g_eflash_loader_cmd_ack_buf[0] = BFLB_EFLASH_LOADER_CMD_NACK | ((BFLB_EFLASH_LOADER_CMD_CRC_ERROR << 16) & 0xffff0000);
                bflb_eflash_loader_if_write(g_eflash_loader_cmd_ack_buf, 4);//ToDo
                continue;
            }
        }

        ret = bflb_eflash_loader_cmd_process(recv_buf[0], recv_buf + 4, cmd_len);

        if (ret != BFLB_EFLASH_LOADER_SUCCESS) {
            MSG(" CMD Pro Ret %d\r\n", ret);

            err_cnt++;

            if (err_cnt > 2) {
                is_break_err = 1;
                break;
            }
        }
    }

    /* read data finished,deinit and go on*/
    if (!is_break_err)
        bflb_eflash_loader_if_deinit();//ToDo

    return 0;
}




