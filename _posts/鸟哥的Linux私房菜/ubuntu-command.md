---
title: ubuntu command
date: 2022-03-03 22:03:11
tags:
- 鸟哥的Linux私房菜
---

# 开启摄像头


cheese


# 显示系统进程

显示系统进程 top

杀死这个进程号的进程 sudo kill pid


# 获取最高用户权限

sudo -i

# 挂载和弹出U盘
## 挂载
查看系统磁盘设备信息，并找到待U盘的目录(Linux系统中所有设备均被视为文件)
fdisk -l
#/dev/sdb1
将U盘挂载到系统某个位置
mount /dev/sdb1 /mnt
现在U盘所有文件被挂载到了/mnt目录中，进入U盘目录查看内容
cd /mnt

## 弹出
df 查看一下有没有usb设备在挂载使用
umount /dev/sdb1


# export  添加环境变量

# last 显示最近使用者的登录列表

# set 观察bash下的所有环境变量


# id vvv 查询是不是有这个用户

# alias 设置永久的alias别名

# uname
uname -r 获取内核版本
uname -v 可以查看版本号
uname -a，可以看到操作系统的发行版号和操作系统版本
lsb_release -a，查看发行版本信息，并且方法可以适用于所有的Linux发行版本
cat /etc/issue可以查看到当前是Linux什么版本系统。
cat /proc/version可以查看内核的版本号。

# 更改./.bashrc配置

vim ./.bashrc
source ./.bashrc

