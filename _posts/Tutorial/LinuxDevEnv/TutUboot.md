---
title: U-Boot 教程
date: 2022-10-30 13:17:02
tags:
- 教程
---




sudo apt-get install libncurses5-dev

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_14x14_ddr512_emmc_defconfig
make V=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 


在编译 uboot 之前一定要使用 defconfig 来配置 uboot！

arch
arch/arm
arch/arm/cpu
arch/arm/cpu/u-boot.lds
arch/arm/imx-common
arch/arm/lib/vectors.S
board/freescale/mx6ul_14x14_ddr3_arm2
configs/mx6ul_14x14_ddr3_arm2_emmc_defconfig
configs/mx6ul_14x14_ddr3_arm2_nand_defconfig
.u-boot.bin.cmd
.u-boot-nodtb.bin.cmd
.u-boot.cmd
Makefile
cmd/Makefile
u-boot.XXX
.config
include/configs/mx6ullevk.h


arm-linux-gnueabihf-ld.bfd # 链接工具





makefile 
origin函数
filter函数
firstword函数
export





# 参考资料
[The U-Boot Documentation](https://docs.u-boot.org/en/latest/index.html)
[U-Boot gitlib](https://source.denx.de/u-boot/u-boot)


[8.11 The origin Function](https://www.gnu.org/software/make/manual/html_node/Origin-Function.html)


