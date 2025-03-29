---
title: 文章暂存
date: 2022-08-16 13:35:06
tags:
---

**_posts中代码统计**
| _posts | *.c | *.cc | *.cxx | *.cpp | *.h | *.h++ | *.hpp | *.md     | **总和** |
| ------ | --- | ---- | ----- | ----- | --- | ----- | ----- | -------- | -------- |
| 0      | 0   | 0    | 0     | 0     | 0   | 0     | 105   | **105**  |
| 0      | 0   | 0    | 0     | 0     | 0   | 0     | 9316  | **9316** |


Mosquitto
openssl
micropython移植到stm32
Yocto 
UPS
kali
RAID 0,1
ZFS
边缘物联代理
智能家居、温湿度
E3 E5 cpu
奇校验、偶校验
L2RC


.LCn：是 Local Constant 的缩写。
.LFBn：是 Local Function Beginning 的缩写。
.LFEn：是 Local Function Ending 的缩写。
.LBBn：是 Local Block Beginning 的缩写。
.LBEn：是 Local Block Ending 的缩写。


tmpfs 文件系统
sftp
dot文件
afl-fuzz
如何使用AFL进行一次完整的fuzz过程
模糊测试，Fuzzing测试
-lpthread -lmosquitto -ldl -lsqlite3 -lssl -lcrypto

# 硬件
回流焊
波峰焊
PC-Lint
HT7032 # 现在使用
HT6035
HT6335
选型、设计、样机、小批试产、批产
立项、选型、设计、样机、小批试产、批产、结项
隔离电源与非隔离电源
压敏电阻
WLCSP封装



# 软件中常用的反义词组
add/remove;begin/end;create/destroy;insert/delete;
first/last;get/release;increment/decrement;put/get;
add/delete;lock/unlock;open/close;min/max;
old/new;start/stop;next/previous;source/target;
show/hide;send/receive;source/destination;cut/paste;
up/down;

html链接中需要删除
#:~:text=

# 电表的新知识

FTTB
OLT
GPON/EPON
SmartAX MA5620/MA5626
Listary

# 项目管理
## 软件
飞项
trello
targetprocess
甘特图
Excel模板
worktile
pingcode
简道云
Asana
开源项目管理软件Redmine
Jira 

## 概念
看板
项目管理的方法论很多，主要有瀑布理论(waterfall)，敏捷（agile），增量理论等
Scrum、Kanban、知识库、迭代计划&跟踪、产品需求规划、缺陷跟踪、测试管理


iperf3 -s -i 1 -p 5201 
iperf3 -c 127.0.0.1 -t 20 -i 1
iperf3 -c 192.168.5.5 -t 20 -i 1

raspberrypi# iperf3 -c 127.0.0.1 -t 20 -i 1
Connecting to host 127.0.0.1, port 5201
[  5] local 127.0.0.1 port 59274 connected to 127.0.0.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  1020 MBytes  8.55 Gbits/sec    0   1.25 MBytes
[  5]   1.00-2.00   sec  1.29 GBytes  11.1 Gbits/sec    0   1.31 MBytes
[  5]   2.00-3.00   sec  1010 MBytes  8.47 Gbits/sec    0   1.37 MBytes
[  5]   3.00-4.00   sec   910 MBytes  7.63 Gbits/sec    0   1.37 MBytes
[  5]   4.00-5.00   sec   895 MBytes  7.51 Gbits/sec    0   1.37 MBytes
[  5]   5.00-6.00   sec  1.58 GBytes  13.6 Gbits/sec    0   1.44 MBytes
[  5]   6.00-7.00   sec   978 MBytes  8.20 Gbits/sec    0   1.44 MBytes
[  5]   7.00-8.00   sec  1.34 GBytes  11.5 Gbits/sec    0   2.06 MBytes
[  5]   8.00-9.00   sec  1006 MBytes  8.44 Gbits/sec    0   2.06 MBytes
[  5]   9.00-10.00  sec   975 MBytes  8.18 Gbits/sec    0   2.06 MBytes
[  5]  10.00-11.00  sec   915 MBytes  7.67 Gbits/sec    0   2.06 MBytes
[  5]  11.00-12.00  sec   759 MBytes  6.37 Gbits/sec    5   3.25 MBytes
[  5]  12.00-13.00  sec  1014 MBytes  8.50 Gbits/sec    0   3.25 MBytes
[  5]  13.00-14.00  sec  1005 MBytes  8.43 Gbits/sec    0   3.25 MBytes
[  5]  14.00-15.00  sec   914 MBytes  7.67 Gbits/sec    0   4.87 MBytes
[  5]  15.00-16.00  sec  1.41 GBytes  12.1 Gbits/sec    0   4.87 MBytes
[  5]  16.00-17.00  sec  1.91 GBytes  16.4 Gbits/sec    0   4.87 MBytes
[  5]  17.00-18.00  sec  1018 MBytes  8.54 Gbits/sec    0   4.87 MBytes
[  5]  18.00-19.00  sec  1005 MBytes  8.43 Gbits/sec    0   4.87 MBytes
[  5]  19.00-20.00  sec  1019 MBytes  8.55 Gbits/sec    0   4.87 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-20.00  sec  21.6 GBytes  9.29 Gbits/sec    5             sender
[  5]   0.00-20.00  sec  21.6 GBytes  9.29 Gbits/sec                  receiver




