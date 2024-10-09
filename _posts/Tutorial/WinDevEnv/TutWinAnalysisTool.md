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



# 参考资料
[微软工具集套件，Sysinternals软件体验](https://zhuanlan.zhihu.com/p/614127829)
[进程资源管理器 v17.06](https://learn.microsoft.com/zh-cn/sysinternals/downloads/process-explorer)
[Process Explorer v17.06](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)
