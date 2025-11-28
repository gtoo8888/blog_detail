---
title: Windows分析工具
date: 2024-10-09 16:16:08
tags:
- 教程
---

```shell
psping -n 10 # 测试次数
psping -w 10 # 具有指定迭代次数的预热（默认值为 1）。
psping -i 10 # 间隔(秒)对于快速ping指定0
psping -q # 静默输出
psping -t # 执行 ping，直到按 Ctrl+C 停止，并键入 Ctrl+pause 查看统计信息。
psping -h 100 # 打印直方图（默认桶计数为 20）

psping -n 4 -w 5 193.168.1.16  # 测试4次，5次预热
psping -n 100 -i 0 -q 193.168.1.16 # 大量并发测试
```

《Troubleshooting with the Windows Sysinternals Tools》

Windows Internals 7th edition (Part 1)


# Process Explorer
超级任务管理器

procexp.exe
进程的父子关系（谁启动了谁）。
进程加载了哪些DLL文件（比如能发现恶意的 SA83w.dll）。
进程持有了哪些文件、注册表键（用于判断文件被谁占用）。
进程的TCP/IP网络连接（比如发现异常外联）。
进程的数字签名（快速识别可信与不可信程序）。


蓝色：当前用户进程。
粉色：系统服务进程。
紫色：Packaged (Store) 应用。


# Autoruns


点击菜单 Options -> 勾选 Hide Microsoft Entries 和 Hide Windows Entries。

这个操作至关重要！ 它会过滤掉所有经过微软签名的、可信的系统组件，让你的视线聚焦在第三方应用程序和潜在的恶意软件上。界面会瞬间清爽很多。



Autoruns 通过标签页组织不同类型的自动启动位置：
Logon：用户登录时启动的程序。这是最经典的启动位置（如注册表 Run 键）。
Services：系统服务。很多恶意软件会把自己注册为服务。
Scheduled Tasks：计划任务。这是现代恶意软件非常喜欢的持久化方式（"黑猫"的随机BAT脚本就可能在这里）。
Explorer：资源管理器扩展（如右键菜单）。DLL劫持经常发生在这里。
Internet Explorer：IE浏览器插件。
Drivers：驱动程序。高级的Rootkit会藏在这里。
Codecs：多媒体编解码器。
Boot Execute：系统启动早期执行的程序。
Image Hijacks：映像劫持。这可以用来调试程序，也被恶意软件利用。

# Process Monitor



# 参考资料
[微软工具集套件，Sysinternals软件体验](https://zhuanlan.zhihu.com/p/614127829)
[进程资源管理器 v17.06](https://learn.microsoft.com/zh-cn/sysinternals/downloads/process-explorer)
[Process Explorer v17.06](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)
