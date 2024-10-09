---
title: 文章暂存
date: 2022-08-16 13:35:06
tags:
---



https://www.redis.com.cn/redis-installation-on-ubuntu.html

# 参考文献
[CAP理论]https://cloud.tencent.com/developer/article/1860632
[CAP 定理的含义- 阮一峰的网络日志]https://www.ruanyifeng.com/blog/2018/07/cap.html
http://erdengk.top/archives/jian-li--mian-shi



[软件工程师成长的一个误区]https://www.raychase.net/6965
[十大信条]https://about.google/philosophy/



[(5条消息) Visual Studio 2017工程项目的几个重要文件解析_链巨人的博客-CSDN博客](https://blog.csdn.net/liangyihuai/article/details/88762804)





FFmpage
SRS
WebRTC


# 采集
音频采集
视频采集
# 编码
码率
帧率
# 传输
检测贷款
怎么传输数据
怎么发送数据
# 渲染



3、熟悉RTSP、RTP、RTCP、RTMP等流媒体网络通讯协议；
4、熟悉FFmpeg/GStreamer等常用的音视频开源库；

1.熟练掌握编程基础知识，比如多线程，缓存队列，网络编程，音视频等基础
3、熟悉音视频领域知识（常见码流封装协议rtsp等；熟悉主流音视频编码协议，如H264，H265，AAC等），有ffmpeg，live555,gpu等开源框架开发经验优先;
4、了解基本硬件知识，熟悉常见的音视频AD/DA芯片，熟悉音视频采集和显示原理；



音视频开发
流媒体服务器

# ffmpeg
播放器
录制
推流
    修改码率
    修改帧率
拉流
    怎么做到低延时


# 流媒体协议
rtmp
hls
httpflv
rtsp
rtp
rtcp


# 书籍
音视频开发进阶指南
FFmpeg从入门到精通



视频播放器
音乐播放器

ijkPlayer播放器






cmake .. -D PYTHON_INCLUDE_DIR=/usr/include/python3.8 -D PYTHON_LIBRARY=/usr/lib/python3.8


cmake .. -DPython3_INCLUDE_DIRS=/usr/include/python3.8 -DPYTHON_LIBRARY=/usr/lib/python3.8



安装硬盘
https://blog.zeruns.tech/archives/629.html



fdisk  /dev/sda



mkfs.ext4 /dev/sda1

sudo apt install nano   # centos系统用 sudo yum install nano
nano /etc/fstab
#打开后，在最后一行加入以下代码：
/dev/sda1 /data ext4 defaults 0 1  #如果上面用的是ext3，这里也要用ext3；

/dev/sda /HDD_1 ext4 defaults 0 1 


https://blog.csdn.net/toopoo/article/details/122407434




/etc/init.d/bt  restart

cat /etc/os-release


lsb_release -a


hostnamectl

uname -a

getconf LONG_BIT

[树莓派4b安装OpenMediaVault（OMV 6）开源NAS系统](https://xyzbz.cn/archives/944/)


https://www.raspberrypi.com/news/new-old-functionality-with-raspberry-pi-os-legacy/

https://www.cnblogs.com/mq0036/p/18130075
https://blog.csdn.net/weixin_43710676/article/details/128981939


https://github.com/OpenMediaVault-Plugin-Developers/

https://www.openmediavault.org/



pip cache dir
pip cache purge
pip cache info


https://cloud.tencent.com/developer/article/2323457

https://blog.csdn.net/weixin_45653897/article/details/131254542

C:\Users\Yan\AppData\Local\pip\cache


C:\Users\Yan\AppData\Local

C:\Users\Yan\AppData\Local\TslGame\Saved\Crashes
C:\Users\Yan\AppData\Local\Temp

https://blog.csdn.net/gqg_guan/article/details/130160022


C:\Users\Yan\.gradle


https://blog.csdn.net/Tisfy/article/details/126082324


Linux命令行与shell脚本编程大全（第3版）
Linux Shell脚本攻略
Advanced Bash-Scripting Guide.
sed and awk 101 hacks


Mosquitto
openssl
micropython移植到stm32
Yocto 
doxygen
UPS
kali
RAID 0,1
Sumatra PDF
obsidian
ZFS


Rust
    入门：Rust语言圣经
    进阶: Rust死灵书
    再进阶: Rust for Rustaceans
    Rust 程序设计 第二版
    Rust 入门秘籍


边缘物联代理
智能家居、温湿度
E3 E5 cpu
奇校验、偶校验
L2RC



[分享8个高质量英文外刊网站](https://zhuanlan.zhihu.com/p/675556766)

https://magazinelib.com/

https://www.nationalgeographic.com/

 New Scientist 新科学家（科学类）

 The Economist 经济学人（经济类）——难度较大，词汇量2.5W

 National Geographic Magazine 国家地理杂志（科学类）

 History Today 今日历史（历史类）
WIRED 连线杂志（科技类）

 Cosmopolitan杂志（时尚类）


华盛顿邮报，纽约时报

考研、雅思、托福
1. 华盛顿邮报
2. 纽约时报
3. 泰晤士报
4. 哈弗商业评论
5. 大西洋月刊


file(GLOB SOURCES "src/*/*.c")



.LCn：是 Local Constant 的缩写。
.LFBn：是 Local Function Beginning 的缩写。
.LFEn：是 Local Function Ending 的缩写。
.LBBn：是 Local Block Beginning 的缩写。
.LBEn：是 Local Block Ending 的缩写。


隔离电源与非隔离电源
tmpfs 文件系统
sftp
压敏电阻
WLCSP封装
dot文件
afl-fuzz
如何使用AFL进行一次完整的fuzz过程
模糊测试，Fuzzing测试

-lpthread -lmosquitto -ldl -lsqlite3 -lssl -lcrypto

# 软件中常用的反义词组
add/remove;begin/end;create/destroy;insert/delete;
first/last;get/release;increment/decrement;put/get;
add/delete;lock/unlock;open/close;min/max;
old/new;start/stop;next/previous;source/target;
show/hide;send/receive;source/destination;cut/paste;
up/down;



# 参考资料
[TLL模块烧坏](https://blog.csdn.net/fangye945a/article/details/118856004)
[CMake构建Makefile深度解析：从底层原理到复杂项目（一）](https://developer.aliyun.com/article/1465057)
[Cmake Cross Compile UserGuide](https://www.cnblogs.com/uestc-mm/p/15666249.html)
[在Linux中安装CLion并添加图标](https://zhuanlan.zhihu.com/p/640021850)
[Fuzzing技术总结（Brief Surveys on Fuzz Testing）](https://zhuanlan.zhihu.com/p/43432370)
[我的AFL入门之路](https://zhuanlan.zhihu.com/p/524552737)
[AFL++学习日志（一）开始Fuzz与crashes分析_](https://mundi-xu.github.io/2021/03/12/Start-Fuzzing-and-crashes-analysis/)
[蓝牙BLE详解](https://blog.csdn.net/daocaokafei/article/details/114735021)
[Linux复制文件到某路径并重命名](https://www.cnblogs.com/emary/p/12880275.htm)











