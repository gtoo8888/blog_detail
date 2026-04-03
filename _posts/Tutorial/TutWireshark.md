---
title: Wireshark 教程
date: 2022-09-28 20:18:48
tags:
- 教程
---

# Wireshark 教程

## 一、常用过滤表达式

| 表达式 | 说明 |
|---|---|
| `ip.addr == 110.242.68.3 and icmp` | 过滤指定 IP 的 ICMP 包 |
| `ip.addr == 192.168.1.9 and tcp.port == 8888` | 过滤指定 IP 和端口的 TCP 包 |
| `tcp.port == 8888` | 过滤指定端口 |
| `http` | 只显示 HTTP 协议包 |

## 二、视图说明

- **视图 → 着色规则**
- 绿色背景：HTTP 包
- 灰色背景：TCP 包
- 黑色背景：TCP 错误包或校验和错误的包

## 三、常见问题

### 1. 检测不到网卡
安装时需要管理员权限，Windows 下用管理员方式启动 Wireshark。

### 2. 什么都捕捉不到
用管理员方式启动 Wireshark。

## 参考资料

- [Wireshark 抓包不显示结果的解决办法](https://blog.csdn.net/WQLWWW/article/details/115488382)
