

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>

#define MOUSE_PATH "/dev/input/mice"

int main(void)
{
    int fd;

    if((fd = open(MOUSE_PATH, O_RDWR)) == -1)
    {
        printf("Can not open %s", MOUSE_PATH);
    }

    int8_t raw_data[3];
    int num_of_bytes_read;

    int x_pos = 0;
    int y_pos = 0;
    while(1){
        num_of_bytes_read = read(fd, raw_data, sizeof(raw_data));
        if(num_of_bytes_read > 0)
        {
            x_pos += raw_data[1];
            y_pos += raw_data[2];

            if(x_pos <= 0) x_pos = 0;
            if(y_pos <= 0) y_pos = 0;
            if(y_pos >= 608) y_pos = 608;
            if(x_pos >= 1080) x_pos = 1080;

            printf("%x\n", raw_data[0]);
            printf("%x\n", raw_data[1]);
            printf("%x\n", raw_data[2]);
            printf("%d  %d\n", x_pos, y_pos);
            printf("L: %d   |   R: %d   |   M: %d   |   x: %5d   |  y: %5d\n",
                                                                        raw_data[0] & 1,
                                                                        raw_data[0] & 2,
                                                                        raw_data[0] & 4,
                                                                        raw_data[1],
                                                                        raw_data[2]);
        }
    }

    close(fd);
    return 0;
}