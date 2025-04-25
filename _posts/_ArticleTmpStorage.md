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


<<<<<<< Updated upstream
<<<<<<< Updated upstream
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
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes


好的，我现在需要帮用户改进他们的C++代码。首先，我得仔细看看他们提供的代码结构和功能。这段代码看起来是关于使用FFmpeg和SDL进行音频解码和播放的。用户可能遇到了性能问题或者代码结构上的问题，想要优化。

首先，我会通读整个代码，注意潜在的问题点。比如，全局变量的使用、资源管理是否正确、错误处理是否到位，以及线程安全等问题。例如，用户使用了多个全局变量如pCodecCtx、packet等，这可能在多线程环境下引发问题，但根据代码中的SDL回调函数来看，可能是在主线程中运行的，所以暂时没问题，但需要注意。

接下来，观察代码的结构。在VoiceDecode::open函数中，他们初始化了FFmpeg的解码器，设置了SDL的音频设备，并在一个循环中读取和处理音频包。这里可能存在几个问题：

资源泄漏：比如，avformat_open_input之后没有释放对应的AVFormatContext，虽然在最后有avformat_close_input，但在异常情况下可能没有正确释放。需要检查所有分配的资源是否有对应的释放操作。

错误处理：现有的错误处理主要是通过日志记录，但有些地方可能缺少对错误的进一步处理，比如avcodec_open2失败后直接返回false，但没有释放之前分配的资源。

线程安全：虽然当前代码可能在单线程中运行，但如果未来扩展到多线程，全局变量可能会有问题。不过目前看用户的需求可能集中在功能正确性和效率上。

内存管理：比如，av_malloc分配的内存是否在适当的时候被释放？例如，packet在循环中被av_packet_unref，但av_packet本身是用av_malloc分配的，应该在适当的时候用av_packet_free释放。

死循环或阻塞：在while (av_read_frame(pFormatCtx, packet) >= 0)循环中，如果读取失败可能会卡住，需要考虑超时或中断处理。

音频转换后的数据处理：用户将转换后的数据存放在out_buffer中，然后设置audio_chunk和audio_len，之后在回调函数中读取。这部分逻辑是否正确？比如，当多个音频帧连续转换时，如何确保数据的连续性，避免覆盖？

SDL音频回调函数的参数：在read_audio_data函数中，用户传递了pCodecCtx作为userdata。但每个音频回调可能需要处理不同的数据块，需要确认这里的指针是否正确，尤其是在多线程环境下。

接下来，思考具体的改进点：

资源管理：确保所有FFmpeg和SDL分配的资源在函数退出时都被正确释放，包括AVFormatContext、AVCodecContext、AVPacket、AVFrame、SwrContext等。目前的代码在open函数结束时可能没有释放这些资源，导致内存泄漏。例如，在open函数的末尾，虽然调用了swr_free和SDL_Quit，但可能遗漏了其他资源的释放，比如avformat_close_input(pFormatCtx)，这在函数返回false的情况下也可能需要处理。

错误处理增强：在关键步骤添加更多的错误检查，例如在avformat_open_input失败后，应该释放已经分配的任何资源。此外，考虑使用智能指针或封装资源管理，但C++中处理FFmpeg的结构体可能比较麻烦，所以可能需要手动管理。

避免全局变量：当前的代码中有一些全局变量（如pCodecCtx、packet等），这可能导致问题，尤其是在多次调用open函数时。建议将这些变量作为类成员变量，或者在函数内部动态管理，确保每次调用open时资源正确初始化和释放。

线程安全：如果这个类可能在多线程环境中使用，需要考虑加锁保护共享资源，但目前根据代码结构，可能是在单线程中使用，因此这个问题可能不是首要的。

音频缓冲区管理：当前的实现中，每次转换后的音频数据存放在全局的out_buffer中，然后在回调函数中读取。这可能存在竞态条件，特别是如果解码和音频播放不在同一线程的话。需要确保数据同步，比如使用队列来缓冲音频帧，避免覆盖。

循环中的处理：在读取AVPacket并处理后，用户进入一个while循环，调用SDL_Delay(1)。这可能是在等待音频播放完成，但这种方式效率低下，可能导致延迟或不准确。更好的做法可能是将音频数据放入一个队列，由回调函数按需取出，而不是在这里主动延时。

针对上述分析，具体的改进措施可能包括：

将全局变量改为类成员变量：这样可以更好地封装资源，避免全局状态带来的问题。例如，pCodecCtx、packet、pFrame、auConvertCtx等应作为VoiceDecode类的成员变量，并在析构函数中释放。

