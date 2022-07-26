---
title: day06-libevent
date: 2022-04-03 15:20:48
tags:
- Linux网络编程
---












描述什么是 libevent并掌握如何安装
掌握event_base的作用和使用方法
熟练掌握libevent库中的事件循环
掌握event事件的使用方法
掌握bufferevent的工作方式
掌握使用libevent实现tcp服务器端流程
掌握使用Libevent实现tcp客户端流程




libevent介绍
1事件驱动，高性能，轻量级，专注于网络，只能用于网络服务端开发
2源代码精炼，易读
3跨平台
4支持多种I/o多路复用技术，如epoll select poll等
5支持I/O和信号等事件


登录官方网站: http://libevent.org，查看相关信息
libevent源码下载主要分2个大版本:
1. 1.4.x系列较为早期版本，适合源码学习
2. 2.x系列，较新的版本，代码量比1.4 版本多很多，功能也更完善。

libevent的核心实现:
在linux上，其实质就是epoll.反应堆.
libevent,是事件驱动, epoll反应堆也是事件驱动，当要监测的事件发生的时候，就会调用事件对应的回调函数，执行相应操作．特别提醒:事件回调函数是由用户开发的，但是不是由用户显示去调用的，而是由libevent,去调用的.
回调函数是自己写的
























































































































































































