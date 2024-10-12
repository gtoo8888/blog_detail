---
title: Part7 磁盘与文件系统管理
date: 2022-03-12 21:27:18
tags:
- 鸟哥的Linux私房菜
---

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

# dd
## 压缩备份工具
sudo dd if=/dev/zero of=tempfile bs=1M count=1024 conv=fdatasync status=progress


参数注释：
1. if=文件名：输入文件名，缺省为标准输入。即指定源文件。< if=input file >
2. of=文件名：输出文件名，缺省为标准输出。即指定目的文件。< of=output file >
3. ibs=bytes：一次读入bytes个字节，即指定一个块大小为bytes个字节。
    obs=bytes：一次输出bytes个字节，即指定一个块大小为bytes个字节。
    bs=bytes：同时设置读入/输出的块大小为bytes个字节。
4. cbs=bytes：一次转换bytes个字节，即指定转换缓冲区大小。
5. skip=blocks：从输入文件开头跳过blocks个块后再开始复制。
6. seek=blocks：从输出文件开头跳过blocks个块后再开始复制。
注意：通常只用当输出文件是磁盘或磁带时才有效，即备份到磁盘或磁带时才有效。
1. count=blocks：仅拷贝blocks个块，块大小等于ibs指定的字节数。
2. conv=conversion：用指定的参数转换文件。
    ascii：转换ebcdic为ascii
     ebcdic：转换ascii为ebcdic
    ibm：转换ascii为alternate ebcdic
    block：把每一行转换为长度为cbs，不足部分用空格填充
    unblock：使每一行的长度都为cbs，不足部分用空格填充
    lcase：把大写字符转换为小写字符
    ucase：把小写字符转换为大写字符
    swab：交换输入的每对字节
     noerror：出错时不停止
     notrunc：不截短输出文件
    sync：将每个输入块填充到ibs个字节，不足部分用空（NUL）字符补齐。

# cpio


# 参考资料
[基礎學習篇目錄 - for CentOS 7](https://linux.vbird.org/linux_basic/centos7/)
[掌握 dd 命令：Linux 系统数据管理的终极工具](https://www.linuxmi.com/linux-dd-command.html)