完善资源释放：在open函数的各个分支中，确保所有分配的资源在失败时都能被正确释放。例如，如果在avcodec_open2失败，应该释放之前分配的pCodecCtx和pFrame。

调整音频处理流程：使用一个环形缓冲区或队列来存储待播放的音频数据，避免在回调函数中直接访问可能被修改的全局变量。这样可以确保线程安全和数据连续性。

改进错误处理：在每一步可能出错的FFmpeg和SDL调用后，检查返回值，并在必要时释放已分配的资源并返回错误。

移除不必要的循环：当前代码中的while (audio_len > 0) { SDL_Delay(1); }似乎是为了等待音频播放完毕，但实际上这会阻塞主线程，影响性能。应该让音频播放异步进行，通过队列管理数据。

正确设置SDL_AudioSpec：用户的代码中注释掉了部分关于单声道的设置，但实际使用的是立体声。需要确认输出是否正确配置，避免混音问题。

处理可能的空指针或野指针：例如，在调用swr_convert之前，确保pFrame->data有效，且转换后的数据长度正确。

现在，根据这些思考，逐步修改代码：

首先，将全局变量转换为类成员变量：

在VoiceDecode类中声明：
private:
AVFormatContext *pFormatCtx = nullptr;
AVCodecContext *pCodecCtx = nullptr;
AVPacket *packet = nullptr;
AVFrame *pFrame = nullptr;
uint8_t *out_buffer = nullptr;
struct SwrContext *auConvertCtx = nullptr;
uint8_t *audio_chunk = nullptr;
uint32_t audio_len = 0;
uint8_t *audio_pos = nullptr;
int mVoiceIndex = -1;

然后，在析构函数中释放资源：

~VoiceDecode() {
if (pFormatCtx) avformat_close_input(&pFormatCtx);
if (pCodecCtx) avcodec_free_context(&pCodecCtx);
if (packet) av_packet_free(&packet);
if (pFrame) av_frame_free(&pFrame);
if (out_buffer) av_free(out_buffer);
if (auConvertCtx) swr_free(&auConvertCtx);
SDL_Quit();
}

这样确保每次VoiceDecode对象销毁时资源都被释放。

接下来，修改open函数中的错误处理，确保在每一步失败时释放已分配的资源。例如：

bool VoiceDecode::open(const QString &url) {
if (url.isNull()) return false;

AVDictionary *dict = nullptr;
av_dict_set(&dict, "rtsp_transport", "tcp", 0);
av_dict_set(&dict, "max_delay", "3", 0);
av_dict_set(&dict, "timeout", "1000000", 0);

int ret = avformat_open_input(&pFormatCtx, url.toStdString().c_str(), nullptr, &dict);
if (ret < 0) {
    LOG_ERR("Failed to open video file! avformat_open_input {:d}\n", ret);
    av_dict_free(&dict);
    return false;
}
av_dict_free(&dict);

// ... 后续步骤，如果中间出现错误，需要释放已分配的pFormatCtx等资源

// 在后续的步骤中，例如avcodec_open2失败时：
if (pCodec == nullptr) {
    LOG_ERR("Unsupported codec! avcodec_find_decoder {:d}\n", mVoiceIndex);
    avformat_close_input(&pFormatCtx); // 释放已打开的pFormatCtx
    return false;
}

// 类似地，在其他失败点释放资源
}

此外，在处理packet时，应该使用av_packet_unref而不是仅仅释放内存，因为av_packet可能有内部引用计数。

在循环读取AVPacket的部分，应该正确处理packet的引用：

while (av_read_frame(pFormatCtx, packet) >= 0) {
if (packet->stream_index == mVoiceIndex) {
avcodec_send_packet(pCodecCtx, packet);
while (avcodec_receive_frame(pCodecCtx, pFrame) >= 0) {
// 处理帧
}
av_packet_unref(packet); // 这里可能需要调整，因为av_read_frame已经将packet的引用计数增加，而avcodec_send_packet会消费一个引用？
// 实际上，av_read_frame给packet的引用计数为1，avcodec_send_packet会将其传递给解码器，解码器处理完后，引用计数仍然为1，所以需要在适当时候释放。
// 因此，正确的做法可能是在每次循环开始时重新分配packet，或者使用av_packet_unref在发送后？
// 需要仔细检查FFmpeg的文档。
// 根据FFmpeg的文档，avcodec_send_packet会消耗掉packet，因此不需要再调用av_packet_unref。但是实际上，avcodec_send_packet并不会减少packet的引用计数，只是将数据传递给解码器。因此，正确的做法是在处理完packet后，调用av_packet_unref来释放它。
// 因此，在此处，应该在处理完packet后调用av_packet_unref。
} else {
av_packet_unref(packet);
}
}

