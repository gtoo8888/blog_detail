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



# 系统调用
## strace 

```bash
strace ls
strace -tt ls # 在每行输出的前面显示微秒级别的时间戳
strace -T ls # 显示每次系统调用所花费的时间
strace -o output.log ls # ，而不是标准输出
strace -tt ls # 在每行输出的前面显示微秒级别的时间戳
strace -e trace=open,read,write ls # 指定要跟踪的事件类型
strace -v ls # 对于某些相关调用，显示完整的环境变量、文件stat结构等
strace -f ls # 跟踪由目标进程创建的所有子进程
strace -p 1234 # 附着到一个已经运行的进程上进行跟踪


strace -tt -T -e trace=write -o coverage/store.log ./build/bin/Debug/store_interface_test_d | grep -v "\33[0;32m"
```


## ltrace 




# tmp save
## 命令

pidof
nm
objdump
## 函数
mtrace



# 参考资料

[在Linux中，如何使用strace进行故障排查](https://www.cnblogs.com/huangjiabobk/p/18181434)
[Linux 问题故障定位的技巧大全](https://zhuanlan.zhihu.com/p/697459627)
[基础：磁盘IO性能优化的几个思路](https://zhuanlan.zhihu.com/p/577849119)

