# 批量改权限
sudo chmod +x ~/bin/*


# bash快捷键
|按键|功能|
|---|---|
|ALT+B | 光标移动到所在单词词首|
|---|---|
CTRL+C | 停止当前运行的命令|
|CTRL+L | 清空屏幕并重新显示当前行|
|CTRL+U | 删除光标前的所有字符|
|CTRL+K | 删除光标后的所有字符|
|CTRL+A | 快速移动到行首|
|CTRL+E | 移动到行末|
|CTRL+T | 交换最后两个字符|



# 重启命令：
1. reboot
2. shutdown -r now 立刻重启(root用户使用)
3. shutdown -r 10 过10分钟自动重启(root用户使用)
4. shutdown -r 20:35 在时间为20:35时候重启(root用户使用)
如果是通过shutdown命令设置重启的话，可以用shutdown -c命令取消重启

# 关机命令：
1. halt   立刻关机
2. poweroff 立刻关机
3. shutdown -h now 立刻关机(root用户使用)
4. shutdown -h 10 10分钟后自动关机


# 关机前准备

# who 查看谁在线

# netstat -a 网络的联机状态

# ps -aux 后台的使用情况

# dmesg 查看内核信息


# 查看电脑是否支持虚拟化技术
## 通过lscpu命令
lscpu命令是一种提取有关CPU体系结构信息的常用方法。此命令从sysfs的/pro /cpuinfo文件中提取硬件信息。该信息包括处理器数量，CPU操作模式，套接字，内核，线程，型号名称和虚拟化信息等。

## 通过cpu-checker实用程序
 sudo apt-get install cpu-checker

 sudo kvm-ok

# 查看系统位数
 file /bin/ls

# vmstat 命令功能说明： 命令报告关于内核线程、虚拟内存、磁盘、陷阱和 CPU 活动的统计信息


# du(disk usage) 命令功能说明：统计目录(或文件)所占磁盘空间的大小
 qemu-kvm - 为 KVM 管理程序提供硬件模拟的软件程序
libvirt-daemon-system - 将 libvirt 守护程序作为系统服务运行的配置文件
libvirt-clients - 用来管理虚拟化平台的软件
bridge-utils - 用来配置网络桥接的命令行工具
virtinst - 用来创建虚拟机的命令行工具
virt-manager - 提供一个易用的图形界面，并且通过libvirt 支持用于管理虚拟机的命令行工具


# 查看电量
sudo apt-get install acpi
使用acpi命令行工具
查看电池是否在充电，剩余电量百分比，具体剩余时间，使用命令acpi
[matrix@localhost ~]$ acpi
Battery 0: Discharging, 33%, 00:44:53 remaining
如果你要看更多的信息，如电池总容量、温度等信息，使用acpi -V命令


使用IBAM检测电池用量
IBAM自称为“智能的电池监测器”



upower --dump | grep --color=never -E "state|to\ full|to\ empty|percentage"



 systemctl isolate multi-user.target
 
  systemctl isolate graphical.target

|目录|	用途|
|---|---|
|/|	虚拟目录的根目录，万物起源。通常不会在这里存储文件|
|/bin	|二进制目录，存放许多用户级的GNU工具|
|/boot	|启动目录，包含Linux内核，存放启动文件|
|/boot/grub/grub.conf or menu.lst|被用来配置启动加载程序|
|/boot/vmlinuz|Linux 内核|
|/dev	|设备目录，Linux在这里创建设备节点|
|/etc	|系统配置文件目录，也包含一系列的shell脚本|
|/etc/crontab|定义自动运行的任务
|/etc/fstab|包含存储设备的列表，以及与他们相关的挂载点
|/etc/passwd|包含用户帐号列表
|/home	|主目录，Linux在这 里创建用户目录|
|/lib	|库目录，存放系统和应用程序的库文件|
|/media	|媒体目录，可移动媒体设备的常用挂载点|
|/mnt	|挂载目录，另一个可移动媒体设备的常用挂载点|
|/opt	|可选目录，常用于存放第三方软件包和数据文件|
|/proc	|进程目录，存放现有硬件及当前进程的相关信息|
|/root	|root用户的主目录|
|/sbin	|系统二进制目录，存放许多GNU管理员级工具|
|/run	|运行目录，存放系统运作时的运行时数据|
|/srv	|服务目录，存放本地服务的相关文件|
|/sys	|系统目录，存放系统硬件信息的相关文件|
|/tmp	|临时目录，可以在该目录中创建和删除临时工作文件|
|/usr	|用户二进制目录，大量用户级的GNU工具和数据文件都存储在这里，它可能是Linux系统中最大的一个
|/usr/bin|包含系统安装的可执行程序，通常会包含许多程序
|/usr/lib|包含由/usr/bin目录中的程序所用的共享库
|/usr/local|非系统发行版自带却打算让系统使用的程序的安装目录
|/usr/sbin|包含许多系统管理程序
|/usr/share|包含许多由/usr/bin目录中的程序使用的共享数据，其中包括像默认的配置文件、图标、桌面背景、音频文件等等
/usr/share/doc|大多数安装在系统中的软件包会包含一些文档|
|/var	|可变目录，用以存放经常变化的文件，比如日志文件


# 常用的库

GCC multilib主要是用于支持交叉编译（cross compiling），即编译出来的程序是用来在其他处理器平台上运行的。例如可以在x86 64位处理器上编译出x86 32位程序，运行在32位处理器上，或者在x86平台上编译出可以在ARM处理器上运行的程序

build-essential
Ubuntu缺省情况下，并没有提供C/C++的编译环境，因此还需要手动安装。但是如果单独安装gcc以及g++比较麻烦，幸运的是，Ubuntu提供了一个build-essential软件包。查看该软件包的依赖关系：


libtool 是一个通用库支持脚本，将使用动态库的复杂性隐藏在统一、可移植的接口中，也就是说，你可以通过如下所示的标准方法，在不同平台上创建并调用动态库，我们 可以认为libtool是gcc的一个抽象，也就是说，它包装了gcc或者其他的任何编译器，用户无需知道细节，只要告诉libtool说我需要要编译哪 些库即可，并且，它只与libtool文件打交道，例如lo、la为后缀的文件。


dpkg 包管理工具

dpkg -l

dpkg -l | grep mysql*
dpkg -l "mysql*"

sudo dpkg -r vim
dpkg -l "*mysql*"



# 参考文献


[查看linux用户密码]https://blog.csdn.net/feikillyou/article/details/109129870













