---
title: btop环境搭建
fix: 2024-05-24 15:14:40
tags:
- 项目
---

# 项目介绍

是一个C++的资源监视器，显示处理器、内存、磁盘、网络和进程的使用情况和统计信息
是项目 bashtop 和 bpytop 的延续。
特点
1. 使用C++20编译
2. 支持GPU检测
3. 支持鼠标操作
4. 显示种类多样


# 环境


| 环境     | 参数          |
| -------- | ------------- |
| VMware   | VMware 16.2.4 |
| Ubuntu   | Ubuntu 20.04  |
| GNU Make | 4.2.1         |
| CMake    | 3.26.3        |


# 编译过程

1. 安装依赖
```shell
sudo apt install gcc-11
sudo apt install coreutils sed git build-essential gcc-11 g++-11 lowdown
```

问题： gcc-11 g++-11无法安装
解决方法：
需要从指定的目标路径中安装gcc-11 g++-11
并修改指向的链接就行了，之后就可以随意的切换gcc的不同版本

```shell
# 查看当前系统中的GCC版本：
gcc -v

# 更新软件源：
sudo apt-get update

# 升级系统中的软件：
sudo app-get upgrade

# 添加Ubuntu Toolchain测试版源：
sudo add-apt-repository ppa:ubuntu-toolchain-r/test

# 再次更新软件源：
sudo apt-get update

# 安装最新版本的GCC（版本为11）：
sudo apt-get install gcc-11 g++-11

# 将/usr/bin/gcc和/usr/bin/g++符号链接指向GCC 11的路径：
sudo ln -s /usr/bin/gcc-11 /usr/bin/gcc # 可能会报错
sudo ln -s /usr/bin/g++-11 /usr/bin/g++ 

sudo ln -sf /usr/bin/gcc-11 /usr/bin/gcc # 强制修改
sudo ln -sf /usr/bin/gcc-11 /usr/bin/gcc

# 查看当前系统中的GCC版本：
gcc -v
```



2. 下载仓库
```shell
git clone https://github.com/aristocratos/btop.git
cd btop
```

3. 编译
```shell
sudo make
# 其他make指令
sudo make install # 安装
sudo make setuid #  使 btop 始终以根用户（或其他用户）身份运行
make clean # 从源目录中删除任何对象文件
make distclean # 删除源目录中的所有对象文件、二进制文件和创建的目录
make help
```

问题：直接使sudo make会有问题，由于使用的虚拟机中是没有GPU的
改进：
```shell
sudo make clean # 必须使用sudo清理，不然会清理不干净
sudo make GPU_SUPPORT=false
```



# 参考资料
[官方文档](https://github.com/aristocratos/btop)
[编译教程](https://github.com/aristocratos/btop?tab=readme-ov-file#compilation-linux)
[【Ubuntu】如何安装gcc11 g++11, Ubuntu18，Ubuntu20，Ubuntu22](https://blog.csdn.net/x1131230123/article/details/132544277)