(base) PS E:\small_tool2\iperf-3.18-win64> .\iperf3.exe -c 192.168.5.5 -t 20 -i 1
Connecting to host 192.168.5.5, port 5201
[  5] local 192.168.5.3 port 7904 connected to 192.168.5.5 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.01   sec   110 MBytes   918 Mbits/sec
[  5]   1.01-2.01   sec   113 MBytes   948 Mbits/sec
[  5]   2.01-3.01   sec   112 MBytes   942 Mbits/sec
[  5]   3.01-4.00   sec   113 MBytes   950 Mbits/sec
[  5]   4.00-5.01   sec   114 MBytes   948 Mbits/sec
[  5]   5.01-6.01   sec   113 MBytes   950 Mbits/sec
[  5]   6.01-7.01   sec   113 MBytes   951 Mbits/sec
[  5]   7.01-8.01   sec   113 MBytes   949 Mbits/sec
[  5]   8.01-9.01   sec   113 MBytes   948 Mbits/sec
[  5]   9.01-10.01  sec   114 MBytes   950 Mbits/sec
[  5]  10.01-11.01  sec   113 MBytes   949 Mbits/sec
[  5]  11.01-12.01  sec   113 MBytes   950 Mbits/sec
[  5]  12.01-13.00  sec   113 MBytes   950 Mbits/sec
[  5]  13.00-14.00  sec   112 MBytes   947 Mbits/sec
[  5]  14.00-15.01  sec   115 MBytes   949 Mbits/sec
[  5]  15.01-16.00  sec   112 MBytes   949 Mbits/sec
[  5]  16.00-17.01  sec   113 MBytes   949 Mbits/sec
[  5]  17.01-18.01  sec   113 MBytes   948 Mbits/sec
[  5]  18.01-19.00  sec   113 MBytes   948 Mbits/sec
[  5]  19.00-20.01  sec   114 MBytes   949 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-20.01  sec  2.21 GBytes   947 Mbits/sec                  sender
[  5]   0.00-20.03  sec  2.21 GBytes   946 Mbits/sec                  receiver

1000+0 records in
1000+0 records out
1048576000 bytes (1.0 GB, 1000 MiB) copied, 31.2967 s, 33.5 MB/s
dd if=/dev/zero of=testfile bs=1M count=1000 oflag=direct  0.00s user 0.69s system 2% cpu 31.305 total


# 主机和虚拟机相互ping不通
1. ping 127.0.0.1
   1. 确认TCP正常
2. ping www.baidu.com
   1. 确认可以连接上网络，但是和Ping通主机没有关系
3. 编辑-》虚拟网路编辑器
   1. 确认自己当前用的网卡，当前是桥接模式，但是之前配置的虚拟机和主机的IP都是配置在VMnet8上面
