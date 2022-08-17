---
title: mudduo-ch01
date: 2022-05-25 21:15:34
tags:
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



