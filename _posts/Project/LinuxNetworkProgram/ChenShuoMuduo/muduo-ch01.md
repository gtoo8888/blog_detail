---
title: mudduo-ch01
date: 2022-11-02 19:46:15
tags:
- Linux网络编程
---

仅仅只能在linux下运行
## 第一步
muduo采用CMake为build system
CMake的安装如下：（CMake最好不低于2.8版，CentOS 6自带的2.6版也能用，但是无法自动识别Protobuf库）
```
sudo apt-get install cmake
sudo apt-get install g++
```
## 第二步
muduo依赖于Boost，Boost的安装如下
```
sudo apt-get install libboost-dev libboost-test-dev
```
安装出现问题
```
E: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 5865 (unattended-upgr)
N: Be aware that removing the lock file is not a solution and may break your system.
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?
```
解决方法：
```
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock
```
## 第三步（可选）
muduo有三个非必须的依赖库（curl、c-ares DNS、Google Protobuf）如果安装了这三个库，cmake会自动多编译一些示例
安装方法如下：
```
sudo apt-get install libcurl4-openssl-dev libc-ares-dev
sudo apt-get install protobuf-compiler libprotobuf-dev
```

## 第四步：下载muduo源码包
```
git clone https://github.com/chenshuo/muduo.git
```

## 第五步：编译muduo
```
# 下载完成之后进入muduo根目录
cd muduo
# 编译muduo库和它自带的例子
./build.sh -j2
```
编译完成之后：
会在muduo源码根路径的上一级路径下生成一个build目录（下面全文我们以../build表示）
生成的可执行文件位于：../build/release-cpp11/bin
静态文件位于：../build/release-cpp11/lib

## 第六步：安装muduo库
```
./build.sh install
```
muduo头文件安装在../build/release-install-cpp11/include目录下
库文件安装在../build/release-install-cpp11/lib目录下
以便muduo-protorpc和muduo-udns等库使用


















# 文件内容的分析

recipes/tpc/netcat.cc  thread-per-connection
recipes/python/netcat.py IO-multiplexing
recipes/python/netcat-nonblock.py IO-multiplexing

参考文件所在位置：
recipes/tpc/chargen.cc
recipes/python/chargen.py
muduo/examples/simple/chargen/*

# 安装boost库
apt-get install libboost-all-dev

# 多个netcat的实现



## 各种工具
### nmap
### ntcat
nc -l 1234 # 当做服务器,监听本机的1234端口
nc localhost 1234 # 当做客户端,连接到本机的1234端口

# 学习netcat怎么编写
g++ -Wall -std=c++11 -pthread -O2 -g -iquote include/ -I../ -I/usr/local/include  -L lib/ -L/usr/local/lib -ltpc  bin/echo_client.cc lib/libtpc.a   -o bin/echo_client


# 测试方法
apt-get install libboost-all-dev
cd recipes/tpc/
make

## 1.系统自带的nc
> 终端1，作为服务器

```./chargen -l 1234  # 启动服务器，监听在1234端口，如果有连接到来，就给他发送消息```

> 终端2，作为客户端

```nc localhost 1234 > /dev/null  # 启动客户端，将收到的信息给扔掉```

> 终端1的输出结果

```
805.430 MiB/s
1936.315 MiB/s
1927.679 MiB/s
1925.130 MiB/s
1928.128 MiB/s
1937.221 MiB/s
1930.871 MiB/s
1929.448 MiB/s
...
```

> 使用top查看进程使用情况
```
   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   6814 root      20   0    3340   2016   1892 R 100.0   0.0   0:36.72 nc
   6783 root      20   0   87976   2020   1836 S  65.4   0.0   0:38.23 chargen
     33 root      20   0       0      0      0 S   0.3   0.0   0:00.03 ksoftirqd/3
    936 redis     20   0   55872   4608   3300 S   0.3   0.0   0:05.40 redis-server
```
可以看到nc的占用率已经满了，现在是netcat是瓶颈

## 2.自己写的ntcat
> 终端1，作为服务器

```./chargen -l 1234  # 启动服务器，监听在1234端口，如果有连接到来，就给他发送消息```

> 终端2，作为客户端

```./netcat localhost 1234 > /dev/null  # 启动自己写的netcat客户端```

> 终端1的输出结果

```
125.255 MiB/s
2285.290 MiB/s
2292.587 MiB/s
2271.676 MiB/s
2296.449 MiB/s
2272.828 MiB/s
2290.678 MiB/s
2269.953 MiB/s
...
```
> 使用top查看进程使用情况
```
   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 6910 root      20   0   14324   3292   3072 S  99.7   0.0   0:10.31 netcat
   6908 root      20   0   87976   1740   1580 S  78.7   0.0   0:08.18 chargen
   1062 mysql     20   0 2319480 394948  37472 S   0.7   2.4   0:27.63 mysqld
   6843 root      20   0   15068   4048   3228 R   0.7   0.0   0:00.82 top
```
可以看到



# 参考文献
陈硕的博客 https://www.cnblogs.com/Solstice/archive/2011/02/02/1948814.html
陈硕的csdn https://blog.csdn.net/Solstice?type=blog
陈硕的课程主页 http://chenshuo.com/practical-network-programming/
相关的代码仓库：
http://github.com/chenshuo/muduo
http://github.com/chenshuo/recipes
http://github.com/chenshuo/muduo-protorpc
http://github.com/chenshuo/muduo-examples-in-go
如何安装 https://www.365seal.com/y/elnWyG1GVr.html
make编译源码时-j的作用 https://blog.csdn.net/JeekMrc/article/details/118332252
安装boost的问题 https://zhuanlan.zhihu.com/p/126538251
[万字长文梳理Muduo库核心代码及优秀编程细节思想剖析]https://zhuanlan.zhihu.com/p/495016351



