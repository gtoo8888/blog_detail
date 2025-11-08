---
title: Part21 目录结构
date: 2025-11-06 14:18:09
tags:
- 鸟哥的Linux私房菜
---


# 一、目录结构总体概述

| 目录   | 用途                                                      |
| ------ | --------------------------------------------------------- |
| /      | 虚拟目录的根目录,万物起源通常不会在这里存储文件        |
| /bin   | 二进制目录,存放许多用户级的GNU工具                       |
| /boot  | 启动目录,包含Linux内核,存放启动文件                     |
| /dev   | 设备目录,Linux在这里创建设备节点                         |
| /etc   | 系统配置文件目录,也包含一系列的shell脚本                 |
| /home  | 主目录,Linux在这 里创建用户目录                          |
| /lib   | 库目录,存放系统和应用程序的库文件                        |
| /media | 媒体目录,可移动媒体设备的常用挂载点                      |
| /mnt   | 挂载目录,另一个可移动媒体设备的常用挂载点                |
| /opt   | 可选目录,常用于存放第三方软件包和数据文件                |
| /proc  | 进程目录,存放现有硬件及当前进程的相关信息                |
| /root  | root用户的主目录                                          |
| /sbin  | 系统二进制目录,存放许多GNU管理员级工具                   |
| /run   | 运行目录,存放系统运作时的运行时数据                      |
| /srv   | 服务目录,存放本地服务的相关文件                          |
| /sys   | 系统目录,存放系统硬件信息的相关文件                      |
| /tmp   | 临时目录,可以在该目录中创建和删除临时工作文件            |
| /usr   | 用户二进制目录,大量用户级的GNU工具和数据文件都存储在这里 |
| /var   | 可变目录,用以存放经常变化的文件,比如日志文件            |


接触时间排序
1. 基础
   1. /home 
   2. /root
   3. /tmp  
   4. /mnt
2. 开发用
   1. /bin 
   2. /lib  
   3. /mnt  
   4. /usr  
3. 虚拟文件
   1. /dev  
   2. /proc 
   3. /sys  
   4. /run 
4. 启动相关
   1. /boot 
   2. /etc  
5. 服务器开发/运维,嵌入式不必须
   1. /media
   2. /sbin 
   3. /srv  
   4. /var  
   5. /opt  

# 二、基础
## /home
## /root
## /tmp
## /mnt

# 三、开发用
## /bin
## /lib
## /mnt
## /usr


| 目录           | 用途                                             |
| -------------- | ------------------------------------------------ |
| /usr/bin       | 包含系统安装的可执行程序,通常会包含许多程序     |
| /usr/lib       | 包含由/usr/bin目录中的程序所用的共享库           |
| /usr/local     | 非系统发行版自带却打算让系统使用的程序的安装目录 |
| /usr/sbin      | 包含许多系统管理程序                             |
| /usr/share     | 包含许多由/usr/bin目录中的程序使用的共享数据     |
| /usr/share/doc | 大多数安装在系统中的软件包会包含一些文档         |


# 三、虚拟文件

## /proc

/proc 是 Linux 系统中一个特殊的虚拟文件系统,它不占用磁盘空间,而是内核运行时信息的镜像通过 /proc 可以查看和修改内核参数、获取系统信息和进程信息等
### 1. 数字命名的目录(进程信息)
```bash
/proc/1/        # 进程 PID=1 的信息（通常是 init 进程）
/proc/123/      # 进程 PID=123 的信息

cmdline        # 启动进程的命令行
cwd            # 当前工作目录的符号链接
exe            # 执行文件的符号链接
fd/            # 进程打开的文件描述符
status         # 进程状态信息
stat           # 进程统计信息
maps           # 内存映射信息
io             # I/O 统计信息
```
### 2. 系统信息文件
```bash
/proc/cpuinfo   # CPU 详细信息（型号、核心数、频率等）
/proc/meminfo   # 内存使用情况（总量、空闲、缓存等）
/proc/loadavg   # 系统负载平均值
/proc/uptime    # 系统运行时间
/proc/version   # 内核版本信息
/proc/stat      # 系统统计信息（CPU、中断、进程等）
/proc/vmstat    # 虚拟内存统计信息
/proc/swaps     # 交换分区使用情况
/proc/schedstat # 进程调度统计信息
```
### 3. 内核参数配置
```bash
/proc/sys/      # 内核运行时参数（可动态调整）
/proc/sys/kernel/   # 内核相关参数
/proc/sys/net/      # 网络栈参数
/proc/sys/vm/       # 内存管理参数
/proc/sys/fs/       # 文件系统参数
```
### 4. 设备信息
```bash
/proc/devices       # 已注册的设备列表
/proc/ioports       # I/O 端口使用情况
/proc/iomem         # 物理内存映射
/proc/interrupts    # 中断分配情况
/proc/dma           # DMA 通道使用情况
/proc/mdstat        # 软件 RAID 状态信息
```
### 5. 文件系统信息
```bash
/proc/filesystems   # 支持的文件系统类型
/proc/mounts        # 当前挂载的文件系统
/proc/partitions    # 磁盘分区信息
```
### 6. 网络信息
```bash
/proc/net/          # 网络子系统信息
/proc/net/tcp       # TCP 套接字状态
/proc/net/udp       # UDP 套接字状态
/proc/net/dev       # 网络设备统计
/proc/net/route     # 路由表
```
/proc/diskstats
## /sys
/sys 是一个统一Linux设备模型，主要用于设备管理和配置