4. 将网络配置中改为使用自定义网络
   1. 可以成功ping通



# 宠物类APP
## 主要品类
1. 电商-购买宠物用品
2. 社交-纯扯淡
3. 知识百科
4. 电子设备-宠物用品
   1. 自动喂食器
   2. 自动猫砂盆
5. 医疗需求
## 核心痛点

最基本的：
记录疫苗历史，驱虫历史，吃药打针看病体检历史，并且能附带提醒功能。（这个很重要，家里宠物一多，很容易搞乱！）
每天记录喂食，排泄，出门运动。
对于年老年幼的狗or猫，需要监控体重，心率等等。
记录洗澡，剪毛，剪指甲，刷牙洗牙，刷洗厕所，刷洗消毒饮水机等等日常活动的功能，并且附带提醒功能


https://www.zhihu.com/question/22136889/answer/86361167
萌爪记
小佩
爱宠大陆
狗管家


1.花里胡哨的2.很多广告3.很多莫名其妙的功能4.要么买东西要么社区5.各种神器的科普 

我就想要一个简简单单的可以让我记录我家喵星人，不用怎么去操心其他的应用在我试过各路神器app以后，我在小程序里面找了两个出来，一个主子档案，一个宠本本主子好像停更很久了，宠本本才刚出来，功能还在更新完善中推荐题主去看一下宠本本，好看好用方便简单

近年来行业中的头部企业比如CatLink、PETKIT（小佩）、uah、玲珑猫等纷纷选择出海

https://www.zhihu.com/question/429507027/answer/1604829483

