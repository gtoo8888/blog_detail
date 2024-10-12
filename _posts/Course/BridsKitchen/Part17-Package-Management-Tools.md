---
title: Part17 包管理工具
date: 2023-07-23 21:33:32
tags:
- 鸟哥的Linux私房菜
---

## dpkg(Debian package)
是一个常用于管理 Debian 系统上的软件包的工具
### 常用指令
```bash
dpkg -i baidunetdisk_4.17.7_amd64.deb    # 安装指定的软件包文件
dpkg -r baidunetdisk    # 仅移除软件包，保留配置文件
dpkg --purge baidunetdisk    # 移除软件包及其配置文件
dpkg -l  # 列出所有已安装的软件包
```
### 不常用指令
```bash
dpkg -s baidunetdisk  # 显示指定软件包的详细信息
dpkg -L baidunetdisk    # 列出软件包安装的文件
dpkg -S baidunetdisk   # 查找拥有指定文件的软件包
dpkg -p baidunetdisk    # 显示已安装软件包的详细信息，包括依赖关系
dpkg -c baidunetdisk_4.17.7_amd64.deb   # 列出软件包文件中包含的文件
dpkg -I baidunetdisk_4.17.7_amd64.deb   # 显示软件包文件的详细信息，包括依赖关系
dpkg --get-selections > test    # 将已安装的软件包选择保存到文件
dpkg --set-selections < test    # 从文件中恢复软件包选择
```
### 常用指令组合
```bash
sudo dpkg -i code_1.80.1-1689183569_amd64.deb # 安装指定的软件包文件
dpkg -l "baidu*"  # 列出指定软件包的信息,可以使用正则表达式
dpkg -r baidunetdisk    # 仅移除软件包，保留配置文件
```



## apt(Debian package)

Advanced Package Tool


## apt和apt-get的区别
apt 和 apt-get 都是用于在 Debian 及其派生发行版（如 Ubuntu）上管理软件包的命令行工具。它们有很多相似之处，但也存在一些区别

### 1.常用指令
```bash
sudo apt update # 更新软件包列表,更新本地包缓存
# E: Unable to locate package ros-melodic-cotomap-msgs 找不到本地包的详细信息时候可以更新一下本地包缓存
sudo apt list --upgradable # 查看可以升级的软件包

sudo apt upgrade # 升级软件包
sudo apt install vim # 安装软件包
```
#### 2.删除安装包
```bash
sudo apt remove vim # 卸载软件包，仅删除安装包
sudo apt remove "nvidia*" # 同时移除以为nvidia开头的安装包
sudo apt purge "nvidia*"  # 卸载软件包，同时删除配置文件
# 老的写法
sudo apt-get --purge remove "nvidia*" # 卸载软件包，同时删除配置文件
```
### 3. 查看软件包的安装来源
```bash
# 会显示每个版本的软件包名称、软件源的名称、版本号、优先级等信息。
apt-cache madison nvidia-cuda-toolkit  # 显示这些软件包所属的软件源
apt-cache policy nvidia-cuda-toolkit # 列出软件的所有来源，更加详细一些
apt-cache showpkg nvidia-cuda-toolkit  # 列出软件的所有来源，包括软件包的依赖关系、提供的功能以及逆向依赖关系等
apt-get install -s  nvidia-cuda-toolkit # 模拟安装软件
# 列出软件所有版本，并查看是否已经安装
apt-get install apt-show-versions # 需要安装这个软件
apt-show-versions -a nvidia-cuda-toolkit # 列出软件所有版本
```
### 4. 其他指令
```bash
apt autoremove # 清理不再需要的软件包
apt search vim # 搜索软件包
apt show vim # 显示软件包信息

apt list --upgradable # 列出可升级的软件包
apt list --installed # 列出所有已安装的软件包
apt depends <package-name> # 列出软件包的依赖关系
apt rdepends <package-name> # 列出软件包的反向依赖关系
apt show <source-name> # 显示APT仓库源的配置信息
apt-add-repository <repository> # 添加/移除 APT 仓库源
apt remove-repository <repository>
apt update && apt upgrade # 更新软件包索引并升级系统
apt --fix-broken install # 修复软件包依赖关系问题
apt-cache search <search-term> # 全局搜索软件包
```



## snap

相较传统 Linux 的 rpm，deb 软件包，在Ubuntu 18.04 / 20.04 LTS 版本的 Ubuntu 系统，引入的新应用格式包snap 包
```bash
sudo snap install code # 安装code snap
sudo snap remove code # 卸载 snap
snap find code # 搜索 snap
snap info code # 查看 snap 信息
snap list --all # 查看已安装的
snap help
``` 


```bash
# clean-snap.sh
# sudo bash clean-snap.sh

#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
``` 


# 参考资料
[Linux的桌面环境比较与选择（gnome、kde、xfce、lxde 等）](https://blog.csdn.net/daobaqin/article/details/121029653)
[什么是Snap应用？](https://cn.ubuntu.com/blog/what-is-snap-application)
[Flatpak vs. Snapcraft：优缺点比较及如何选择](https://www.sysgeek.cn/flatpak-vs-snapcraft/)
[如何在 Linux 中清理 Snap 包的版本 | Linux 中国](https://zhuanlan.zhihu.com/p/471882972)

























