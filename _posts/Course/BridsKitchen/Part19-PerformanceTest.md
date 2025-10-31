---
title: Part19 性能测试
date: 2024-12-03 16:35:32
tags:
- 鸟哥的Linux私房菜
---

# 磁盘监控
## iostat
```bash
iostat -c # 展示cpu利用率
iostat -d mmcblk0p9
iostat -t # 打印当前时间
iostat -z # 忽略不活动的设备
iostat -k # Use kb/s
iostat -m # Use Mb/s
iostat 1 # 每秒显示一次

iostat -tzk 1 >> iostat_all.log
iostat -tk -d mmcblk0p9 1 >> iostat_$(date "+%Y%m%d").log
grep -E "(^12/02/24)|(mmcblk0p9)" iostat_20241202.log | sed 's/ \+/,/g' > iostat1_20241202.log


find . -mtime +0 -mmin -1880 
find . -mtime +1 -mtime -1

# 一天内文件变化情况
find . -mtime -1 -exec stat {} \;
# 一分钟内文件变化情况
find . -mmin -1 -exec stat {} \; > stat_min.log
```
## iotop（arm平台不可用）

## vmstat

## blktrace

## sar

## fio

## perf

## dstat

## pidstat

## iolatency

## slabtop

/proc/meminfo
/proc/meminfo
/proc/diskstats

# 系统调用
## strace 
编译得到arm端可用的strace
```bash
git clone https://github.com/strace/strace
tar -xmvf strace-6.16.tar.xz
./configure \
    --host=arm-linux-gnueabihf \
    --build=x86_64-linux-gnu \
    --target=arm-linux-gnueabihf \
    --enable-mpers=check
make -j4
cp src/strace .
```
## 常用指令
```bash
strace ls                          # 最基本用法：跟踪命令 'ls' 执行期间的所有系统调用
strace -tt ls                      # 在每行输出的前面显示微秒级别的时间戳
strace -T ls                       # 显示每次系统调用所花费的时间（在调用行的末尾）
strace -r ls                       # 显示相对于跟踪开始时间的相对时间戳，对分析调用间隔非常有用
strace -o output.log ls            # 将跟踪输出写入文件 'output.log'，而不是标准错误输出（stderr）
strace -e trace=ioctl ls           # 指定要跟踪的事件类型（系统调用）
strace -f ls                       # 跟踪由目标进程创建的所有子进程（在调用 fork/vfork/clone 后）
strace -p 1234                     # 附着（Attach）到一个已经运行的进程（PID 为 1234）上进行跟踪
strace -y ls                       # 在打印文件描述符（如 fd=3）时，额外尝试显示其指向的文件路径或套接字详情
strace -c ls                       # 统计模式：程序运行结束后，汇总系统调用的次数、错误次数和时间，用于性能分析
```
# 不常用指令
```bash
strace -t ls                       # 在每行输出的前面显示精确到秒的时间戳
strace -ttt ls                     # 在每行输出的前面显示 Unix 时间戳（自 Epoch 以来的秒数.微秒）
strace -e trace=open,read,write ls # 指定要跟踪的事件类型（系统调用），这里只跟踪 open, read, write
strace -e trace=file ls            # 跟踪所有以文件名作为参数的系统调用（如 open, stat, chmod 等）
strace -e trace=process ls         # 跟踪进程生命周期相关的调用（如 fork, exec, wait）
strace -e trace=network ls         # 跟踪所有网络相关的系统调用
strace -e trace=signal ls          # 跟踪所有信号相关的系统调用
strace -v ls                       # 显示完整信息：对于某些调用（如 stat, environ），显示所有结构体/环境变量的内容
strace -s 1000 ls                  # 指定打印字符串参数的最大长度（默认32），-s 1024 可避免长字符串被截断
strace -F ls                       # 与 -f 类似，但尝试跟踪通过 vfork 创建的子进程（在某些系统上需要）
strace -yy ls                      # 比 -y 更详细，例如对于套接字文件描述符，会显示详细的协议状态信息
```

## 常用指令组合
```bash
strace -f -p 11944 -c -r -T -tt -e trace=ioctl -o strace_all_threads.log
strace -tt -T -e trace=write -o coverage/store.log ./build/bin/Debug/store_interface_test_d | grep -v "32m\["
strace -cp 1234  
```


## ltrace 

truss 


# tmp save
## 命令
pstack 
pidof
nm
objdump
lsof


## 函数
mtrace



# 参考资料

[在Linux中，如何使用strace进行故障排查](https://www.cnblogs.com/huangjiabobk/p/18181434)
[Linux 问题故障定位的技巧大全](https://zhuanlan.zhihu.com/p/697459627)
[基础：磁盘IO性能优化的几个思路](https://zhuanlan.zhihu.com/p/577849119)
[什么时候选择mmap而非read?](https://www.cnblogs.com/zhujiwei/p/14726211.html)

















