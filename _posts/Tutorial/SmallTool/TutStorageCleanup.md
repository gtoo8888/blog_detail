---
title: 清理存储空间
date: 2022-08-23 15:49:26
tags:
- 教程
---

# 清理存储空间
## Ubuntu清理存储空间
```bash
#!/bin/bash
set -ex

df -h 

rm -rf /var/log/journal/*
rm -rf ~/.cache/vscode-cpptools/*

snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
    snap remove "$snapname" --revision="$revision"
done

apt-get autoclean  -y # 将已经删除了的软件包的.deb安装文件从硬盘中删除掉
apt-get clean      -y # 删除包缓存中的所有包
apt-get autoremove -y # 删除为了满足其他软件包的依赖而安装的，但是现在不再需要的软件包。

df -h 
```

## Windows清理存储空间
C:\Users\<User>\AppData\Local\pip\cache
C:\Users\<User>\AppData\Local
C:\Users\<User>\AppData\Local\TslGame\Saved\Crashes
C:\Users\<User>\AppData\Local\Temp
C:\Users\<User>\.gradle

## 通用大文件

### 1. vscode
### 2. python包管理
pip cache
pip cache dir purge
pip cache info

# 参考资料
[如何清除 Pip 缓存？从而优化 Python 环境并释放磁盘空间](https://cloud.tencent.com/developer/article/2323457)
[Windows上pip缓存](https://blog.csdn.net/weixin_45653897/article/details/131254542)
[gradle瘦身/删除没有用的文件](https://www.cnblogs.com/gqg_guan/article/details/130160022)
[轻量级的VsCode为何越用越大？为什么吃了我C盘10G？如何无痛清理VsCode缓存？手把手教你为C盘瘦身](https://www.bilibili.com/opus/976945853997514788)
[解决Antimalware Service Executable让CPU占用过高](https://www.bilibili.com/opus/976945853997514788)
