

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include "address_base.h"

#include <sys/mman.h>
#include "hwlib.h"

#define MOUSE_PATH "/dev/input/mice"
#define MEM_PATH "/dev/mem"

#define ALT_LWFPGASLVS_OFST 0xFF200000

#define HW_REGS_BASE ( 0xFC000000 )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main(void)
{
    int fd_mouse;
    int fd_mem;

    void*	lw_virtual_base;
    void*   display_virtual_addr;
    void*   speed_virtual_addr;

    if((fd_mouse = open(MOUSE_PATH, O_RDWR)) == -1)
    {
        printf("Can't open %s!\n", MOUSE_PATH);
    }

    if ((fd_mem = open(MEM_PATH, (O_RDWR | O_SYNC))) == -1) {
		printf("Can't open %s!\n", MEM_PATH);
		
		return 1;
	}

    lw_virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd_mem, HW_REGS_BASE);

    if (lw_virtual_base == MAP_FAILED) {
		printf("mmap() failed\n");
		close(fd_mem);
        close(fd_mouse);

		return 1;
	}

    display_virtual_addr = lw_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + PIO_0_BASE) & (unsigned long)(HW_REGS_MASK));
    speed_virtual_addr = lw_virtual_base + ((unsigned long)(ALT_LWFPGASLVS_OFST + PIO_1_BASE) & (unsigned long)(HW_REGS_MASK));

    int8_t raw_data[3];
    int num_of_bytes_read;

    int x_pos = 0;
    int y_pos = 0;

    uint32_t data_to_send = 0;

    int8_t p_l_btn = 0;
    int8_t p_r_btn = 0;

    int8_t l_btn = 0;
    int8_t r_btn = 0;

    uint8_t l_count = 0;
    uint8_t r_count = 0;

    void button_press_count(int8_t p_btn, int8_t btn, uint8_t* count)
    {
        if(btn - p_btn == 1)//rising edge
        {
            (*count)++;
        }
    }

    while(1)
    {
        num_of_bytes_read = read(fd_mouse, raw_data, sizeof(raw_data));
        if(num_of_bytes_read > 0)
        {
            x_pos += raw_data[1];
            y_pos += raw_data[2];

            if(x_pos <= 0) x_pos = 0;
            if(y_pos <= 0) y_pos = 0;
            if(x_pos >= 99) x_pos = 99;
            if(y_pos >= 99) y_pos = 99;

            p_l_btn = l_btn;
            p_r_btn = r_btn;

            l_btn = !!(raw_data[0] & 1);
            r_btn = !!(raw_data[0] & 2);

            button_press_count(p_l_btn, l_btn, &l_count);
            button_press_count(p_r_btn, r_btn, &r_count);
            
            l_count = l_count % 10;
            r_count = r_count % 10;

            printf("x: %2d  |   y: %2d    |   l: %d   |   r: %d\n", x_pos, y_pos, l_count, r_count);

            data_to_send = x_pos | (y_pos << 8) | (l_count << 16) | (r_count <<24);
            *((uint32_t*)display_virtual_addr) = data_to_send;
            *((uint32_t*)speed_virtual_addr) = raw_data[1]; 
        }
    }

    if (munmap(lw_virtual_base, HW_REGS_SPAN) != 0) {
		printf("munmap() failed...\n");
	}

    close(fd_mem);
    close(fd_mouse);
    return 0;
}