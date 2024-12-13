---
title: U-Boot 教程
date: 2022-10-30 13:17:02
tags:
- 教程
---


```bash
sudo apt-get install libncurses5-dev

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_14x14_ddr512_emmc_defconfig
make V=0 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 
```

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

```C++
U_BOOT_CMD(
	key_test, 1, 0,	do_key_test,
	"Test the key value\n",
	""
);

U_BOOT_CMD_COMPLETE(key_test, 1, 0, do_key_test, "Test the key value\n", "", NULL)


ll_entry_declare(cmd_tbl_t, key_test, cmd) = 
	U_BOOT_CMD_MKENT_COMPLETE(key_test, 1, 0, do_key_test, "Test the key value\n", "", NULL);

cmd_tbl_t _u_boot_list_2_cmd_2_key_test __aligned(4) 
			__attribute__((unused, section(".u_boot_list_2_cmd_2_key_test"))) =
	U_BOOT_CMD_MKENT_COMPLETE(key_test, 1, 0, do_key_test, "Test the key value\n", "", NULL);


cmd_tbl_t _u_boot_list_2_cmd_2_key_test __aligned(4) 
			__attribute__((unused, section(".u_boot_list_2_cmd_2_key_test"))) = 
{
    "key_test", // #_name 展开为字符串字面量 "key_test"
    1,          // _maxargs
    0,          // _rep
    do_key_test,// _cmd
    "Test the key value\n", // _usage
    ""          // _help
    NULL        // _comp
};
```


```C++
U_BOOT_CMD(
	key_test, 1, 0,	do_key_test,
	"Test the key value\n",
	""
);

#define U_BOOT_CMD(_name, _maxargs, _rep, _cmd, _usage, _help)		\
	U_BOOT_CMD_COMPLETE(_name, _maxargs, _rep, _cmd, _usage, _help, NULL)


#define U_BOOT_CMD_COMPLETE(_name, _maxargs, _rep, _cmd, _usage, _help, _comp) \
	ll_entry_declare(cmd_tbl_t, _name, cmd) =			\
		U_BOOT_CMD_MKENT_COMPLETE(_name, _maxargs, _rep, _cmd,	\
						_usage, _help, _comp);

#define ll_entry_declare(_type, _name, _list)				\
	_type _u_boot_list_2_##_list##_2_##_name __aligned(4)		\
			__attribute__((unused,				\
			section(".u_boot_list_2_"#_list"_2_"#_name)))


#define U_BOOT_CMD_MKENT_COMPLETE(_name, _maxargs, _rep, _cmd,		\
				_usage, _help, _comp)			\
		{ #_name, _maxargs, _rep, _cmd, _usage,			\
			_CMD_HELP(_help) _CMD_COMPLETE(_comp) }

typedef struct cmd_tbl_s	cmd_tbl_t;
```

# 编译lichee uboot

# 编译T3C遇到问题

## 总体编译流程
1. 编译brandy中uboot
2. 使用根目录build.sh
   1. 编译linux-3.10，
   2. 编译buildroot
3. 生成结果在out

## 编译uboot

问题：
1. toolchain原文件有问题，需要重新解压
2. build.sh脚本有问题，无法正确识别参数，不会控制非法输入
   1. 改进为可以准备toolchain



## 编译全部
```bash
# 1. mkimage
# "mkimage" command not found 
sudo apt-get install u-boot-tools

# 2. gwak
# awk: line 2: function strtonum never defined
sudo apt-get install gawk

# 2. mkbootimg
# no such file or directory: ./mkbootimg
# 包提供的mkbootimg无法运行有问题
# 自己使用apt下载
# 将/usr/bin/mkbootimg移动到原来的lichee/tools/pack/pctools/linux/android目录
sudo apt install mkbootimg
whereis mkbootimg
/usr/bin/mkbootimg
mkbootimg



# 成功界面
INFO: build kernel OK.
INFO: ----------------------------------------
INFO: build lichee OK.
INFO: ----------------------------------------
```

# 参考资料
[The U-Boot Documentation](https://docs.u-boot.org/en/latest/index.html)
[U-Boot gitlib](https://source.denx.de/u-boot/u-boot)
[在线查看源码](https://elixir.bootlin.com/u-boot/v2024.10/source)
[uboot下载链接](https://ftp.denx.de/pub/u-boot/)
[uboot构建框架6-u-boot.bin生成过程追踪](https://blog.csdn.net/sunxiaohusunke/article/details/90747854)
[uboot构建框架7-u-boot.imx生成过程追踪](https://blog.csdn.net/sunxiaohusunke/article/details/90763083)
[uboot构建框架2-kbuild框架简要分析](https://blog.csdn.net/sunxiaohusunke/article/details/90712298)