https://www.easemob.com/news/9021
https://zhuanlan.zhihu.com/p/657506513
https://www.woshipm.com/evaluating/5328450.html
https://www.tuya.com/cn/solution/hardware/pets
https://www.reddit.com/r/selfhosted/comments/1cgxyor/puppysignal_an_open_source_pets_qr_tag/?rdt=51566
https://www.linkedin.com/pulse/unleashed-open-source-tech-pets-animals-jeff-macharyas
https://www.woshipm.com/share/6130549.html
[producthunt 海外产品分享](https://www.producthunt.com/)


## 市场规模
受众分析
## 需要技术栈
1. 前端
   1. ardurin
2. 后端go
## 本产品需求
1. 遛狗轨迹记录
   1. 分享
2. 

# 参考资料
## 其他
[软件工程师成长的一个误区](https://www.raychase.net/6965)
[十大信条](https://about.google/philosophy/)
[Visual Studio 2017工程项目的几个重要文件解析_链巨人的博客-CSDN博客](https://blog.csdn.net/liangyihuai/article/details/88762804)
[TLL模块烧坏](https://blog.csdn.net/fangye945a/article/details/118856004)
[CMake构建Makefile深度解析：从底层原理到复杂项目（一）](https://developer.aliyun.com/article/1465057)
[Cmake Cross Compile UserGuide](https://www.cnblogs.com/uestc-mm/p/15666249.html)
[在Linux中安装CLion并添加图标](https://zhuanlan.zhihu.com/p/640021850)
[Fuzzing技术总结（Brief Surveys on Fuzz Testing）](https://zhuanlan.zhihu.com/p/43432370)
[我的AFL入门之路](https://zhuanlan.zhihu.com/p/524552737)
[AFL++学习日志（一）开始Fuzz与crashes分析_](https://mundi-xu.github.io/2021/03/12/Start-Fuzzing-and-crashes-analysis/)
[蓝牙BLE详解](https://blog.csdn.net/daocaokafei/article/details/114735021)
[Linux复制文件到某路径并重命名](https://www.cnblogs.com/emary/p/12880275.htm)
[工作效率翻倍：2024年最受欢迎的11款个人项目管理软件](https://segmentfault.com/a/1190000045064606)


https://github.com/ar51an/iperf3-win-builds
https://iperf.fr/iperf-download.php
https://github.com/esnet/iperf?tab=readme-ov-file
https://www.cnblogs.com/xuanbjut/p/14144255.html
https://zhuanlan.zhihu.com/p/546330081


# flutter
https://www.jianshu.com/p/601f2ce98ce1
https://blog.csdn.net/tower888/article/details/115371706


flutter config --android-sdk C:\Users\wellsun\AppData\Local\Android\Sdk
 flutter doctor
 flutter run -d edge --web-port=8080 --web-hostname=127.0.0.1


$env:FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
$env:PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"


https://juejin.cn/post/7299346813261676544


3、熟悉RTSP、RTP、RTCP、RTMP等流媒体网络通讯协议；
4、熟悉FFmpeg/GStreamer等常用的音视频开源库；

1.熟练掌握编程基础知识，比如多线程，缓存队列，网络编程，音视频等基础
3、熟悉音视频领域知识（常见码流封装协议rtsp等；熟悉主流音视频编码协议，如H264，H265，AAC等），有ffmpeg，live555,gpu等开源框架开发经验优先;
4、了解基本硬件知识，熟悉常见的音视频AD/DA芯片，熟悉音视频采集和显示原理；



音视频开发
流媒体服务器


[干货|教你使用Doxygen制作漂亮的程序文档](https://zhuanlan.zhihu.com/p/510925324)

tar -zxvf
./configure --without-http_rewrite_module


Configuration summary
  + PCRE library is not used
  + OpenSSL library is not used
  + using system zlib library


启动一个服务：systemctl start firewalld.service
关闭一个服务：systemctl stop firewalld.service
重启一个服务：systemctl restart firewalld.service
显示一个服务的状态：systemctl status firewalld.service


在开机时启用一个服务：systemctl enable firewalld.service
在开机时禁用一个服务：systemctl disable firewalld.service
查看服务是否开机启动：systemctl is-enabled firewalld.service

查看所有已经启动的服务 systemctl list-units --type=service
查看开机启动的服务列表：systemctl list-unit-files|grep enabled
查看启动失败的服务列表：systemctl --failed


# 一些新的工具
proxmox


Audiobookshelf
ollam
TrueNAS 
Gitea
Grafana
Paperless-ngx 


# 电子书阅读
Calibre 
Neat Reader
Koodo
foliate

# 照片管理
digiKam
picasa
eagle



AV1 编解码
AV1 旨在取代 VP9 并成为与HEVC（H.265）竞争的主要视频编码标准。

AV1 旨在比现有的视频编码标准（如H.264/AVC和HEVC/H.265）提供更高的数据压缩率，这意味着在相同的视频质量下，AV1 编码的视频文件将占用更少的存储空间和带宽。但高压缩率带来的是编码耗时的增加，大约是 H265 的 3 倍



帧内编码 预测模式

AVS3
AV1
H266

腾讯云的视频编解码芯片沧海、阿里云的4K实时硬件编码器XGH265、实时高清编码器Ali266
涌现科技Seirios-I智能编码处理器基于全自研芯片提供高算力、高吞吐、低成本、低功耗的灵活适配异构计算方案

视频与视觉技术国家工程研究中心
数字视频编解码技术国家工程实验室
马思伟
高文院士
超高清视频多态基元编解码关键技术
超高清视频编解码关键技术及系统应用
中国科学技大学吴枫教授
多媒体非均匀编码和通信的贡献
中国科学技术大学李卫平教授、陈志波教授
智构编码
字节跳动先进视频团队
火山引擎多媒体实验室

划分、预测、变换、量化、熵编码


广播电视信息
电视技术
家庭影院技术
中国传媒科技


帧内编码、帧间编码、熵编码、环路滤波



### **1. 文件访问模式（必选其一）**
这些标志用于指定文件的打开方式，**必须选择其中一个**：
- `O_RDONLY`：只读模式打开。
- `O_WRONLY`：只写模式打开。
- `O_RDWR`：读写模式打开。

### **2. 文件创建与状态标志（可选）**
这些标志可以与其他标志按位或（`|`）组合使用：

#### **文件创建相关**
- `O_CREAT`：如果文件，则创建它（需配合 `mode` 参数指定权限，如 `0644`）。
- `O_EXCL`：与 `O_CREAT` 一起使用时，如果文件已存在，则 `open()` 失败（用于原子性创建文件）。
- `O_TRUNC`：如果文件已存在且为普通文件，将其长度截断为 0（清空文件）。

#### **同步 I/O 控制**
- `O_SYNC`：每次 `write()` 都会等待数据物理写入硬件（同步写入，影响性能但更安全）。
- `O_DSYNC`：类似 `O_SYNC`，但仅同步文件数据（不同步元数据）。
- `O_RSYNC`：与 `O_SYNC` 或 `O_DSYNC` 配合使用，确保读操作也同步。

#### **非阻塞与异步 I/O**
- `O_NONBLOCK`：以非阻塞模式打开文件（如串口无数据时立即返回而非阻塞）。
- `O_ASYNC`：启用信号驱动的 I/O（如当串口有数据可读时发送 `SIGIO` 信号）。

#### **其他常用标志**
- `O_APPEND`：每次写入时追加到文件末尾（避免覆盖）。
- `O_NOCTTY`：如果打开的是终端设备（如串口），禁止其成为控制终端（防止程序被终端信号干扰）。
- `O_CLOEXEC`：在 `exec()` 调用后自动关闭文件描述符（避免子进程继承）。

### **3. 特殊设备相关标志（如串口）**
打开串口等设备时，常用的组合标志：
```c
int fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_SYNC | O_NONBLOCK);
```
- `O_NOCTTY`：防止串口成为控制终端（重要！）。
- `O_SYNC`：确保数据实时写入硬件（避免缓冲）。
- `O_NONBLOCK`：非阻塞模式（可选，根据需求）。



| **命令**         | **作用**                                                                 |
|------------------|-------------------------------------------------------------------------|
| `F_DUPFD`        | 复制文件描述符（类似 `dup()`）。                                        |
| `F_GETFD`        | 获取文件描述符标志（如 `FD_CLOEXEC`）。                                 |
| `F_SETFD`        | 设置文件描述符标志（如 `FD_CLOEXEC`，防止子进程继承）。                 |
| `F_GETFL`        | 获取文件状态标志（如 `O_RDONLY`、`O_NONBLOCK`）。                       |
| `F_SETFL`        | 设置文件状态标志（如 `O_NONBLOCK`、`O_APPEND`）。                       |
| `F_GETLK`        | 获取文件锁信息（用于记录锁）。                                          |
| `F_SETLK`        | 设置非阻塞文件锁（失败立即返回）。                                      |
| `F_SETLKW`       | 设置阻塞文件锁（失败时等待）。                                          |
| `F_GETOWN`       | 获取接收 `SIGIO`/`SIGURG` 信号的进程 ID（用于异步 I/O）。               |
| `F_SETOWN`       | 设置接收 `SIGIO`/`SIGURG` 信号的进程 ID（用于异步 I/O）。               |


```bash
file exec # 检测是否存在符号链接
nm exec # 检测是否存在符号链接
nm -D exec  # 查看动态符号（适用于动态库）
nm -g exec  # 仅显示外部/全局符号
objdump -h exec | grep debug # 检测是否存在符号链接
readelf -S gpio_instruct_test_t3c_arm_r | grep debug
```

**输出示例：**
- **有符号信息**：  
  ```
  your_executable: ELF 64-bit LSB executable, x86-64, dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, **not stripped**
  ```
- **无符号信息（已 `strip` 过）**：  
  ```
  your_executable: ELF 64-bit LSB executable, x86-64, dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, **stripped**
  ```


| 工具          | 作用                               | 适用场景                     |
|---------------|-----------------------------------|----------------------------|
| `file`        | 快速判断是否 `stripped`           | 初步检查                   |
| `nm`          | 列出符号表                        | 查看具体符号               |
| `objdump -t`  | 显示符号表（更详细）              | 分析符号类型               |
| `readelf -s`  | 显示 ELF 符号表                   | 专业分析                   |
| `strip` + `ls`| 通过文件大小变化验证              | 简单验证                   |
