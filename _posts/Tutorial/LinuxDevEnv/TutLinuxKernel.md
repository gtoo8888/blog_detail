---
title: Linux Kernal 教程
date: 2022-10-30 13:29:08
tags:
- 教程
---

# linux kernel

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_v7_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16



linux-imx-4.1.15-2.1.0-g3dc0a4b-v2.7/arch/arm/kernel/vmlinux.lds
linux-imx-4.1.15-2.1.0-g3dc0a4b-v2.7/arch/arm/kernel/head.S


#  rootfs(根文件系统)

Linux 移植三巨头： uboot、 Linux kernel、 rootfs(根文件系统)。


make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig



BusyBox


# 参考资料
[The U-Boot Documentation](https://docs.u-boot.org/en/latest/index.html)
[U-Boot gitlib](https://source.denx.de/u-boot/u-boot)
[BusyBox](https://www.busybox.net/)

[8.11 The origin Function](https://www.gnu.org/software/make/manual/html_node/Origin-Function.html)


