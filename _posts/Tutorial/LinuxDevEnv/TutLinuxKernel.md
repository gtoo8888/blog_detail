---
title: Linux Kernal 教程
date: 2022-10-30 13:29:08
tags:
- 教程
---

# linux kernel
编译流程，通过一下步骤可以编译出imx的linux内核
```bash
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- imx_v7_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- all -j16

sudo apt-get install u-boot-tools
sudo apt-get install gawk

sudo apt install mkbootimg
whereis mkbootimg
/usr/bin/mkbootimg
mkbootimg

```


linux-imx-4.1.15-2.1.0-g3dc0a4b-v2.7/arch/arm/kernel/vmlinux.lds
linux-imx-4.1.15-2.1.0-g3dc0a4b-v2.7/arch/arm/kernel/head.S
# 关注目录

arch
arch/arm
arch/arm/configs 
arch/arm/configs/imx_v7_defconfig
arch/arm/boot/dts  # 设备树文件
arch/arm/boot/dts/imx6ull-14x14-emmc-4.3-480x272-c.dts # EMMC对应设备树
arch/arm/boot # 编译后Image 和 zImage 
block # Linux 下块设备目录
crypto # 加密文件
drivers # 驱动目录文件
firmware # 存放固件
fs # 文件系统，比如 fs/ext2、 fs/ext4、 fs/f2fs 




## 关注文件

arch/arm/kernel/vmlinux.lds
stext
arch/arm/kernel/head.S
arch/arm/kernel/head-common.S 
__vet_atags 
__mmap_switched
init/main.c
start_kernel  # start_kernel 里面调用了大量的函数，每一个函数都是一个庞大的知识点
rest_init
kernel_thread(kernel_init, NULL, CLONE_FS);
pid = kernel_thread(kthreadd, NULL, CLONE_FS | CLONE_FILES); # kthreadd 进程负责所有内核进程的调度和管理
kernel_init
do_basic_setup # 用于完成 Linux 下设备驱动初始化工作




IRQ中断


#  rootfs(根文件系统)

Linux 移植三巨头： uboot、 Linux kernel、 rootfs(根文件系统)。


make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig



BusyBox


# 推荐书籍

Linux Kernel 四库全书

1. Linux内核设计与实现 Edition 2
2. 深入理解Linux内核（第三版）   
3. Linux设备驱动 Edition 3
4. Linux内核源代码情景分析——浙大

深入分析Linux内核源代码——陈莉君
Linux内核源代码分析——Scott Maxwell
深入Linux内核架构——

# 参考资料

[man page主页](https://man7.org/index.html)
[查看kernal源码](https://elixir.bootlin.com/linux/v4.1.15/source/)

[Linux内核代码大佬们如何观看的？](https://www.zhihu.com/question/439569498/answer/2967990818)

[BusyBox](https://www.busybox.net/)

[陈孝松个人主页 课程和视频](https://chenxiaosong.com/courses.html)
[linux内核经典书籍](https://zhuanlan.zhihu.com/p/34977296)
# T3C编译报错
[编译kernel提示"mkimage" command not found - U-Boot images will not be built](https://www.cnblogs.com/liangliangge/p/12848888.html)
https://wiki.sipeed.com/soft/Lichee/zh/Zero-Doc/Contribution/article_10.html

## 互斥锁
[【原创】Linux Mutex机制分析](https://www.cnblogs.com/LoyenWang/p/12826811.html)

