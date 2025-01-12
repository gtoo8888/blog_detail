---
title: 文章暂存
date: 2022-08-16 13:35:06
tags:
---

**_posts中代码统计**
| _posts | *.c|*.cc|*.cxx|*.cpp|*.h|*.h++|*.hpp|*.md |  **总和** |
|---|---|---|---|---|---|---|---|---|---|
| 0|0|0|0|0|0|0|105 | **105** |
| 0|0|0|0|0|0|0|9316 | **9316** |


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

