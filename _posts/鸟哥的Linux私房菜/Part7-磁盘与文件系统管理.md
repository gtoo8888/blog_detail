---
title: Part7 磁盘与文件系统管理
date: 2022-03-12 21:27:18
tags:
- 鸟哥的Linux私房菜
---

# xfs_info 观察XFS文件系统

# df
 df（英文全拼：disk free） 命令用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计。

# du
du （英文全拼：disk usage）命令用于显示目录或文件的大小。

-h或--human-readable 以K，M，G为单位，提高信息的可读性
-s或--summarize 仅显示总计

du -h 
显示指定文件夹大小
du -h .ssh/
当前文件夹的总大小
du -sh

# ln 硬链接


# lsblk 列出所有磁盘列表

# blkid 列出设备的UUID等参数
UUID 全局唯一标识符

# parted 列出磁盘分区表类型与分区信息

# gdisk GPT分区

# fdisk MBR分区


# mount

# mknod