/sys 是 Linux 系统中的一个虚拟文件系统，用于提供内核对象（kobject）的视图，这些对象通常对应着硬件设备、设备驱动、内核模块等

/sys 提供了更加结构化的设备与内核信息，主要用于设备管理和动态配置。它是在 2.6 内核中引入的，与 udev 设备管理器紧密相关

| 上层对象             | 包含关系         | 作用描述                                                                                                                             |
| :------------------- | :--------------- | :----------------------------------------------------------------------------------------------------------------------------------- |
| struct kset          | 包含 kobjects    | 一个kobject的集合它本身也是一个kobject,所以也可以出现在sysfs中例如,所有PCI设备构成一个kset,所有USB设备构成另一个kset                 |
| struct device        | 内嵌一个 kobject | 代表一个设备这是设备模型的核心结构之一它内嵌的kobject用于将该设备放入内核对象树和sysfs中(通常在/sys/devices/下)                      |
| struct device_driver | 内嵌一个 kobject | 代表一个驱动它内嵌的kobject用于将该驱动放入内核对象树和sysfs中(通常在/sys/bus/.../drivers/下)                                        |
| struct bus_type      | 包含两个 kset    | 代表一条总线(如pci, usb, platform)它包含两个kset:一个用于管理挂在这条总线上的所有device,另一个用于管理这条总线上的所有driver         |
| struct class         | 包含一个 kset    | 代表一个设备类(如input输入设备、net网络设备、block块设备)所有属于这个类的设备(device)都会出现在这个class的kset中,在/sys/class/下可见 |

### 1. /sys/block/ - 块设备
```bash
/sys/block/sda/     # 第一块硬盘
/sys/block/sdb/     # 第二块硬盘

# 每个模块目录包含
/sys/block/sda/size # 设备大小(扇区数)
/sys/block/sda/stat # I/O 统计信息
/sys/block/sda/queue/ # I/O 调度队列参数
```

### 2. /sys/bus/ - 总线信息
```bash
/sys/bus/pci/       # PCI 总线设备
/sys/bus/usb/       # USB 总线设备  
/sys/bus/scsi/      # SCSI 总线设备
/sys/bus/acpi/      # ACPI 设备

# 每个模块目录包含
/sys/bus/pci/devices/ # 该总线上的设备
/sys/bus/pci/drivers/ # 该总线的驱动程序
```

### 3. /sys/class/ - 设备分类
```bash
/sys/class/net/         # 网络设备
/sys/class/input/       # 输入设备
/sys/class/gpio/        # GPIO 设备
/sys/class/leds/        # LED 设备
/sys/class/block/       # 块设备(新版本)
/sys/class/tty/         # 串口设备

```

### 4. /sys/devices/ - 物理设备树
这是最底层的设备目录,按照设备的物理连接层次组织
```bash
/sys/devices/system/    # 系统设备
/sys/devices/virtual/   # 虚拟设备
/sys/devices/pci0000:00/ # PCI 设备

```
### 5. /sys/dev/ - 设备号映射
链接到/sys/devices/中的实际设备
```bash
/sys/dev/block/     # 块设备号映射
/sys/dev/char/      # 字符设备号映射

```
### 6. /sys/firmware/ - 固件信息
```bash
/sys/firmware/acpi/     # ACPI 表
/sys/firmware/efi/      # EFI 信息
/sys/firmware/devicetree/ # 设备树(ARM)
```

### 7. /sys/kernel/ - 内核参数
```bash
/sys/kernel/debug/      # 调试接口
/sys/kernel/security/   # 安全模块
/sys/kernel/mm/         # 内存管理
```

### 8. /sys/module/ - 内核模块
```bash
/sys/module/ext4/       # ext4 文件系统模块
/sys/module/usbcore/    # USB 核心模块

# 每个模块目录包含
/sys/module/ext4/parameters/ # 模块参数
/sys/module/ext4/refcnt # 引用计数
/sys/module/ext4/sections/ # 内存段信息
```

