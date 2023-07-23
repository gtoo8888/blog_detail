---
title: 包管理工具
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

### 常用指令
```bash
sudo apt update # 更新软件包列表
sudo apt install vim # 安装软件包
sudo apt upgrade # 升级软件包
sudo apt remove vim # 卸载软件包


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




































