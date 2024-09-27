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



```shell
systemctl  # 列出所有服务
systemctl status mosquitto


df /dev/sda2

sudo dd if=/dev/zero of=tempfile bs=1M count=1024 conv=fdatasync status=progress



```

隔离电源与非隔离电源


-eq       等于,如:if [ "$a" -eq "$b" ] 
-ne       不等于,如:if [ "$a" -ne "$b" ] 
-gt       大于,如:if [ "$a" -gt "$b" ] 
-ge       大于等于,如:if [ "$a" -ge "$b" ] 
-lt       小于,如:if [ "$a" -lt "$b" ] 
-le       小于等于,如:if [ "$a" -le "$b" ] 

tmpfs 文件系统


‘r’：只读。该文件必须已存在。
‘r+’：可读可写。该文件必须已存在，写为追加在文件内容末尾。
‘rb’：表示以二进制方式读取文件。该文件必须已存在。
‘w’：只写。打开即默认创建一个新文件，如果文件已存在，则覆盖写（即文件内原始数据会被新写入的数据清空覆盖）。
‘w+’：写读。打开创建新文件并写入数据，如果文件已存在，则覆盖写。

‘wb’：表示以二进制写方式打开，只能写文件， 如果文件不存在，创建该文件；如果文件已存在，则覆盖写。
'ab': 追加写入二进制文件
‘a’：追加写。若打开的是已有文件则直接对已有文件操作，若打开文件不存在则创建新文件，只能执行写（追加在后面），不能读。

‘a+’：追加读写。打开文件方式与写入方式和'a'一样，但是可以读。需注意的是你若刚用‘a+’打开一个文件，一般不能直接读取，因为此时光标已经是文件末尾，除非你把光标移动到初始位置或任意非末尾的位置。（可使用seek() 方法解决这个问题，详细请见下文Model 8 示例）



参数注释：
1. if=文件名：输入文件名，缺省为标准输入。即指定源文件。< if=input file >
2. of=文件名：输出文件名，缺省为标准输出。即指定目的文件。< of=output file >
3. ibs=bytes：一次读入bytes个字节，即指定一个块大小为bytes个字节。
    obs=bytes：一次输出bytes个字节，即指定一个块大小为bytes个字节。
    bs=bytes：同时设置读入/输出的块大小为bytes个字节。
4. cbs=bytes：一次转换bytes个字节，即指定转换缓冲区大小。
5. skip=blocks：从输入文件开头跳过blocks个块后再开始复制。
6. seek=blocks：从输出文件开头跳过blocks个块后再开始复制。
注意：通常只用当输出文件是磁盘或磁带时才有效，即备份到磁盘或磁带时才有效。
1. count=blocks：仅拷贝blocks个块，块大小等于ibs指定的字节数。
2. conv=conversion：用指定的参数转换文件。
    ascii：转换ebcdic为ascii
     ebcdic：转换ascii为ebcdic
    ibm：转换ascii为alternate ebcdic
    block：把每一行转换为长度为cbs，不足部分用空格填充
    unblock：使每一行的长度都为cbs，不足部分用空格填充
    lcase：把大写字符转换为小写字符
    ucase：把小写字符转换为大写字符
    swab：交换输入的每对字节
     noerror：出错时不停止
     notrunc：不截短输出文件
    sync：将每个输入块填充到ibs个字节，不足部分用空（NUL）字符补齐。

sftp


file(GLOB SOURCES "src/*/*.c")




.LCn：是 Local Constant 的缩写。
.LFBn：是 Local Function Beginning 的缩写。
.LFEn：是 Local Function Ending 的缩写。
.LBBn：是 Local Block Beginning 的缩写。
.LBEn：是 Local Block Ending 的缩写。

压敏电阻


afl-fuzz
如何使用AFL进行一次完整的fuzz过程
模糊测试，Fuzzing测试


-c 从字符串中读取命令 
-i 实现脚本交互 
-n 进行语法检查 
-v 显示执行过程详细信息 
-x 实现逐条语句的跟踪 
--help 显示帮助信息 
--version 显示版本信息


-lpthread -lmosquitto -ldl -lsqlite3 -lssl -lcrypto


WLCSP封装



dot文件



# grep 

grep -v '^$' filename # 过滤空行
grep -A 5 # 可以显示匹配内容以及后面的5行内容
grep -B 5  #可以显示匹配内容以及前面的5行内容
grep -C 5  # 可以显示匹配内容以及前后面的5行内容

cp -i 
cp -if
# 正则

g_all_6013\[\w+\].



perf record -F 100 -p 19083 -g -- sleep 30


for x in $(seq 1 500); do
   gdb -ex "set pagination 0" -ex "thread apply all bt" -batch -p $pid 2> /dev/null
   sleep 0.01
done

gdb -ex "set pagination 0" -ex "thread apply all bt" -batch -p 11667 2> /dev/null


# 参考资料
[TLL模块烧坏](https://blog.csdn.net/fangye945a/article/details/118856004)
[一篇搞懂python文件读写操作（r/r+/rb/w/w+/wb/a/a+/ab /w/wt / r/rt ）](https://blog.csdn.net/a12355556/article/details/112122670)
[CMake构建Makefile深度解析：从底层原理到复杂项目（一）](https://developer.aliyun.com/article/1465057)
[Cmake Cross Compile UserGuide](https://www.cnblogs.com/uestc-mm/p/15666249.html)
[在Linux中安装CLion并添加图标](https://zhuanlan.zhihu.com/p/640021850)
[Fuzzing技术总结（Brief Surveys on Fuzz Testing）](https://zhuanlan.zhihu.com/p/43432370)
[我的AFL入门之路](https://zhuanlan.zhihu.com/p/524552737)
[AFL++学习日志（一）开始Fuzz与crashes分析_](https://mundi-xu.github.io/2021/03/12/Start-Fuzzing-and-crashes-analysis/)
[h命令 – shell命令语言解释器](https://www.linuxcool.com/sh)
[蓝牙BLE详解](https://blog.csdn.net/daocaokafei/article/details/114735021)
[cflow——C语言函数调用关系生成器](https://blog.csdn.net/lyndon_li/article/details/122163468)
[系统性能分析工具：perf](https://zhuanlan.zhihu.com/p/186208907)
[GNU cflow](https://www.gnu.org/software/cflow/)
[Graphviz](https://graphviz.org/)
[Calltree](https://directory.fsf.org/wiki/Calltree)
[静态分析C语言生成函数调用关系的利器——calltree](https://cloud.tencent.com/developer/article/1383773)
[代码分析神器：understand、bouml](https://zhuanlan.zhihu.com/p/476563039)
[Linux复制文件到某路径并重命名](https://www.cnblogs.com/emary/p/12880275.htm)
[Linux性能分析工具-perf并生成火焰图 ](https://www.cnblogs.com/panwenbin-logs/p/18177718)











