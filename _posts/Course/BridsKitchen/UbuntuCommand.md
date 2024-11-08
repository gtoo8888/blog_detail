---
title: ubuntu command
date: 2022-03-03 22:03:11
tags:
- 鸟哥的Linux私房菜
---


# 查看脚本文件是dos还是unix

查看脚本文件是dos格式还是unix格式，dos格式的文件行尾为^M$ ，unix格式的文件行尾为$
cat -A filename
把dos格式的文件转换为unix格式的文件
dos2unix filename

[ -d DIR ] 如果 FILE 存在且是一个目录则为真。
[ -z STRING ] 如果STRING的长度为零则为真 ，即判断是否为空，空即是真；

二、文件/文件夹(目录)判断

[ -b FILE ] 如果 FILE 存在且是一个块特殊文件则为真。
[ -c FILE ] 如果 FILE 存在且是一个字特殊文件则为真。
[ -d DIR ] 如果 FILE 存在且是一个目录则为真。
[ -e FILE ] 如果 FILE 存在则为真。
[ -f FILE ] 如果 FILE 存在且是一个普通文件则为真。
[ -g FILE ] 如果 FILE 存在且已经设置了SGID则为真。
[ -k FILE ] 如果 FILE 存在且已经设置了粘制位则为真。
[ -p FILE ] 如果 FILE 存在且是一个名字管道(F如果O)则为真。
[ -r FILE ] 如果 FILE 存在且是可读的则为真。
[ -s FILE ] 如果 FILE 存在且大小不为0则为真。
[ -t FD ] 如果文件描述符 FD 打开且指向一个终端则为真。
[ -u FILE ] 如果 FILE 存在且设置了SUID (set user ID)则为真。
[ -w FILE ] 如果 FILE存在且是可写的则为真。
[ -x FILE ] 如果 FILE 存在且是可执行的则为真。
[ -O FILE ] 如果 FILE 存在且属有效用户ID则为真。
[ -G FILE ] 如果 FILE 存在且属有效用户组则为真。
[ -L FILE ] 如果 FILE 存在且是一个符号连接则为真。
[ -N FILE ] 如果 FILE 存在 and has been mod如果ied since it was last read则为真。
[ -S FILE ] 如果 FILE 存在且是一个套接字则为真。
[ FILE1 -nt FILE2 ] 如果 FILE1 has been changed more recently than FILE2, or 如果 FILE1 exists and FILE2 does not则为真。
[ FILE1 -ot FILE2 ] 如果 FILE1 比 FILE2 要老, 或者 FILE2 存在且 FILE1 不存在则为真。
[ FILE1 -ef FILE2 ] 如果 FILE1 和 FILE2 指向相同的设备和节点号则为真。

三、字符串判断

[ -z STRING ] 如果STRING的长度为零则为真 ，即判断是否为空，空即是真；
[ -n STRING ] 如果STRING的长度非零则为真 ，即判断是否为非空，非空即是真；
[ STRING1 = STRING2 ] 如果两个字符串相同则为真 ；
[ STRING1 != STRING2 ] 如果字符串不相同则为真 ；
[ STRING1 ]　 如果字符串不为空则为真,与-n类似



# 开启摄像头


cheese


# 显示系统进程

显示系统进程 top

杀死这个进程号的进程 sudo kill pid


# 获取最高用户权限

sudo -i

# 挂载和弹出U盘
查看挂载情况
df -h
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

# dmesg 查看内核信息



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



# 第二种方法：使用mount命令
# mount -l

# 第三种方法：查看文件/etc/mtab。
# cat /etc/mtab

# 第四种方法：使用lsblk命令查看
# lsblk -P

# 查看端口号
netstat -tunpl | grep 端口号



# chrony

Chrony是一个开源自由的网络时间协议 NTP 的客户端和服务器软软件。它能让计算机保持系统时钟与时钟服务器（NTP）同步，因此让你的计算机保持精确的时间，Chrony也可以作为服务端软件为其他计算机提供时间同步服务。


