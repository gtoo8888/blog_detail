---
title: Part20 内存管理和监控
date: 2025-11-04 17:01:19
tags:
- 鸟哥的Linux私房菜
---




```bash
cat /proc/iomem         # 查看物理内存分布
cat /proc/meminfo       # 查看系统内存信息
cat /proc/slabinfo      # 查看内核内存分配
cat /proc/pagetypeinfo  # 查看内存页分配

cat /proc/self/maps # 查看当前进程的内存映射
cat /proc/$(pidof tsAnalyzer)/maps # 查看特定进程的内存映射
cat /proc/$(pidof tsAnalyzer)/smaps # 查看更详细的内存映射
pmap -x <PID> # 查看所有进程的内存映射概况

cat /proc/33346/status # 查看详细内存信息
cat /proc/33346/status | grep -E "VmSize|VmRSS|VmData|VmStk" # 或者只看内存相关

# 查看已加载的共享内存段
ipcs -m

cat /proc/sysvipc/shm # 查看共享内存详细状态
ps aux | grep 你的实时核进程名 # 如果你的实时核进程有PID，查看其具体映射
cat /proc/实时核PID/maps | grep -E "shared|anon"

# 查看详细内存统计
cat /proc/buddyinfo
cat /proc/zoneinfo
# 查看内存碎片情况
cat /proc/buddyinfo


# 检查大内存使用进程
ps aux --sort=-%mem | head -10
# 检查所有使用mmap的进程
lsof | grep mem
# 检查内存泄漏
cat /proc/meminfo | grep -E "Active|Inactive|Slab"


```


# 参考资料
[在Linux中，如何使用strace进行故障排查](https://www.cnblogs.com/huangjiabobk/p/18181434)
[Linux 问题故障定位的技巧大全](https://zhuanlan.zhihu.com/p/697459627)
[基础：磁盘IO性能优化的几个思路](https://zhuanlan.zhihu.com/p/577849119)
[什么时候选择mmap而非read?](https://www.cnblogs.com/zhujiwei/p/14726211.html)

