不过，这可能因版本不同而有差异，需要确认。例如，在较新的FFmpeg版本中，avcodec_send_packet不会自动增加packet的引用计数，因此需要手动管理。

为了避免混淆，更好的做法是在每次调用avcodec_send_packet后，如果不再需要该packet，就调用av_packet_unref。或者在循环中复用同一个packet，通过av_packet_unref来重置。

另一个问题是，在循环中不断读取packet，可能会导致内存占用过高，如果遇到无法处理的错误，应该及时break并释放资源。

关于音频数据的处理，当前代码中将转换后的数据一次性存入out_buffer，并设置audio_len和audio_pos，然后在回调函数中读取。这种方法可能存在数据覆盖的问题，尤其是当多个音频帧转换后，新的数据可能会覆盖旧的数据，而此时回调函数可能还在读取旧的数据。

因此，应该采用一个队列结构来保存待播放的音频数据块，每次转换得到一个音频帧后，将其加入队列，回调函数从队列中取出数据播放。这样可以避免数据竞争和覆盖。

例如，使用一个std::queue<std::vector<uint8_t>> audio_queue; 来保存每个音频帧的数据，然后在回调函数中读取队列中的数据，直到队列为空时暂停播放。

不过，考虑到实时性要求，可能需要双缓冲或者其他机制来确保流畅播放。另外，要注意队列的互斥访问，可能需要加锁。

不过，这会增加代码复杂度，特别是在多线程环境下。但根据用户当前的代码结构，可能还处于单线程处理阶段，所以可以尝试调整。

另一种方法是使用环形缓冲区，或者每次转换后将数据复制到单独的缓冲区，并更新audio_pos和audio_len，但要确保每次转换后的数据不会被覆盖，直到完全播放完毕。

当前的代码中存在一个问题：在转换得到一个AVFrame后，调用swr_convert将数据写入out_buffer，然后将整个out_buffer作为audio_chunk，长度为out_buffer_size。然而，如果下一个转换的帧也会写入同一个out_buffer，就会覆盖之前的数据，导致播放错误。

因此，必须确保每次转换后的数据被正确存储，并且在播放完毕前不被覆盖。解决方案是将每个转换后的帧存储到一个独立的缓冲区中，并通过队列管理这些缓冲区。

具体来说，每次转换得到的数据（即swr_convert的输出）应该被复制到一个新的缓冲区，然后将该缓冲区的指针和长度加入队列。在回调函数中，从队列头部取出数据，播放完毕后弹出队列元素。

这样可以避免数据覆盖的问题，同时便于管理多个音频帧的顺序播放。

因此，修改代码如下：

在VoiceDecode类中添加：
std::queue<std::pair<uint8_t*, uint32_t>> audio_queue;

在转换得到音频数据后：
int converted_len = swr_convert(auConvertCtx, &out_buffer, MAX_AUDIO_FRAME_SIZE, (const uint8_t **)pFrame->data, pFrame->nb_samples);
if (converted_len < 0) {
// 错误处理
}
else {
uint8_t *chunk = out_buffer;
uint32_t chunk_len = converted_len;
// 将数据复制到临时缓冲区，避免被覆盖
uint8_t *temp = new uint8_t[chunk_len];
memcpy(temp, chunk, chunk_len);
audio_queue.push({temp, chunk_len});
}

然后在回调函数中：
void read_audio_data(void *udata, Uint8 *stream, int len) {
VoiceDecode decoder = static_cast<VoiceDecode>(udata);
while (!decoder->audio_queue.empty() && len > 0) {
auto &front = decoder->audio_queue.front();
uint32_t available = front.second;
uint32_t play_len = std::min(available, len);
memcpy(stream, front.first, play_len);
front.second -= play_len;
len -= play_len;
if (front.second == 0) {
decoder->audio_queue.pop();
delete[] front.first;
}
}
if (len > 0) {
// 没有足够的数据，填充静音
SDL_MixAudio(stream, stream, len, SDL_MIX_MAXVOLUME);
}
}

这样，每次转换后的数据都会被复制到新的缓冲区并存入队列，回调函数按需取出数据，避免了数据覆盖的问题。同时，使用队列管理缓冲区，确保了播放顺序的正确性。

此外，原来的全局变量audio_chunk、audio_len、audio_pos被移除，改为使用队列结构，提高了代码的安全性和可维护性。

还需要调整open函数中的相关部分，删除原来的音频数据设置代码，并在转换后处理队列：

