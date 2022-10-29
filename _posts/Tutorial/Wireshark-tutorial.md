---
title: Wireshark 教程
date: 2022-09-28 20:18:48
tags:
- 教程
---




ip.addr == 110.242.68.3 and icmp
ip.addr == 192.168.1.9 and tcp.port == 8888
ip.addr == 192.168.43.12 and tcp.port == 8888

视图->着色规则
绿色背景的是HTTP包
灰色背景的是TCP包。
黑色背景的是TCP错误包或者校验和错误的包

# 问题
1. 安装的时候检测不到网卡
2. 什么都捕捉不到
用管理员方式启动

# 参考资料
[wireshark抓包不显示结果，还是空白的]https://blog.csdn.net/WQLWWW/article/details/115488382

