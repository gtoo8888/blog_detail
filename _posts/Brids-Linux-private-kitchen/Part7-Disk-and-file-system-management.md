---
title: Part7 磁盘与文件系统管理
date: 2022-03-12 21:27:18
tags:
- 鸟哥的Linux私房菜
---

# xfs_info 观察XFS文件系统

# df
用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计
查看一下有没有usb设备在挂载使用
```bash
df -h # 查看当前磁盘使用情况
df -hT
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

# 其他指令
ln 硬链接


lsblk 列出所有磁盘列表

blkid 列出设备的UUID等参数
UUID 全局唯一标识符

parted 列出磁盘分区表类型与分区信息

gdisk GPT分区

fdisk MBR分区


mount

mknod



# 参考资料