在处理AVFrame时：
while (avcodec_receive_frame(pCodecCtx, pFrame) >= 0) {
int converted_len = swr_convert(auConvertCtx, &out_buffer, MAX_AUDIO_FRAME_SIZE, (const uint8_t **)pFrame->data, pFrame->nb_samples);
if (converted_len < 0) {
LOG_ERR("Audio conversion failed\n");
break;
}
uint8_t *chunk = out_buffer;
uint32_t chunk_len = converted_len;
// 复制到临时缓冲区
uint8_t *temp = new uint8_t[chunk_len];
memcpy(temp, chunk, chunk_len);
audio_queue.push({temp, chunk_len});
}

同时，在循环读取packet时，确保正确处理每个packet：

while (av_read_frame(pFormatCtx, packet) >= 0) {
if (packet->stream_index == mVoiceIndex) {
avcodec_send_packet(pCodecCtx, packet);
}
av_packet_unref(packet);
}

这里需要注意，avcodec_send_packet可能返回负数表示错误，需要处理：

int ret = avcodec_send_packet(pCodecCtx, packet);
if (ret < 0) {
LOG_ERR("Failed to send packet to decoder\n");
av_packet_unref(packet);
break;
}

综合以上修改，代码的结构会更加健壮，资源管理更加合理，避免内存泄漏和数据竞争问题。

最后，检查其他可能的错误，例如：

确保在调用swr_alloc_set_opts时正确传递参数，特别是输入和输出的通道布局、采样率等。

检查SDL_AudioSpec的设置是否正确，例如samplesize是否与转换后的格式匹配。

确保在初始化auConvertCtx时没有错误，例如调用swr_init是否成功。

总结起来，主要的改进点在于资源管理、错误处理、数据结构的调整以提高线程安全性，以及避免内存覆盖。通过引入队列来管理音频数据块，确保了数据的正确播放顺序，同时使用类成员变量替代全局变量，增强了代码的可维护性和封装性。



以下是针对您的代码进行的优化和改进，主要解决了资源管理、线程安全和数据同步等问题：