### /sys 与 /proc 的区别

| 特性     | /proc              | /sys           |
| -------- | ------------------ | -------------- |
| 主要目的 | 进程信息和系统统计 | 统一设备模型   |
| 组织结构 | 相对松散           | 层次化结构     |
| 设备管理 | 有限的设备信息     | 完整的设备树   |
| 可写性   | 部分文件可写       | 大量属性可配置 |
| 引入时间 | 早期 UNIX          | Linux 2.6      |


## /dev

/dev（devices 的缩写）是 Linux 系统中的一个特殊目录，它包含了所有的设备文件
这些文件并不是存储在磁盘上的普通文件，而是作为内核与硬件设备（或虚拟设备）之间的接口而存在的
它让应用程序能够像操作普通文件一样去操作硬件设备



### 1. 存储设备
```bash
/dev/sda            # 第一块 SATA/SCSI 硬盘
/dev/sda1           # 第一块硬盘的第一个分区
/dev/sdb            # 第二块 SATA/SCSI 硬盘
/dev/nvme0n1        # 第一块 NVMe SSD
/dev/nvme0n1p1      # NVMe SSD 的第一个分区
```

### 2. 虚拟终端设备
```bash
/dev/tty            # 当前终端设备
/dev/tty[0-9]       # 虚拟终端 (Ctrl+Alt+F1-F6)
/dev/pts/*          # 伪终端从设备 (SSH/tmux)
/dev/console        # 系统控制台
```

### 3. 特殊设备文件
```bash
/dev/null           # 空设备，写入数据会丢弃
/dev/zero           # 零设备，提供无限的空字符
/dev/random         # 随机数设备（阻塞型）
/dev/urandom        # 随机数设备（非阻塞型）
/dev/full           # 总是返回磁盘已满错误
```

### 4. 字符和块设备
```bash
/dev/stdin          # 标准输入
/dev/stdout         # 标准输出
/dev/stderr         # 标准错误输出
/dev/loop*          # 循环设备（挂载镜像文件）
```

### 5. 物理设备接口
```bash
/dev/usb/*          # USB 设备
/dev/cdrom          # 光盘驱动器（符号链接）
/dev/dvd            # DVD 驱动器（符号链接）
/dev/fd*            # 软盘驱动器
```

### 6. 声音设备
```bash
/dev/dsp            # 数字信号处理器
/dev/mixer          # 混音器控制
/dev/audio          # 音频设备
/dev/snd/*          # ALSA 声音设备
```


## /run

/run 目录是一个在系统启动过程中早期创建的临时文件系统，主要用于存储系统启动后和应用程序运行期间需要的临时性、运行时数据。
### 1. 系统服务运行时文件
```bash
/run/sshd.pid       # SSH 服务进程ID
/run/nginx.pid      # Nginx 服务进程ID
/run/docker.pid     # Docker 守护进程ID
/run/crond.pid      # 定时任务服务进程ID
/run/*.pid          # 各种服务的进程ID文件
```

### 2. 系统状态信息
```bash
/run/utmp           # 当前登录用户信息
/run/dmesg          # 内核启动消息缓存
/run/motd           # 动态每日消息文件
/run/hostname       # 当前主机名
/run/os-release     # 操作系统版本信息
```

### 3. 进程管理相关
```bash
/run/lock/          # 应用程序锁文件
/run/systemd/       # systemd 系统管理器数据
/run/udev/          # 设备管理器数据
/run/dbus/          # D-Bus 系统总线套接字
```

### 4. 用户会话信息
```bash
/run/user/          # 用户级运行时目录
/run/user/<uid>/    # 特定用户的运行时数据
/run/user/<uid>/pulse/ # 用户 PulseAudio 数据
/run/user/<uid>/gnupg/ # 用户 GnuPG 套接字
```

### 5. 网络服务相关
```bash
/run/network/       # 网络接口状态
/run/dhclient/      # DHCP 客户端租约信息
/run/wpa_supplicant/ # Wi-Fi 连接管理
/run/resolvconf/    # DNS 解析配置
```

## 自己用过的

/sys/class/remoteproc/remoteproc0/
/sys/class/gpio/gpio260/value
/sys/kernel/debug/pinctrl/
/sys/bus/iio/devices/iio:device0/in_voltage0_raw
/dev/ttyS7
/mnt/sdc1

# 四、启动相关
# /boot
# /etc
| 目录         | 用途                                       |
| ------------ | ------------------------------------------ |
| /etc/crontab | 定义自动运行的任务                         |
| /etc/fstab   | 包含存储设备的列表,以及与他们相关的挂载点 |
| /etc/passwd  | 包含用户帐号列表                           |





