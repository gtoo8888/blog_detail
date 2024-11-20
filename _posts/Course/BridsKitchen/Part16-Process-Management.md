---
title: Part16 进程管理
date: 2023-07-23 20:54:00
tags:
- 鸟哥的Linux私房菜
---


# 查看系统情况

## ps 

### 常用指令
```bash
ps # 显示当前用户的进程状态

ps -e # 显示系统中所有进程的简要信息
ps -f # 显示进程的完整格式输出，包括进程状态、PID、PPID、CPU使用率、内存使用等信息

ps -a # 显示当前终端下所有用户的进程，包括其他用户的进程。这个选项等同于ps -e
ps -u # 显示指定用户的进程信息。可以通过用户名或用户ID来指定用户
ps -x # 它用于显示当前用户在终端下运行的所有进程，包括没有控制终端的进
```
### 不常用指令
```bash
ps -l # 显示进程的长格式输出，包括进程状态、PID、PPID、CPU使用率等信息
ps -t # 显示指定终端或伪终端上的进程
ps -p # 显示指定进程ID的进程信息
ps -C # 显示指定命令名的进程信息
ps -o # 自定义输出格式，可以选择要显示的列
ps -H # 显示进程的层次结构
ps -S # 显示进程的信号信息
ps -G # 显示指定进程组ID的进程信息
ps -N # 显示与指定进程ID不匹配的进程信息
ps -u # 显示指定用户的进程信息
```
### 常用指令组合
```bash
ps -ef # 显示系统中所有进程的详细信息
ps -aux # 显示当前用户以及其他用户的进程详细信息
```



## free 
显示系统的内存使用情况，查看交换分区的情况
### 不常用指令
```bash
free -b # 以字节为单位显示内存使用情况

free -k # 以K字节为单位显示内存使用情况
free -m # 以M字节为单位显示内存使用情况
free -g # 以G字节为单位显示内存使用情况
```
### 常用指令组合
```bash
free -h # 以人类可读的方式显示内存大小，以K、M、G为单位，更易读
free -hs 1 # 每秒显示一次
free -t # 显示内存总和
free -V # 显示free命令的版本信息
```

# 查看时间
## date
### 常用指令
```bash
date # 显示当前系统日期和时间
date "2021-01-01 12:12:00" # 设置系统时间为指定的时间,格式为"YYYY-MM-DD HH:MM:SS"
date +%Y-%m-%d %H:%M:%S # 指定格式显示当前时间
date -R # 用RFC 5322格式输出  Mon, 14 Aug 2006 02:34:56 -0600
sudo date -s 11:21:30 # 修改时间
```



## timedatectl
查看时区，管理系统时间和日期的命令
### 常用指令
```bash
timedatectl # 等于 timedatectl status
timedatectl status # 显示当前系统的时间和日期设置，以及时区信息
timedatectl list-timezones # 列出所有可用的时区选项
```

# 查看系统信息

## 通过lscpu命令
lscpu命令是一种提取有关CPU体系结构信息的常用方法。此命令从sysfs的/pro /cpuinfo文件中提取硬件信息。该信息包括处理器数量，CPU操作模式，套接字，内核，线程，型号名称和虚拟化信息等。


# 参考资料