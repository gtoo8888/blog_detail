---
title: Part7 磁盘与文件系统管理
date: 2022-03-12 21:27:18
tags:
- 鸟哥的Linux私房菜
---

# xfs_info 观察XFS文件系统

# 外围设备
在 Linux 中，外围设备都位于 /dev 挂载点，内核通过以下的方式理解硬盘：

/dev/hdX[a-z]: IDE 硬盘被命名为 hdX
/dev/sdX[a-z]: SCSI 硬盘被命名为 sdX
/dev/xdX[a-z]: XT 硬盘被命名为 xdX
/dev/vdX[a-z]: 虚拟硬盘被命名为 vdX
/dev/fdN: 软盘被命名为 fdN
/dev/scdN or /dev/srN: CD-ROM 被命名为 /dev/scdN 或 /dev/srN

# 7.2 档案系统的简单操作
## 7.2.1 df
用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计
查看一下有没有usb设备在挂载使用
```bash
df -h # 查看当前磁盘使用情况
df -T # 输出文件系统类型
df -a # 包括伪、重复、不可访问的文件系统
```

## 7.2.1 du
用于显示目录或文件的大小
-h以K，M，G为单位，提高信息的可读性
-s或--summarize 仅显示总计


```bash
# 常用指令
du -h myfile # 当前文件夹的总大小
du -sh * # 查看当前文件夹下每个文件的大小
```

# 7.3 磁盘的分割、格式化、检验与挂载


7.3磁盘的分割、格式化、检验与挂载
7.3.1观察磁盘分割状态：，lsblk, blkid, parted
7.3.2磁盘分割gdisk/fdisk: gdisk，partprobe，fdisk
7.3.3磁盘格式化（建置档案系统）: mkfs.xfs，mkfs.xfs for raid, mkfs.ext4, mkfs
7.3.4档案系统检验：xfs_repair，fsck.ext4
7.3.5档案系统挂载与卸载：mount，umount
7.3.6磁盘/档案系统参数修订：mknod，xfs_admin, uuidgen, tune2fs


## 7.3.1观察磁盘分割状态
### 1) lsblk 列出所有磁盘列表

### 2) blkid
对系统的块设备（包括交换分区）所使用的文件系统类型、LABEL、UUID等信息进行查询
```bash
# 常用指令
sudo blkid -s <tag>    显示指定信息，默认显示所有信息
sudo blkid # 列出系统中所有已挂载文件系统的类型
sudo blkid /dev/sdb # 指定设备挂载类型
sudo blkid -s UUID # 显示所有设备UUID
sudo blkid -s UUID /dev/sdb # 显示指定设备UUID
```

### 3) parted

## 7.3.2 磁盘分割gdisk/fdisk

### 1) gdisk

### 3）fdisk
用于磁盘分区的工具，可以创建、编辑、删除和显示硬盘分区
fdisk创建MBR分区，最大支持2TB
gdisk创建GPT分区，最大支持18EB，1EB=1024PB，1PB=1024TB
```bash
# 常用指令
sudo fdisk -l # 显示设备的分区表信息
sudo fdisk -l /dev/sdb # 示设备/dev/sda的分区表信息
sudo fdisk /dev/sdb # 进入交互界面，操作扇区
# 可以创建新的扇区、删除分区
```


## 7.3.2 磁盘分割gdisk/fdisk

# 其他指令
ln 硬链接


lsblk 

UUID 全局唯一标识符

parted 列出磁盘分区表类型与分区信息


mount

mknod


sudo mount /data /dev/sdb

lsblk

sudo vim /etc/fstab

# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=b6cadca7-c9a1-4f04-8700-93b842e948ef /               ext4    errors=remount-ro 0       1
/swapfile                                 none            swap    sw              0       0


e7dac072-5f03-41c4-bca2-0745d8e33c38 /date               ext4    defaults  0       1
/dev/sdb: UUID="e7dac072-5f03-41c4-bca2-0745d8e33c38" TYPE="ext4"


Linux dump备份
fsck选项


# 参考资料
[一种基于内存的文件系统tmpfs](https://www.linuxprobe.com/tmpfs-linux.html)
[【ubuntu】将磁盘挂载到指定目录并设置开机自动挂载](https://blog.csdn.net/weixin_42301220/article/details/130078734)
[Linux fdisk命令详解：如何创建、编辑、删除和显示磁盘分区（附实例和注意事项）](https://blog.csdn.net/u012964600/article/details/134603643)

