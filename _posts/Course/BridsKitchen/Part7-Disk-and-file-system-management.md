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


# df
用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计
查看一下有没有usb设备在挂载使用
```bash
df -h # 查看当前磁盘使用情况
df -T # 输出文件系统类型
df -a # 包括伪、重复、不可访问的文件系统
```

# du
用于显示目录或文件的大小
-h以K，M，G为单位，提高信息的可读性
-s或--summarize 仅显示总计


```bash
# 常用指令
du -h myfile # 当前文件夹的总大小
du -sh * # 查看当前文件夹下每个文件的大小
```


# tar
压缩与解压，在Unix和类Unix系统中常用的归档工具，用于打包和压缩文件
## 常用指令
```bash
tar -z # 使用gzip压缩算法对tar归档文件进行压缩
tar -x # 从tar归档文件中提取文件
tar -v # 显示正在处理的文件的详细信息
tar -f # 指定要操作的tar归档文件的名称

tar -c # 创建一个新的tar归档文件
```
# 不常用指令
```bash
tar -r # 将文件追加到现有的tar归档文件中
tar -t # 列出tar归档文件中的文件
tar -u # 仅将比归档文件中相应文件更新的文件追加到现有的tar归档文件中
tar -j # 使用bzip2压缩算法对tar归档文件进行压缩
```

## 常用指令组合
```bash
tar -zxvf FileName.tar.gz  # 对.tar.gz解压
tar -zcvf FileName.tar.gz FileName  # 对FileName的文件打包成.tar.gz格式
tar -xvf FileName.tar # 
```

# blkid
对系统的块设备（包括交换分区）所使用的文件系统类型、LABEL、UUID等信息进行查询
```bash
# 常用指令
sudo blkid -s <tag>    显示指定信息，默认显示所有信息
sudo blkid # 列出系统中所有已挂载文件系统的类型
sudo blkid /dev/sdb # 指定设备挂载类型
sudo blkid -s UUID # 显示所有设备UUID
sudo blkid -s UUID /dev/sdb # 显示指定设备UUID
```
# fdisk
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




# 其他指令
ln 硬链接


lsblk 列出所有磁盘列表

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
[掌握 dd 命令：Linux 系统数据管理的终极工具](https://www.linuxmi.com/linux-dd-command.html)
[【ubuntu】将磁盘挂载到指定目录并设置开机自动挂载](https://blog.csdn.net/weixin_42301220/article/details/130078734)
[Linux fdisk命令详解：如何创建、编辑、删除和显示磁盘分区（附实例和注意事项）](https://blog.csdn.net/u012964600/article/details/134603643)

