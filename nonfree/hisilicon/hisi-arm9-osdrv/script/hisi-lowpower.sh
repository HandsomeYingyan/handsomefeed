#!/bin/sh


#�ر�USB PHY���ܵ�Դ��0x20120078 [12]bit����Ϊ0
devmem  0x20120078 32 0x0c0301a0

#�ر�USB 2.0 PHY��ʱ�ӣ�0x200300b8 [7]bit����0
devmem  0x200300b8 32 0x127

#SAR ADC POWER_DOWN_MODEL���򿪺��ڲ�ʹ��ADC��ʱ���Զ�power_down��[14]bit����1
devmem  0x200b0000 32 0x0000c0ff

#��PWM
devmem  0x20030038 32 0x2

#�ر�IR [0]bit����0
devmem  0x20070000 32 0x0

#IR �ܽŸ��ó�gpio
devmem  0x200f0070 32 0x0

#UART2��ʹ�ܣ�0x200A0000 [9][8][0]bit������Ϊ0
devmem  0x200A0030 32 0x0

#UART2�ܽŸ��ó�gpio
devmem  0x200f00cc 32 0x0
devmem  0x200f00d0 32 0x0

#�ر�SPI0��SPI1
devmem  0x200C0004 32 0x7F00
devmem  0x200E0004 32 0x7F00

#spi0 �ܽŸ��ó�gpio
devmem  0x200f0040 32 0x0    # 000��GPIO3_3��
devmem  0x200f0044 32 0x0    # 000��GPIO3_4��
devmem  0x200f0048 32 0x0    # 000��GPIO3_5��
devmem  0x200f004c 32 0x0    # 000��GPIO3_6��

#spi1 �ܽŸ��ó�gpio
devmem  0x200f0030 32 0x0    # 000��GPIO0_3��
devmem  0x200f0050 32 0x0    # 000��GPIO3_7��
devmem  0x200f0054 32 0x0    # 000��GPIO4_0��
devmem  0x200f0058 32 0x0    # 000��GPIO4_1��
devmem  0x200f005c 32 0x0    # 000��GPIO4_2��

#AUDIO CODEC LINE IN �ر�������
#devmem  0x20050068 32 0xa8022c2c
#devmem  0x2005006c 32 0xf5035a4a
