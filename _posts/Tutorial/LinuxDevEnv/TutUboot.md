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


# U-Boot主要关心文件夹
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

# U-Boot 启动流程详解
第三十二章 U-Boot 启动流程详解


u-boot.lds
arch/arm/lib/vectors.S
u-boot.map
__image_copy_star
arch/arm/cpu/armv7/start.S
cpu_init_cp15
cpu_init_crit
_main
arch/arm/cpu/armv7/lowlevel_init.S 
arch/arm/cpu/armv7/mx6/soc.c
arch/arm/lib/crt0.S
common/init/board_init.c
include/asm-generic/global_data.h
 common/board_f.c 


sp指针

# 参考资料
[The U-Boot Documentation](https://docs.u-boot.org/en/latest/index.html)
[U-Boot gitlib](https://source.denx.de/u-boot/u-boot)


[8.11 The origin Function](https://www.gnu.org/software/make/manual/html_node/Origin-Function.html)