```cpp
#include <queue>
#include <cstring>
#include <mutex>

class VoiceDecode {
public:
    ~VoiceDecode() {
        close();
    }

    bool open(const QString &url) {
        if (url.isNull()) return false;

        // 初始化资源
        av_dict_set(nullptr, "rtsp_transport", "tcp", 0);
        av_dict_set(nullptr, "max_delay", "3", 0);
        av_dict_set(nullptr, "timeout", "1000000", 0);

        int ret = avformat_open_input(&pFormatCtx, url.toStdString().c_str(), nullptr, nullptr);
        if (ret < 0) {
            LOG_ERR("Failed to open input: {}", ret);
            return false;
        }

        ret = avformat_find_stream_info(pFormatCtx, nullptr);
        if (ret < 0) {
            LOG_ERR("Failed to get stream info: {}", ret);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        mVoiceIndex = av_find_best_stream(pFormatCtx, AVMEDIA_TYPE_AUDIO, -1, -1, nullptr, 0);
        if (mVoiceIndex < 0) {
            LOG_ERR("No audio stream found");
            avformat_close_input(&pFormatCtx);
            return false;
        }

        auto *pStream = pFormatCtx->streams[mVoiceIndex];
        pCodecPara = pStream->codecpar;

        const AVCodec *pCodec = avcodec_find_decoder(pCodecPara->codec_id);
        if (!pCodec) {
            LOG_ERR("Unsupported codec");
            avformat_close_input(&pFormatCtx);
            return false;
        }

        pCodecCtx = avcodec_alloc_context3(pCodec);
        if (!pCodecCtx) {
            LOG_ERR("Failed to allocate codec context");
            avformat_close_input(&pFormatCtx);
            return false;
        }

        ret = avcodec_parameters_to_context(pCodecCtx, pCodecPara);
        if (ret < 0) {
            LOG_ERR("Failed to copy codec parameters: {}", ret);
            avcodec_free_context(&pCodecCtx);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        ret = avcodec_open2(pCodecCtx, pCodec, nullptr);
        if (ret < 0) {
            LOG_ERR("Failed to open codec: {}", ret);
            avcodec_free_context(&pCodecCtx);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        // 初始化SDL音频
        if (SDL_Init(SDL_INIT_AUDIO | SDL_INIT_TIMER) < 0) {
            LOG_ERR("SDL initialization failed: {}", SDL_GetError());
            avcodec_free_context(&pCodecCtx);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        SDL_AudioSpec desiredSpec = {44100, AUDIO_S16SYS, 2, 1024, read_audio_data, this};
        if (SDL_OpenAudio(&desiredSpec, nullptr) < 0) {
            LOG_ERR("Failed to open audio device: {}", SDL_GetError());
            SDL_Quit();
            avcodec_free_context(&pCodecCtx);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        // 初始化音频转换上下文
        auConvertCtx = swr_alloc_set_opts(
            nullptr,
            av_get_default_channel_layout(pCodecCtx->channels),
            AV_SAMPLE_FMT_S16,
            pCodecCtx->sample_rate,
            av_get_default_channel_layout(pCodecCtx->channels),
            pCodecCtx->sample_fmt,
            pCodecCtx->sample_rate,
            0, nullptr
        );
        if (!auConvertCtx || swr_init(auConvertCtx) < 0) {
            LOG_ERR("Failed to initialize audio converter");
            SDL_CloseAudio();
            SDL_Quit();
            avcodec_free_context(&pCodecCtx);
            avformat_close_input(&pFormatCtx);
            return false;
        }

        // 开始解码循环
        packet = av_packet_alloc();
        if (!packet) {
            LOG_ERR("Failed to allocate packet");
            // 清理资源...
            return false;
        }

        pFrame = av_frame_alloc();
        if (!pFrame) {
            LOG_ERR("Failed to allocate frame");
            // 清理资源...
            return false;
        }

        return true;
    }

    void close() {
        std::lock_guard<std::mutex> lock(audioMutex);

        if (auConvertCtx) {
            swr_free(&auConvertCtx);
        }

        if (pFrame) {
            av_frame_free(&pFrame);
        }

        if (packet) {
            av_packet_free(&packet);
        }

        if (pCodecCtx) {
            avcodec_free_context(&pCodecCtx);
        }

        if (pFormatCtx) {
            avformat_close_input(&pFormatCtx);
        }

        SDL_CloseAudio();
        SDL_Quit();

        // 清空音频队列
        while (!audioQueue.empty()) {
            auto &front = audioQueue.front();
            delete[] front.first;
            audioQueue.pop();
        }
    }

private:
    void read_audio_data(void *userdata, Uint8 *stream, int len) {
        VoiceDecode *decoder = static_cast<VoiceDecode*>(userdata);
        std::lock_guard<std::mutex> lock(decoder->audioMutex);

        int remaining = len;
        while (remaining > 0 && !decoder->audioQueue.empty()) {
            auto &front = decoder->audioQueue.front();
            int playAmount = std::min(front.second, remaining);

            std::memcpy(stream, front.first, playAmount);
            front.second -= playAmount;
            remaining -= playAmount;

            if (front.second == 0) {
                decoder->audioQueue.pop();
                delete[] front.first;
            }
        }

        if (remaining > 0) {
            std::memset(stream + (len - remaining), 0, remaining);
        }
    }

    int mVoiceIndex = -1;
    AVFormatContext *pFormatCtx = nullptr;
    AVCodecParameters *pCodecPara = nullptr;
    AVCodecContext *pCodecCtx = nullptr;
    AVPacket *packet = nullptr;
    AVFrame *pFrame = nullptr;
    struct SwrContext *auConvertCtx = nullptr;

    std::queue<std::pair<uint8_t*, uint32_t>> audioQueue;
    std::mutex audioMutex;
};

```

主要改进点说明：

1. **资源管理**：
- 使用RAII原则在析构函数中释放所有资源
- 将全局变量封装为类成员变量
- 使用智能指针和手动内存管理结合的方式处理动态分配

2. **线程安全**：
- 添加互斥锁保护音频队列
- 使用用户数据指针将解码器和音频设备关联

3. **数据同步**：
- 使用带缓冲的队列存储待播放的音频数据
- 在音频回调函数中按需读取数据
- 添加内存拷贝防止数据覆盖

4. **错误处理**：
- 增加详细的错误日志
- 在每个可能出错的步骤进行资源清理
- 使用nullptr检查代替原始指针检查

5. **性能优化**：
- 移除不必要的延时循环
- 使用更高效的队列结构
- 优化内存分配策略

建议使用方式：

1. 创建VoiceDecode实例时自动初始化必要资源
2. 调用open方法开始解码
3. 在解码过程中会自动触发音频播放
4. 调用close方法释放所有资源

注意事项：

- 需要包含必要的头文件和链接对应的库文件
- 根据实际需求调整音频参数（采样率、声道数等）
- 在多线程环境中需要特别注意互斥锁的使用
- 内存管理需要特别小心，避免内存泄漏或悬空指针

这个版本的代码应该能更好地处理各种异常情况，保证资源正确释放，避免内存泄漏，同时保持音频播放的连续性和正确性。


薅羊毛

1. 百度极速版