# modprobe 
modprobe命令用于智能地向内核中加载模块或者从内核中移除模块。


modprobe -V
kmod version 27
+XZ -ZLIB +LIBCRYPTO -EXPERIMENTAL

加载模型
modprobe sysrq
都从这个路径下加载
/lib/modules/
error:
modprobe: FATAL: Module sysrq not found in directory /lib/modules/5.10.16.3-microsoft-standard-WSL2

# lsmod
查看已加载的内核模块信息

sudo insmod hello.ko  //插入模块
sudo rmmode hello // 卸载模块
modinfo hello.ko // 查看模块信息
lsmod //查看系统模块
dmesg // 查看系统日志信息


# systemctl 

-p 从指定文件夹加载
sysctl -p /etc/sysctl.d/my-default.conf


which systmd
查看状态
sysctl docker status




wget https://github.com/microsoft/WSL2-Linux-Kernel/archive/refs/tags/linux-msft-5.4.72.tar.gz


# modprobe br_netfilter
linux透明防火墙--br_netfilter



# 更新内核
查看内核是否存在
apt-cache search linux | grep "linux-buildinfo-5.4.0-122-generic"
寻找内核是否存在
apt search 'linux-image-5.4.0-122-generic'

apt install 'linux-image-5.4.0-122-generic'
sudo update-initramfs -u -k all
sudo update-grub

sudo update-initramfs -u -k all

# lsof

# swapoff
Linux swapoff命令用于关闭系统交换区(swap area)。
-a 将/etc/fstab文件中所有设置为swap的设备关闭
-h 帮助信息
-V 版本信息




sudo -i 切换用户身份到root.


# mount
mount命令是经常会使用到的命令，它用于挂载Linux系统外的文件。
-t：指定档案系统的型态，通常不必指定。mount 会自动选择正确的型态。
 mount -t glusterfs




# \cp
不会询问是否覆盖
\cp /app/WEB-INF/com/cfg.properties /app_bak/WEB-INF/com/cfg.properties 

# crontab 是用来定期执行程序的命令
crond 是 Linux 下用来周期地执行某种任务或等待处理某些事件的一个守护进程，和 Windows 中的计划任务有些类似。

当安装完成操作系统之后，默认便会启动此任务调度命令。

crond 命令每分钟会定期检查是否有要执行的工作，如果有要执行的工作便会自动执行该工作。

注意：新创建的 cron 任务，不会马上执行，至少要过 2 分钟后才可以，当然你可以重启 cron 来马上执行。

而 linux 任务调度的工作主要分为以下两类：

1、系统执行的工作：系统周期性所要执行的工作，如备份系统数据、清理缓存
2、个人执行的工作：某个用户定期要做的工作，例如每隔 10 分钟检查邮件服务器是否有新信，这些工作可由每个用户自行设置

ubuntu上的crond名称为cron没有d
星号（*）：代表所有可能的值，如month字段为星号，则表示在满足其它字段的制约条件后每月都执行该命令操作。
逗号（,）：可以用逗号隔开的值指定一个列表范围，例如，“1,2,5,7,8,9”
中杠（-）：可以用整数之间的中杠表示一个整数范围，例如“2-6”表示“2,3,4,5,6”
正斜线（/）：可以用正斜线指定时间的间隔频率，例如“0-23/2”表示每两小时执行一次。

```bash
sudo apt-get install cron # 安装
cat /etc/crontab # 系统的定时任务
service cron status # 查看服务状态
service cron restart # 次保存了 crontab 之后，我们还需要重启 cron 来应用这个计划任务
# 系统自带的任务
cron.d
cron.daily
cron.hourly
cron.monthly
cron.weekly


crontab -u root -e     #编辑用户 root 的计划任务文件（需要有 root 权限）
crontab -e             #编辑当前用户的计划任务文件
crontab -u root -l     #显示用户 root 的计划任务文件（需要有 root 权限）
crontab -l             #显示当前用户的计划任务文件
crontab -r             #删除当前用户的计划任务文件
```

```bash
## 指定具体执行时间
2   *  *  *  * ls    #每个小时的第 2 分钟执行一次 ls 命令
30  7  *  *  * ls    #每天 7：30 执行一次 ls 命令
30 20  *  *  2 ls    #每周二，20：30执行一次 ls 命令（0 和 7 表示星期天）

## 指定间隔时间
*/2 *  *  *  * ls    #每隔 2 分钟执行一次 ls 命令

## 指定时间段
30  7 3-6 *  * ls    #每个月的 3，4，5，6 号的 7：30 分各执行一次 ls 命令

## 指定多个时间
30  7 3,6 *  * ls    #每月的 3 号和 6 号的 7：30 分各执行一次 ls 命令
```


```bash
/var/spool/cron/ # 这个目录下存放的是每个用户包括root的crontab任务
/etc/crontab # 这个文件负责安排由系统管理员制定的维护系统以及其他任务的crontab
```


```bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/date_sdb/soft/0-my_test

# log path /tmp/test_log
# */2 *  *  *  * ls 
# *  *  *  *  * ls >> /tmp/load.log  2>&1
0,15,30,45  *  *  *  * svn_update.sh >> /tmp/test_log/svn_update.log  2>&1
```


# 查看ubuntu下都开启了哪些服务

service --status-all

systemctl

pstree


# 列出当前目录的隐藏权限
lsattr 

# readlink
readlink是Linux系统中一个常用工具，主要用来找出符号链接所指向的位置。


echo "shell脚本本身的名字: $0"
echo "传给shell的第一个参数: $1"
echo "传给shell的第二个参数: $2"



一、dirname命令
dirname命令去除文件名中的非目录部分，仅显示与目录有关的内容。dirname命令读取指定路径名保留最后一个/及其后面的字符，删除其他部分，并写结果到标准输出。如果最后一个/后无字符，dirname 命令使用倒数第二个/，并忽略其后的所有字符。dirname 和 basename 通常在 shell 内部命令替换使用，以指定一个与指定输入文件名略有差异的输出文件名。



# sed 
选项

-e是编辑命令，用于sed执行多个编辑任务的情况下。在下一行开始编辑前，所有的编辑动作将应用到模式缓冲区中的行上。

sed -e '1,10d' -e 's/My/Your/g' datafile

#选项-e用于进行多重编辑。第一重编辑删除第1-3行。第二重编辑将出现的所有My替换为Your。因为是逐行进行这两项编辑（即这两个命令都在模式空间的当前行上执行），所以编辑命令的顺序会影响结果。


ls -t $DIR/*_timedata.db | sed -e '1,10d' | xargs rm
按时间排序，1-10行删除掉







# wget


```shell
systemctl  # 列出所有服务
systemctl status mosquitto


df /dev/sda2


```



# 参考资料
[查看linux用户密码]https://blog.csdn.net/feikillyou/article/details/109129870
[chrony]https://www.cnblogs.com/my-show-time/p/14658895.html
[linux kernel文档]https://www.kernel.org/doc/html/v5.4/admin-guide/sysctl/kernel.html
[lsof]https://www.cnblogs.com/bangerlee/archive/2012/05/03/2464495.html
[Linux crontab命令详解-博客]https://www.cnblogs.com/ftl1012/p/crontab.html
[Linux Crontab定时任务-菜鸟教程]https://www.runoob.com/w3cnote/linux-crontab-tasks.html
[systemd]https://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html
[linux下计划任务学习记录 ]https://blog.51cto.com/u_15060465/4164796
[xargs]https://ruanyifeng.com/blog/2019/08/xargs-tutorial.html
[用history查看历史命令]https://blog.csdn.net/qq_34243930/article/details/107007654
[让 history 命令显示日期和时间]https://zhuanlan.zhihu.com/p/99818664
[环境变量HISTCONTROL命令及对快捷键Ctrl+o命令的影响]https://blog.csdn.net/weixin_30723433/article/details/96641179














